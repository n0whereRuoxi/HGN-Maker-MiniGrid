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

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479088 - SURFACE
      ?auto_479089 - SURFACE
    )
    :vars
    (
      ?auto_479090 - HOIST
      ?auto_479091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479090 ?auto_479091 ) ( SURFACE-AT ?auto_479088 ?auto_479091 ) ( CLEAR ?auto_479088 ) ( LIFTING ?auto_479090 ?auto_479089 ) ( IS-CRATE ?auto_479089 ) ( not ( = ?auto_479088 ?auto_479089 ) ) )
    :subtasks
    ( ( !DROP ?auto_479090 ?auto_479089 ?auto_479088 ?auto_479091 )
      ( MAKE-1CRATE-VERIFY ?auto_479088 ?auto_479089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479092 - SURFACE
      ?auto_479093 - SURFACE
    )
    :vars
    (
      ?auto_479094 - HOIST
      ?auto_479095 - PLACE
      ?auto_479096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479094 ?auto_479095 ) ( SURFACE-AT ?auto_479092 ?auto_479095 ) ( CLEAR ?auto_479092 ) ( IS-CRATE ?auto_479093 ) ( not ( = ?auto_479092 ?auto_479093 ) ) ( TRUCK-AT ?auto_479096 ?auto_479095 ) ( AVAILABLE ?auto_479094 ) ( IN ?auto_479093 ?auto_479096 ) )
    :subtasks
    ( ( !UNLOAD ?auto_479094 ?auto_479093 ?auto_479096 ?auto_479095 )
      ( MAKE-1CRATE ?auto_479092 ?auto_479093 )
      ( MAKE-1CRATE-VERIFY ?auto_479092 ?auto_479093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479097 - SURFACE
      ?auto_479098 - SURFACE
    )
    :vars
    (
      ?auto_479100 - HOIST
      ?auto_479101 - PLACE
      ?auto_479099 - TRUCK
      ?auto_479102 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479100 ?auto_479101 ) ( SURFACE-AT ?auto_479097 ?auto_479101 ) ( CLEAR ?auto_479097 ) ( IS-CRATE ?auto_479098 ) ( not ( = ?auto_479097 ?auto_479098 ) ) ( AVAILABLE ?auto_479100 ) ( IN ?auto_479098 ?auto_479099 ) ( TRUCK-AT ?auto_479099 ?auto_479102 ) ( not ( = ?auto_479102 ?auto_479101 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_479099 ?auto_479102 ?auto_479101 )
      ( MAKE-1CRATE ?auto_479097 ?auto_479098 )
      ( MAKE-1CRATE-VERIFY ?auto_479097 ?auto_479098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479103 - SURFACE
      ?auto_479104 - SURFACE
    )
    :vars
    (
      ?auto_479107 - HOIST
      ?auto_479106 - PLACE
      ?auto_479105 - TRUCK
      ?auto_479108 - PLACE
      ?auto_479109 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479107 ?auto_479106 ) ( SURFACE-AT ?auto_479103 ?auto_479106 ) ( CLEAR ?auto_479103 ) ( IS-CRATE ?auto_479104 ) ( not ( = ?auto_479103 ?auto_479104 ) ) ( AVAILABLE ?auto_479107 ) ( TRUCK-AT ?auto_479105 ?auto_479108 ) ( not ( = ?auto_479108 ?auto_479106 ) ) ( HOIST-AT ?auto_479109 ?auto_479108 ) ( LIFTING ?auto_479109 ?auto_479104 ) ( not ( = ?auto_479107 ?auto_479109 ) ) )
    :subtasks
    ( ( !LOAD ?auto_479109 ?auto_479104 ?auto_479105 ?auto_479108 )
      ( MAKE-1CRATE ?auto_479103 ?auto_479104 )
      ( MAKE-1CRATE-VERIFY ?auto_479103 ?auto_479104 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479110 - SURFACE
      ?auto_479111 - SURFACE
    )
    :vars
    (
      ?auto_479114 - HOIST
      ?auto_479116 - PLACE
      ?auto_479113 - TRUCK
      ?auto_479112 - PLACE
      ?auto_479115 - HOIST
      ?auto_479117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479114 ?auto_479116 ) ( SURFACE-AT ?auto_479110 ?auto_479116 ) ( CLEAR ?auto_479110 ) ( IS-CRATE ?auto_479111 ) ( not ( = ?auto_479110 ?auto_479111 ) ) ( AVAILABLE ?auto_479114 ) ( TRUCK-AT ?auto_479113 ?auto_479112 ) ( not ( = ?auto_479112 ?auto_479116 ) ) ( HOIST-AT ?auto_479115 ?auto_479112 ) ( not ( = ?auto_479114 ?auto_479115 ) ) ( AVAILABLE ?auto_479115 ) ( SURFACE-AT ?auto_479111 ?auto_479112 ) ( ON ?auto_479111 ?auto_479117 ) ( CLEAR ?auto_479111 ) ( not ( = ?auto_479110 ?auto_479117 ) ) ( not ( = ?auto_479111 ?auto_479117 ) ) )
    :subtasks
    ( ( !LIFT ?auto_479115 ?auto_479111 ?auto_479117 ?auto_479112 )
      ( MAKE-1CRATE ?auto_479110 ?auto_479111 )
      ( MAKE-1CRATE-VERIFY ?auto_479110 ?auto_479111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479118 - SURFACE
      ?auto_479119 - SURFACE
    )
    :vars
    (
      ?auto_479121 - HOIST
      ?auto_479120 - PLACE
      ?auto_479125 - PLACE
      ?auto_479122 - HOIST
      ?auto_479123 - SURFACE
      ?auto_479124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479121 ?auto_479120 ) ( SURFACE-AT ?auto_479118 ?auto_479120 ) ( CLEAR ?auto_479118 ) ( IS-CRATE ?auto_479119 ) ( not ( = ?auto_479118 ?auto_479119 ) ) ( AVAILABLE ?auto_479121 ) ( not ( = ?auto_479125 ?auto_479120 ) ) ( HOIST-AT ?auto_479122 ?auto_479125 ) ( not ( = ?auto_479121 ?auto_479122 ) ) ( AVAILABLE ?auto_479122 ) ( SURFACE-AT ?auto_479119 ?auto_479125 ) ( ON ?auto_479119 ?auto_479123 ) ( CLEAR ?auto_479119 ) ( not ( = ?auto_479118 ?auto_479123 ) ) ( not ( = ?auto_479119 ?auto_479123 ) ) ( TRUCK-AT ?auto_479124 ?auto_479120 ) )
    :subtasks
    ( ( !DRIVE ?auto_479124 ?auto_479120 ?auto_479125 )
      ( MAKE-1CRATE ?auto_479118 ?auto_479119 )
      ( MAKE-1CRATE-VERIFY ?auto_479118 ?auto_479119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479135 - SURFACE
      ?auto_479136 - SURFACE
      ?auto_479137 - SURFACE
    )
    :vars
    (
      ?auto_479139 - HOIST
      ?auto_479138 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479139 ?auto_479138 ) ( SURFACE-AT ?auto_479136 ?auto_479138 ) ( CLEAR ?auto_479136 ) ( LIFTING ?auto_479139 ?auto_479137 ) ( IS-CRATE ?auto_479137 ) ( not ( = ?auto_479136 ?auto_479137 ) ) ( ON ?auto_479136 ?auto_479135 ) ( not ( = ?auto_479135 ?auto_479136 ) ) ( not ( = ?auto_479135 ?auto_479137 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479136 ?auto_479137 )
      ( MAKE-2CRATE-VERIFY ?auto_479135 ?auto_479136 ?auto_479137 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479145 - SURFACE
      ?auto_479146 - SURFACE
      ?auto_479147 - SURFACE
    )
    :vars
    (
      ?auto_479150 - HOIST
      ?auto_479148 - PLACE
      ?auto_479149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479150 ?auto_479148 ) ( SURFACE-AT ?auto_479146 ?auto_479148 ) ( CLEAR ?auto_479146 ) ( IS-CRATE ?auto_479147 ) ( not ( = ?auto_479146 ?auto_479147 ) ) ( TRUCK-AT ?auto_479149 ?auto_479148 ) ( AVAILABLE ?auto_479150 ) ( IN ?auto_479147 ?auto_479149 ) ( ON ?auto_479146 ?auto_479145 ) ( not ( = ?auto_479145 ?auto_479146 ) ) ( not ( = ?auto_479145 ?auto_479147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479146 ?auto_479147 )
      ( MAKE-2CRATE-VERIFY ?auto_479145 ?auto_479146 ?auto_479147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479151 - SURFACE
      ?auto_479152 - SURFACE
    )
    :vars
    (
      ?auto_479153 - HOIST
      ?auto_479155 - PLACE
      ?auto_479154 - TRUCK
      ?auto_479156 - SURFACE
      ?auto_479157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479153 ?auto_479155 ) ( SURFACE-AT ?auto_479151 ?auto_479155 ) ( CLEAR ?auto_479151 ) ( IS-CRATE ?auto_479152 ) ( not ( = ?auto_479151 ?auto_479152 ) ) ( AVAILABLE ?auto_479153 ) ( IN ?auto_479152 ?auto_479154 ) ( ON ?auto_479151 ?auto_479156 ) ( not ( = ?auto_479156 ?auto_479151 ) ) ( not ( = ?auto_479156 ?auto_479152 ) ) ( TRUCK-AT ?auto_479154 ?auto_479157 ) ( not ( = ?auto_479157 ?auto_479155 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_479154 ?auto_479157 ?auto_479155 )
      ( MAKE-2CRATE ?auto_479156 ?auto_479151 ?auto_479152 )
      ( MAKE-1CRATE-VERIFY ?auto_479151 ?auto_479152 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479158 - SURFACE
      ?auto_479159 - SURFACE
      ?auto_479160 - SURFACE
    )
    :vars
    (
      ?auto_479161 - HOIST
      ?auto_479163 - PLACE
      ?auto_479162 - TRUCK
      ?auto_479164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479161 ?auto_479163 ) ( SURFACE-AT ?auto_479159 ?auto_479163 ) ( CLEAR ?auto_479159 ) ( IS-CRATE ?auto_479160 ) ( not ( = ?auto_479159 ?auto_479160 ) ) ( AVAILABLE ?auto_479161 ) ( IN ?auto_479160 ?auto_479162 ) ( ON ?auto_479159 ?auto_479158 ) ( not ( = ?auto_479158 ?auto_479159 ) ) ( not ( = ?auto_479158 ?auto_479160 ) ) ( TRUCK-AT ?auto_479162 ?auto_479164 ) ( not ( = ?auto_479164 ?auto_479163 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479159 ?auto_479160 )
      ( MAKE-2CRATE-VERIFY ?auto_479158 ?auto_479159 ?auto_479160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479165 - SURFACE
      ?auto_479166 - SURFACE
    )
    :vars
    (
      ?auto_479171 - HOIST
      ?auto_479168 - PLACE
      ?auto_479167 - SURFACE
      ?auto_479169 - TRUCK
      ?auto_479170 - PLACE
      ?auto_479172 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479171 ?auto_479168 ) ( SURFACE-AT ?auto_479165 ?auto_479168 ) ( CLEAR ?auto_479165 ) ( IS-CRATE ?auto_479166 ) ( not ( = ?auto_479165 ?auto_479166 ) ) ( AVAILABLE ?auto_479171 ) ( ON ?auto_479165 ?auto_479167 ) ( not ( = ?auto_479167 ?auto_479165 ) ) ( not ( = ?auto_479167 ?auto_479166 ) ) ( TRUCK-AT ?auto_479169 ?auto_479170 ) ( not ( = ?auto_479170 ?auto_479168 ) ) ( HOIST-AT ?auto_479172 ?auto_479170 ) ( LIFTING ?auto_479172 ?auto_479166 ) ( not ( = ?auto_479171 ?auto_479172 ) ) )
    :subtasks
    ( ( !LOAD ?auto_479172 ?auto_479166 ?auto_479169 ?auto_479170 )
      ( MAKE-2CRATE ?auto_479167 ?auto_479165 ?auto_479166 )
      ( MAKE-1CRATE-VERIFY ?auto_479165 ?auto_479166 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479173 - SURFACE
      ?auto_479174 - SURFACE
      ?auto_479175 - SURFACE
    )
    :vars
    (
      ?auto_479177 - HOIST
      ?auto_479179 - PLACE
      ?auto_479180 - TRUCK
      ?auto_479176 - PLACE
      ?auto_479178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479177 ?auto_479179 ) ( SURFACE-AT ?auto_479174 ?auto_479179 ) ( CLEAR ?auto_479174 ) ( IS-CRATE ?auto_479175 ) ( not ( = ?auto_479174 ?auto_479175 ) ) ( AVAILABLE ?auto_479177 ) ( ON ?auto_479174 ?auto_479173 ) ( not ( = ?auto_479173 ?auto_479174 ) ) ( not ( = ?auto_479173 ?auto_479175 ) ) ( TRUCK-AT ?auto_479180 ?auto_479176 ) ( not ( = ?auto_479176 ?auto_479179 ) ) ( HOIST-AT ?auto_479178 ?auto_479176 ) ( LIFTING ?auto_479178 ?auto_479175 ) ( not ( = ?auto_479177 ?auto_479178 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479174 ?auto_479175 )
      ( MAKE-2CRATE-VERIFY ?auto_479173 ?auto_479174 ?auto_479175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479181 - SURFACE
      ?auto_479182 - SURFACE
    )
    :vars
    (
      ?auto_479185 - HOIST
      ?auto_479188 - PLACE
      ?auto_479183 - SURFACE
      ?auto_479187 - TRUCK
      ?auto_479186 - PLACE
      ?auto_479184 - HOIST
      ?auto_479189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479185 ?auto_479188 ) ( SURFACE-AT ?auto_479181 ?auto_479188 ) ( CLEAR ?auto_479181 ) ( IS-CRATE ?auto_479182 ) ( not ( = ?auto_479181 ?auto_479182 ) ) ( AVAILABLE ?auto_479185 ) ( ON ?auto_479181 ?auto_479183 ) ( not ( = ?auto_479183 ?auto_479181 ) ) ( not ( = ?auto_479183 ?auto_479182 ) ) ( TRUCK-AT ?auto_479187 ?auto_479186 ) ( not ( = ?auto_479186 ?auto_479188 ) ) ( HOIST-AT ?auto_479184 ?auto_479186 ) ( not ( = ?auto_479185 ?auto_479184 ) ) ( AVAILABLE ?auto_479184 ) ( SURFACE-AT ?auto_479182 ?auto_479186 ) ( ON ?auto_479182 ?auto_479189 ) ( CLEAR ?auto_479182 ) ( not ( = ?auto_479181 ?auto_479189 ) ) ( not ( = ?auto_479182 ?auto_479189 ) ) ( not ( = ?auto_479183 ?auto_479189 ) ) )
    :subtasks
    ( ( !LIFT ?auto_479184 ?auto_479182 ?auto_479189 ?auto_479186 )
      ( MAKE-2CRATE ?auto_479183 ?auto_479181 ?auto_479182 )
      ( MAKE-1CRATE-VERIFY ?auto_479181 ?auto_479182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479190 - SURFACE
      ?auto_479191 - SURFACE
      ?auto_479192 - SURFACE
    )
    :vars
    (
      ?auto_479194 - HOIST
      ?auto_479195 - PLACE
      ?auto_479197 - TRUCK
      ?auto_479196 - PLACE
      ?auto_479193 - HOIST
      ?auto_479198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479194 ?auto_479195 ) ( SURFACE-AT ?auto_479191 ?auto_479195 ) ( CLEAR ?auto_479191 ) ( IS-CRATE ?auto_479192 ) ( not ( = ?auto_479191 ?auto_479192 ) ) ( AVAILABLE ?auto_479194 ) ( ON ?auto_479191 ?auto_479190 ) ( not ( = ?auto_479190 ?auto_479191 ) ) ( not ( = ?auto_479190 ?auto_479192 ) ) ( TRUCK-AT ?auto_479197 ?auto_479196 ) ( not ( = ?auto_479196 ?auto_479195 ) ) ( HOIST-AT ?auto_479193 ?auto_479196 ) ( not ( = ?auto_479194 ?auto_479193 ) ) ( AVAILABLE ?auto_479193 ) ( SURFACE-AT ?auto_479192 ?auto_479196 ) ( ON ?auto_479192 ?auto_479198 ) ( CLEAR ?auto_479192 ) ( not ( = ?auto_479191 ?auto_479198 ) ) ( not ( = ?auto_479192 ?auto_479198 ) ) ( not ( = ?auto_479190 ?auto_479198 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479191 ?auto_479192 )
      ( MAKE-2CRATE-VERIFY ?auto_479190 ?auto_479191 ?auto_479192 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479199 - SURFACE
      ?auto_479200 - SURFACE
    )
    :vars
    (
      ?auto_479202 - HOIST
      ?auto_479203 - PLACE
      ?auto_479207 - SURFACE
      ?auto_479201 - PLACE
      ?auto_479206 - HOIST
      ?auto_479204 - SURFACE
      ?auto_479205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479202 ?auto_479203 ) ( SURFACE-AT ?auto_479199 ?auto_479203 ) ( CLEAR ?auto_479199 ) ( IS-CRATE ?auto_479200 ) ( not ( = ?auto_479199 ?auto_479200 ) ) ( AVAILABLE ?auto_479202 ) ( ON ?auto_479199 ?auto_479207 ) ( not ( = ?auto_479207 ?auto_479199 ) ) ( not ( = ?auto_479207 ?auto_479200 ) ) ( not ( = ?auto_479201 ?auto_479203 ) ) ( HOIST-AT ?auto_479206 ?auto_479201 ) ( not ( = ?auto_479202 ?auto_479206 ) ) ( AVAILABLE ?auto_479206 ) ( SURFACE-AT ?auto_479200 ?auto_479201 ) ( ON ?auto_479200 ?auto_479204 ) ( CLEAR ?auto_479200 ) ( not ( = ?auto_479199 ?auto_479204 ) ) ( not ( = ?auto_479200 ?auto_479204 ) ) ( not ( = ?auto_479207 ?auto_479204 ) ) ( TRUCK-AT ?auto_479205 ?auto_479203 ) )
    :subtasks
    ( ( !DRIVE ?auto_479205 ?auto_479203 ?auto_479201 )
      ( MAKE-2CRATE ?auto_479207 ?auto_479199 ?auto_479200 )
      ( MAKE-1CRATE-VERIFY ?auto_479199 ?auto_479200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479208 - SURFACE
      ?auto_479209 - SURFACE
      ?auto_479210 - SURFACE
    )
    :vars
    (
      ?auto_479213 - HOIST
      ?auto_479211 - PLACE
      ?auto_479215 - PLACE
      ?auto_479214 - HOIST
      ?auto_479212 - SURFACE
      ?auto_479216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479213 ?auto_479211 ) ( SURFACE-AT ?auto_479209 ?auto_479211 ) ( CLEAR ?auto_479209 ) ( IS-CRATE ?auto_479210 ) ( not ( = ?auto_479209 ?auto_479210 ) ) ( AVAILABLE ?auto_479213 ) ( ON ?auto_479209 ?auto_479208 ) ( not ( = ?auto_479208 ?auto_479209 ) ) ( not ( = ?auto_479208 ?auto_479210 ) ) ( not ( = ?auto_479215 ?auto_479211 ) ) ( HOIST-AT ?auto_479214 ?auto_479215 ) ( not ( = ?auto_479213 ?auto_479214 ) ) ( AVAILABLE ?auto_479214 ) ( SURFACE-AT ?auto_479210 ?auto_479215 ) ( ON ?auto_479210 ?auto_479212 ) ( CLEAR ?auto_479210 ) ( not ( = ?auto_479209 ?auto_479212 ) ) ( not ( = ?auto_479210 ?auto_479212 ) ) ( not ( = ?auto_479208 ?auto_479212 ) ) ( TRUCK-AT ?auto_479216 ?auto_479211 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479209 ?auto_479210 )
      ( MAKE-2CRATE-VERIFY ?auto_479208 ?auto_479209 ?auto_479210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479217 - SURFACE
      ?auto_479218 - SURFACE
    )
    :vars
    (
      ?auto_479225 - HOIST
      ?auto_479224 - PLACE
      ?auto_479221 - SURFACE
      ?auto_479220 - PLACE
      ?auto_479223 - HOIST
      ?auto_479219 - SURFACE
      ?auto_479222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479225 ?auto_479224 ) ( IS-CRATE ?auto_479218 ) ( not ( = ?auto_479217 ?auto_479218 ) ) ( not ( = ?auto_479221 ?auto_479217 ) ) ( not ( = ?auto_479221 ?auto_479218 ) ) ( not ( = ?auto_479220 ?auto_479224 ) ) ( HOIST-AT ?auto_479223 ?auto_479220 ) ( not ( = ?auto_479225 ?auto_479223 ) ) ( AVAILABLE ?auto_479223 ) ( SURFACE-AT ?auto_479218 ?auto_479220 ) ( ON ?auto_479218 ?auto_479219 ) ( CLEAR ?auto_479218 ) ( not ( = ?auto_479217 ?auto_479219 ) ) ( not ( = ?auto_479218 ?auto_479219 ) ) ( not ( = ?auto_479221 ?auto_479219 ) ) ( TRUCK-AT ?auto_479222 ?auto_479224 ) ( SURFACE-AT ?auto_479221 ?auto_479224 ) ( CLEAR ?auto_479221 ) ( LIFTING ?auto_479225 ?auto_479217 ) ( IS-CRATE ?auto_479217 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479221 ?auto_479217 )
      ( MAKE-2CRATE ?auto_479221 ?auto_479217 ?auto_479218 )
      ( MAKE-1CRATE-VERIFY ?auto_479217 ?auto_479218 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479226 - SURFACE
      ?auto_479227 - SURFACE
      ?auto_479228 - SURFACE
    )
    :vars
    (
      ?auto_479229 - HOIST
      ?auto_479231 - PLACE
      ?auto_479234 - PLACE
      ?auto_479230 - HOIST
      ?auto_479233 - SURFACE
      ?auto_479232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479229 ?auto_479231 ) ( IS-CRATE ?auto_479228 ) ( not ( = ?auto_479227 ?auto_479228 ) ) ( not ( = ?auto_479226 ?auto_479227 ) ) ( not ( = ?auto_479226 ?auto_479228 ) ) ( not ( = ?auto_479234 ?auto_479231 ) ) ( HOIST-AT ?auto_479230 ?auto_479234 ) ( not ( = ?auto_479229 ?auto_479230 ) ) ( AVAILABLE ?auto_479230 ) ( SURFACE-AT ?auto_479228 ?auto_479234 ) ( ON ?auto_479228 ?auto_479233 ) ( CLEAR ?auto_479228 ) ( not ( = ?auto_479227 ?auto_479233 ) ) ( not ( = ?auto_479228 ?auto_479233 ) ) ( not ( = ?auto_479226 ?auto_479233 ) ) ( TRUCK-AT ?auto_479232 ?auto_479231 ) ( SURFACE-AT ?auto_479226 ?auto_479231 ) ( CLEAR ?auto_479226 ) ( LIFTING ?auto_479229 ?auto_479227 ) ( IS-CRATE ?auto_479227 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479227 ?auto_479228 )
      ( MAKE-2CRATE-VERIFY ?auto_479226 ?auto_479227 ?auto_479228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479235 - SURFACE
      ?auto_479236 - SURFACE
    )
    :vars
    (
      ?auto_479242 - HOIST
      ?auto_479237 - PLACE
      ?auto_479240 - SURFACE
      ?auto_479238 - PLACE
      ?auto_479241 - HOIST
      ?auto_479239 - SURFACE
      ?auto_479243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479242 ?auto_479237 ) ( IS-CRATE ?auto_479236 ) ( not ( = ?auto_479235 ?auto_479236 ) ) ( not ( = ?auto_479240 ?auto_479235 ) ) ( not ( = ?auto_479240 ?auto_479236 ) ) ( not ( = ?auto_479238 ?auto_479237 ) ) ( HOIST-AT ?auto_479241 ?auto_479238 ) ( not ( = ?auto_479242 ?auto_479241 ) ) ( AVAILABLE ?auto_479241 ) ( SURFACE-AT ?auto_479236 ?auto_479238 ) ( ON ?auto_479236 ?auto_479239 ) ( CLEAR ?auto_479236 ) ( not ( = ?auto_479235 ?auto_479239 ) ) ( not ( = ?auto_479236 ?auto_479239 ) ) ( not ( = ?auto_479240 ?auto_479239 ) ) ( TRUCK-AT ?auto_479243 ?auto_479237 ) ( SURFACE-AT ?auto_479240 ?auto_479237 ) ( CLEAR ?auto_479240 ) ( IS-CRATE ?auto_479235 ) ( AVAILABLE ?auto_479242 ) ( IN ?auto_479235 ?auto_479243 ) )
    :subtasks
    ( ( !UNLOAD ?auto_479242 ?auto_479235 ?auto_479243 ?auto_479237 )
      ( MAKE-2CRATE ?auto_479240 ?auto_479235 ?auto_479236 )
      ( MAKE-1CRATE-VERIFY ?auto_479235 ?auto_479236 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479244 - SURFACE
      ?auto_479245 - SURFACE
      ?auto_479246 - SURFACE
    )
    :vars
    (
      ?auto_479250 - HOIST
      ?auto_479247 - PLACE
      ?auto_479248 - PLACE
      ?auto_479252 - HOIST
      ?auto_479251 - SURFACE
      ?auto_479249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479250 ?auto_479247 ) ( IS-CRATE ?auto_479246 ) ( not ( = ?auto_479245 ?auto_479246 ) ) ( not ( = ?auto_479244 ?auto_479245 ) ) ( not ( = ?auto_479244 ?auto_479246 ) ) ( not ( = ?auto_479248 ?auto_479247 ) ) ( HOIST-AT ?auto_479252 ?auto_479248 ) ( not ( = ?auto_479250 ?auto_479252 ) ) ( AVAILABLE ?auto_479252 ) ( SURFACE-AT ?auto_479246 ?auto_479248 ) ( ON ?auto_479246 ?auto_479251 ) ( CLEAR ?auto_479246 ) ( not ( = ?auto_479245 ?auto_479251 ) ) ( not ( = ?auto_479246 ?auto_479251 ) ) ( not ( = ?auto_479244 ?auto_479251 ) ) ( TRUCK-AT ?auto_479249 ?auto_479247 ) ( SURFACE-AT ?auto_479244 ?auto_479247 ) ( CLEAR ?auto_479244 ) ( IS-CRATE ?auto_479245 ) ( AVAILABLE ?auto_479250 ) ( IN ?auto_479245 ?auto_479249 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479245 ?auto_479246 )
      ( MAKE-2CRATE-VERIFY ?auto_479244 ?auto_479245 ?auto_479246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479289 - SURFACE
      ?auto_479290 - SURFACE
    )
    :vars
    (
      ?auto_479292 - HOIST
      ?auto_479295 - PLACE
      ?auto_479296 - SURFACE
      ?auto_479294 - PLACE
      ?auto_479293 - HOIST
      ?auto_479291 - SURFACE
      ?auto_479297 - TRUCK
      ?auto_479298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479292 ?auto_479295 ) ( SURFACE-AT ?auto_479289 ?auto_479295 ) ( CLEAR ?auto_479289 ) ( IS-CRATE ?auto_479290 ) ( not ( = ?auto_479289 ?auto_479290 ) ) ( AVAILABLE ?auto_479292 ) ( ON ?auto_479289 ?auto_479296 ) ( not ( = ?auto_479296 ?auto_479289 ) ) ( not ( = ?auto_479296 ?auto_479290 ) ) ( not ( = ?auto_479294 ?auto_479295 ) ) ( HOIST-AT ?auto_479293 ?auto_479294 ) ( not ( = ?auto_479292 ?auto_479293 ) ) ( AVAILABLE ?auto_479293 ) ( SURFACE-AT ?auto_479290 ?auto_479294 ) ( ON ?auto_479290 ?auto_479291 ) ( CLEAR ?auto_479290 ) ( not ( = ?auto_479289 ?auto_479291 ) ) ( not ( = ?auto_479290 ?auto_479291 ) ) ( not ( = ?auto_479296 ?auto_479291 ) ) ( TRUCK-AT ?auto_479297 ?auto_479298 ) ( not ( = ?auto_479298 ?auto_479295 ) ) ( not ( = ?auto_479294 ?auto_479298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_479297 ?auto_479298 ?auto_479295 )
      ( MAKE-1CRATE ?auto_479289 ?auto_479290 )
      ( MAKE-1CRATE-VERIFY ?auto_479289 ?auto_479290 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479328 - SURFACE
      ?auto_479329 - SURFACE
      ?auto_479330 - SURFACE
      ?auto_479331 - SURFACE
    )
    :vars
    (
      ?auto_479332 - HOIST
      ?auto_479333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479332 ?auto_479333 ) ( SURFACE-AT ?auto_479330 ?auto_479333 ) ( CLEAR ?auto_479330 ) ( LIFTING ?auto_479332 ?auto_479331 ) ( IS-CRATE ?auto_479331 ) ( not ( = ?auto_479330 ?auto_479331 ) ) ( ON ?auto_479329 ?auto_479328 ) ( ON ?auto_479330 ?auto_479329 ) ( not ( = ?auto_479328 ?auto_479329 ) ) ( not ( = ?auto_479328 ?auto_479330 ) ) ( not ( = ?auto_479328 ?auto_479331 ) ) ( not ( = ?auto_479329 ?auto_479330 ) ) ( not ( = ?auto_479329 ?auto_479331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479330 ?auto_479331 )
      ( MAKE-3CRATE-VERIFY ?auto_479328 ?auto_479329 ?auto_479330 ?auto_479331 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479345 - SURFACE
      ?auto_479346 - SURFACE
      ?auto_479347 - SURFACE
      ?auto_479348 - SURFACE
    )
    :vars
    (
      ?auto_479351 - HOIST
      ?auto_479349 - PLACE
      ?auto_479350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479351 ?auto_479349 ) ( SURFACE-AT ?auto_479347 ?auto_479349 ) ( CLEAR ?auto_479347 ) ( IS-CRATE ?auto_479348 ) ( not ( = ?auto_479347 ?auto_479348 ) ) ( TRUCK-AT ?auto_479350 ?auto_479349 ) ( AVAILABLE ?auto_479351 ) ( IN ?auto_479348 ?auto_479350 ) ( ON ?auto_479347 ?auto_479346 ) ( not ( = ?auto_479346 ?auto_479347 ) ) ( not ( = ?auto_479346 ?auto_479348 ) ) ( ON ?auto_479346 ?auto_479345 ) ( not ( = ?auto_479345 ?auto_479346 ) ) ( not ( = ?auto_479345 ?auto_479347 ) ) ( not ( = ?auto_479345 ?auto_479348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479346 ?auto_479347 ?auto_479348 )
      ( MAKE-3CRATE-VERIFY ?auto_479345 ?auto_479346 ?auto_479347 ?auto_479348 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479366 - SURFACE
      ?auto_479367 - SURFACE
      ?auto_479368 - SURFACE
      ?auto_479369 - SURFACE
    )
    :vars
    (
      ?auto_479370 - HOIST
      ?auto_479371 - PLACE
      ?auto_479373 - TRUCK
      ?auto_479372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479370 ?auto_479371 ) ( SURFACE-AT ?auto_479368 ?auto_479371 ) ( CLEAR ?auto_479368 ) ( IS-CRATE ?auto_479369 ) ( not ( = ?auto_479368 ?auto_479369 ) ) ( AVAILABLE ?auto_479370 ) ( IN ?auto_479369 ?auto_479373 ) ( ON ?auto_479368 ?auto_479367 ) ( not ( = ?auto_479367 ?auto_479368 ) ) ( not ( = ?auto_479367 ?auto_479369 ) ) ( TRUCK-AT ?auto_479373 ?auto_479372 ) ( not ( = ?auto_479372 ?auto_479371 ) ) ( ON ?auto_479367 ?auto_479366 ) ( not ( = ?auto_479366 ?auto_479367 ) ) ( not ( = ?auto_479366 ?auto_479368 ) ) ( not ( = ?auto_479366 ?auto_479369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479367 ?auto_479368 ?auto_479369 )
      ( MAKE-3CRATE-VERIFY ?auto_479366 ?auto_479367 ?auto_479368 ?auto_479369 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479390 - SURFACE
      ?auto_479391 - SURFACE
      ?auto_479392 - SURFACE
      ?auto_479393 - SURFACE
    )
    :vars
    (
      ?auto_479394 - HOIST
      ?auto_479398 - PLACE
      ?auto_479397 - TRUCK
      ?auto_479396 - PLACE
      ?auto_479395 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479394 ?auto_479398 ) ( SURFACE-AT ?auto_479392 ?auto_479398 ) ( CLEAR ?auto_479392 ) ( IS-CRATE ?auto_479393 ) ( not ( = ?auto_479392 ?auto_479393 ) ) ( AVAILABLE ?auto_479394 ) ( ON ?auto_479392 ?auto_479391 ) ( not ( = ?auto_479391 ?auto_479392 ) ) ( not ( = ?auto_479391 ?auto_479393 ) ) ( TRUCK-AT ?auto_479397 ?auto_479396 ) ( not ( = ?auto_479396 ?auto_479398 ) ) ( HOIST-AT ?auto_479395 ?auto_479396 ) ( LIFTING ?auto_479395 ?auto_479393 ) ( not ( = ?auto_479394 ?auto_479395 ) ) ( ON ?auto_479391 ?auto_479390 ) ( not ( = ?auto_479390 ?auto_479391 ) ) ( not ( = ?auto_479390 ?auto_479392 ) ) ( not ( = ?auto_479390 ?auto_479393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479391 ?auto_479392 ?auto_479393 )
      ( MAKE-3CRATE-VERIFY ?auto_479390 ?auto_479391 ?auto_479392 ?auto_479393 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479417 - SURFACE
      ?auto_479418 - SURFACE
      ?auto_479419 - SURFACE
      ?auto_479420 - SURFACE
    )
    :vars
    (
      ?auto_479426 - HOIST
      ?auto_479425 - PLACE
      ?auto_479421 - TRUCK
      ?auto_479423 - PLACE
      ?auto_479422 - HOIST
      ?auto_479424 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479426 ?auto_479425 ) ( SURFACE-AT ?auto_479419 ?auto_479425 ) ( CLEAR ?auto_479419 ) ( IS-CRATE ?auto_479420 ) ( not ( = ?auto_479419 ?auto_479420 ) ) ( AVAILABLE ?auto_479426 ) ( ON ?auto_479419 ?auto_479418 ) ( not ( = ?auto_479418 ?auto_479419 ) ) ( not ( = ?auto_479418 ?auto_479420 ) ) ( TRUCK-AT ?auto_479421 ?auto_479423 ) ( not ( = ?auto_479423 ?auto_479425 ) ) ( HOIST-AT ?auto_479422 ?auto_479423 ) ( not ( = ?auto_479426 ?auto_479422 ) ) ( AVAILABLE ?auto_479422 ) ( SURFACE-AT ?auto_479420 ?auto_479423 ) ( ON ?auto_479420 ?auto_479424 ) ( CLEAR ?auto_479420 ) ( not ( = ?auto_479419 ?auto_479424 ) ) ( not ( = ?auto_479420 ?auto_479424 ) ) ( not ( = ?auto_479418 ?auto_479424 ) ) ( ON ?auto_479418 ?auto_479417 ) ( not ( = ?auto_479417 ?auto_479418 ) ) ( not ( = ?auto_479417 ?auto_479419 ) ) ( not ( = ?auto_479417 ?auto_479420 ) ) ( not ( = ?auto_479417 ?auto_479424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479418 ?auto_479419 ?auto_479420 )
      ( MAKE-3CRATE-VERIFY ?auto_479417 ?auto_479418 ?auto_479419 ?auto_479420 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479445 - SURFACE
      ?auto_479446 - SURFACE
      ?auto_479447 - SURFACE
      ?auto_479448 - SURFACE
    )
    :vars
    (
      ?auto_479453 - HOIST
      ?auto_479452 - PLACE
      ?auto_479454 - PLACE
      ?auto_479451 - HOIST
      ?auto_479450 - SURFACE
      ?auto_479449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479453 ?auto_479452 ) ( SURFACE-AT ?auto_479447 ?auto_479452 ) ( CLEAR ?auto_479447 ) ( IS-CRATE ?auto_479448 ) ( not ( = ?auto_479447 ?auto_479448 ) ) ( AVAILABLE ?auto_479453 ) ( ON ?auto_479447 ?auto_479446 ) ( not ( = ?auto_479446 ?auto_479447 ) ) ( not ( = ?auto_479446 ?auto_479448 ) ) ( not ( = ?auto_479454 ?auto_479452 ) ) ( HOIST-AT ?auto_479451 ?auto_479454 ) ( not ( = ?auto_479453 ?auto_479451 ) ) ( AVAILABLE ?auto_479451 ) ( SURFACE-AT ?auto_479448 ?auto_479454 ) ( ON ?auto_479448 ?auto_479450 ) ( CLEAR ?auto_479448 ) ( not ( = ?auto_479447 ?auto_479450 ) ) ( not ( = ?auto_479448 ?auto_479450 ) ) ( not ( = ?auto_479446 ?auto_479450 ) ) ( TRUCK-AT ?auto_479449 ?auto_479452 ) ( ON ?auto_479446 ?auto_479445 ) ( not ( = ?auto_479445 ?auto_479446 ) ) ( not ( = ?auto_479445 ?auto_479447 ) ) ( not ( = ?auto_479445 ?auto_479448 ) ) ( not ( = ?auto_479445 ?auto_479450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479446 ?auto_479447 ?auto_479448 )
      ( MAKE-3CRATE-VERIFY ?auto_479445 ?auto_479446 ?auto_479447 ?auto_479448 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479473 - SURFACE
      ?auto_479474 - SURFACE
      ?auto_479475 - SURFACE
      ?auto_479476 - SURFACE
    )
    :vars
    (
      ?auto_479481 - HOIST
      ?auto_479478 - PLACE
      ?auto_479477 - PLACE
      ?auto_479479 - HOIST
      ?auto_479480 - SURFACE
      ?auto_479482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479481 ?auto_479478 ) ( IS-CRATE ?auto_479476 ) ( not ( = ?auto_479475 ?auto_479476 ) ) ( not ( = ?auto_479474 ?auto_479475 ) ) ( not ( = ?auto_479474 ?auto_479476 ) ) ( not ( = ?auto_479477 ?auto_479478 ) ) ( HOIST-AT ?auto_479479 ?auto_479477 ) ( not ( = ?auto_479481 ?auto_479479 ) ) ( AVAILABLE ?auto_479479 ) ( SURFACE-AT ?auto_479476 ?auto_479477 ) ( ON ?auto_479476 ?auto_479480 ) ( CLEAR ?auto_479476 ) ( not ( = ?auto_479475 ?auto_479480 ) ) ( not ( = ?auto_479476 ?auto_479480 ) ) ( not ( = ?auto_479474 ?auto_479480 ) ) ( TRUCK-AT ?auto_479482 ?auto_479478 ) ( SURFACE-AT ?auto_479474 ?auto_479478 ) ( CLEAR ?auto_479474 ) ( LIFTING ?auto_479481 ?auto_479475 ) ( IS-CRATE ?auto_479475 ) ( ON ?auto_479474 ?auto_479473 ) ( not ( = ?auto_479473 ?auto_479474 ) ) ( not ( = ?auto_479473 ?auto_479475 ) ) ( not ( = ?auto_479473 ?auto_479476 ) ) ( not ( = ?auto_479473 ?auto_479480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479474 ?auto_479475 ?auto_479476 )
      ( MAKE-3CRATE-VERIFY ?auto_479473 ?auto_479474 ?auto_479475 ?auto_479476 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479501 - SURFACE
      ?auto_479502 - SURFACE
      ?auto_479503 - SURFACE
      ?auto_479504 - SURFACE
    )
    :vars
    (
      ?auto_479506 - HOIST
      ?auto_479510 - PLACE
      ?auto_479508 - PLACE
      ?auto_479507 - HOIST
      ?auto_479505 - SURFACE
      ?auto_479509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479506 ?auto_479510 ) ( IS-CRATE ?auto_479504 ) ( not ( = ?auto_479503 ?auto_479504 ) ) ( not ( = ?auto_479502 ?auto_479503 ) ) ( not ( = ?auto_479502 ?auto_479504 ) ) ( not ( = ?auto_479508 ?auto_479510 ) ) ( HOIST-AT ?auto_479507 ?auto_479508 ) ( not ( = ?auto_479506 ?auto_479507 ) ) ( AVAILABLE ?auto_479507 ) ( SURFACE-AT ?auto_479504 ?auto_479508 ) ( ON ?auto_479504 ?auto_479505 ) ( CLEAR ?auto_479504 ) ( not ( = ?auto_479503 ?auto_479505 ) ) ( not ( = ?auto_479504 ?auto_479505 ) ) ( not ( = ?auto_479502 ?auto_479505 ) ) ( TRUCK-AT ?auto_479509 ?auto_479510 ) ( SURFACE-AT ?auto_479502 ?auto_479510 ) ( CLEAR ?auto_479502 ) ( IS-CRATE ?auto_479503 ) ( AVAILABLE ?auto_479506 ) ( IN ?auto_479503 ?auto_479509 ) ( ON ?auto_479502 ?auto_479501 ) ( not ( = ?auto_479501 ?auto_479502 ) ) ( not ( = ?auto_479501 ?auto_479503 ) ) ( not ( = ?auto_479501 ?auto_479504 ) ) ( not ( = ?auto_479501 ?auto_479505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479502 ?auto_479503 ?auto_479504 )
      ( MAKE-3CRATE-VERIFY ?auto_479501 ?auto_479502 ?auto_479503 ?auto_479504 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479792 - SURFACE
      ?auto_479793 - SURFACE
      ?auto_479794 - SURFACE
      ?auto_479795 - SURFACE
      ?auto_479796 - SURFACE
    )
    :vars
    (
      ?auto_479797 - HOIST
      ?auto_479798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479797 ?auto_479798 ) ( SURFACE-AT ?auto_479795 ?auto_479798 ) ( CLEAR ?auto_479795 ) ( LIFTING ?auto_479797 ?auto_479796 ) ( IS-CRATE ?auto_479796 ) ( not ( = ?auto_479795 ?auto_479796 ) ) ( ON ?auto_479793 ?auto_479792 ) ( ON ?auto_479794 ?auto_479793 ) ( ON ?auto_479795 ?auto_479794 ) ( not ( = ?auto_479792 ?auto_479793 ) ) ( not ( = ?auto_479792 ?auto_479794 ) ) ( not ( = ?auto_479792 ?auto_479795 ) ) ( not ( = ?auto_479792 ?auto_479796 ) ) ( not ( = ?auto_479793 ?auto_479794 ) ) ( not ( = ?auto_479793 ?auto_479795 ) ) ( not ( = ?auto_479793 ?auto_479796 ) ) ( not ( = ?auto_479794 ?auto_479795 ) ) ( not ( = ?auto_479794 ?auto_479796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479795 ?auto_479796 )
      ( MAKE-4CRATE-VERIFY ?auto_479792 ?auto_479793 ?auto_479794 ?auto_479795 ?auto_479796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479817 - SURFACE
      ?auto_479818 - SURFACE
      ?auto_479819 - SURFACE
      ?auto_479820 - SURFACE
      ?auto_479821 - SURFACE
    )
    :vars
    (
      ?auto_479822 - HOIST
      ?auto_479823 - PLACE
      ?auto_479824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479822 ?auto_479823 ) ( SURFACE-AT ?auto_479820 ?auto_479823 ) ( CLEAR ?auto_479820 ) ( IS-CRATE ?auto_479821 ) ( not ( = ?auto_479820 ?auto_479821 ) ) ( TRUCK-AT ?auto_479824 ?auto_479823 ) ( AVAILABLE ?auto_479822 ) ( IN ?auto_479821 ?auto_479824 ) ( ON ?auto_479820 ?auto_479819 ) ( not ( = ?auto_479819 ?auto_479820 ) ) ( not ( = ?auto_479819 ?auto_479821 ) ) ( ON ?auto_479818 ?auto_479817 ) ( ON ?auto_479819 ?auto_479818 ) ( not ( = ?auto_479817 ?auto_479818 ) ) ( not ( = ?auto_479817 ?auto_479819 ) ) ( not ( = ?auto_479817 ?auto_479820 ) ) ( not ( = ?auto_479817 ?auto_479821 ) ) ( not ( = ?auto_479818 ?auto_479819 ) ) ( not ( = ?auto_479818 ?auto_479820 ) ) ( not ( = ?auto_479818 ?auto_479821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479819 ?auto_479820 ?auto_479821 )
      ( MAKE-4CRATE-VERIFY ?auto_479817 ?auto_479818 ?auto_479819 ?auto_479820 ?auto_479821 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479847 - SURFACE
      ?auto_479848 - SURFACE
      ?auto_479849 - SURFACE
      ?auto_479850 - SURFACE
      ?auto_479851 - SURFACE
    )
    :vars
    (
      ?auto_479852 - HOIST
      ?auto_479855 - PLACE
      ?auto_479853 - TRUCK
      ?auto_479854 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479852 ?auto_479855 ) ( SURFACE-AT ?auto_479850 ?auto_479855 ) ( CLEAR ?auto_479850 ) ( IS-CRATE ?auto_479851 ) ( not ( = ?auto_479850 ?auto_479851 ) ) ( AVAILABLE ?auto_479852 ) ( IN ?auto_479851 ?auto_479853 ) ( ON ?auto_479850 ?auto_479849 ) ( not ( = ?auto_479849 ?auto_479850 ) ) ( not ( = ?auto_479849 ?auto_479851 ) ) ( TRUCK-AT ?auto_479853 ?auto_479854 ) ( not ( = ?auto_479854 ?auto_479855 ) ) ( ON ?auto_479848 ?auto_479847 ) ( ON ?auto_479849 ?auto_479848 ) ( not ( = ?auto_479847 ?auto_479848 ) ) ( not ( = ?auto_479847 ?auto_479849 ) ) ( not ( = ?auto_479847 ?auto_479850 ) ) ( not ( = ?auto_479847 ?auto_479851 ) ) ( not ( = ?auto_479848 ?auto_479849 ) ) ( not ( = ?auto_479848 ?auto_479850 ) ) ( not ( = ?auto_479848 ?auto_479851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479849 ?auto_479850 ?auto_479851 )
      ( MAKE-4CRATE-VERIFY ?auto_479847 ?auto_479848 ?auto_479849 ?auto_479850 ?auto_479851 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479881 - SURFACE
      ?auto_479882 - SURFACE
      ?auto_479883 - SURFACE
      ?auto_479884 - SURFACE
      ?auto_479885 - SURFACE
    )
    :vars
    (
      ?auto_479887 - HOIST
      ?auto_479886 - PLACE
      ?auto_479890 - TRUCK
      ?auto_479888 - PLACE
      ?auto_479889 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479887 ?auto_479886 ) ( SURFACE-AT ?auto_479884 ?auto_479886 ) ( CLEAR ?auto_479884 ) ( IS-CRATE ?auto_479885 ) ( not ( = ?auto_479884 ?auto_479885 ) ) ( AVAILABLE ?auto_479887 ) ( ON ?auto_479884 ?auto_479883 ) ( not ( = ?auto_479883 ?auto_479884 ) ) ( not ( = ?auto_479883 ?auto_479885 ) ) ( TRUCK-AT ?auto_479890 ?auto_479888 ) ( not ( = ?auto_479888 ?auto_479886 ) ) ( HOIST-AT ?auto_479889 ?auto_479888 ) ( LIFTING ?auto_479889 ?auto_479885 ) ( not ( = ?auto_479887 ?auto_479889 ) ) ( ON ?auto_479882 ?auto_479881 ) ( ON ?auto_479883 ?auto_479882 ) ( not ( = ?auto_479881 ?auto_479882 ) ) ( not ( = ?auto_479881 ?auto_479883 ) ) ( not ( = ?auto_479881 ?auto_479884 ) ) ( not ( = ?auto_479881 ?auto_479885 ) ) ( not ( = ?auto_479882 ?auto_479883 ) ) ( not ( = ?auto_479882 ?auto_479884 ) ) ( not ( = ?auto_479882 ?auto_479885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479883 ?auto_479884 ?auto_479885 )
      ( MAKE-4CRATE-VERIFY ?auto_479881 ?auto_479882 ?auto_479883 ?auto_479884 ?auto_479885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479919 - SURFACE
      ?auto_479920 - SURFACE
      ?auto_479921 - SURFACE
      ?auto_479922 - SURFACE
      ?auto_479923 - SURFACE
    )
    :vars
    (
      ?auto_479927 - HOIST
      ?auto_479926 - PLACE
      ?auto_479925 - TRUCK
      ?auto_479929 - PLACE
      ?auto_479928 - HOIST
      ?auto_479924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479927 ?auto_479926 ) ( SURFACE-AT ?auto_479922 ?auto_479926 ) ( CLEAR ?auto_479922 ) ( IS-CRATE ?auto_479923 ) ( not ( = ?auto_479922 ?auto_479923 ) ) ( AVAILABLE ?auto_479927 ) ( ON ?auto_479922 ?auto_479921 ) ( not ( = ?auto_479921 ?auto_479922 ) ) ( not ( = ?auto_479921 ?auto_479923 ) ) ( TRUCK-AT ?auto_479925 ?auto_479929 ) ( not ( = ?auto_479929 ?auto_479926 ) ) ( HOIST-AT ?auto_479928 ?auto_479929 ) ( not ( = ?auto_479927 ?auto_479928 ) ) ( AVAILABLE ?auto_479928 ) ( SURFACE-AT ?auto_479923 ?auto_479929 ) ( ON ?auto_479923 ?auto_479924 ) ( CLEAR ?auto_479923 ) ( not ( = ?auto_479922 ?auto_479924 ) ) ( not ( = ?auto_479923 ?auto_479924 ) ) ( not ( = ?auto_479921 ?auto_479924 ) ) ( ON ?auto_479920 ?auto_479919 ) ( ON ?auto_479921 ?auto_479920 ) ( not ( = ?auto_479919 ?auto_479920 ) ) ( not ( = ?auto_479919 ?auto_479921 ) ) ( not ( = ?auto_479919 ?auto_479922 ) ) ( not ( = ?auto_479919 ?auto_479923 ) ) ( not ( = ?auto_479919 ?auto_479924 ) ) ( not ( = ?auto_479920 ?auto_479921 ) ) ( not ( = ?auto_479920 ?auto_479922 ) ) ( not ( = ?auto_479920 ?auto_479923 ) ) ( not ( = ?auto_479920 ?auto_479924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479921 ?auto_479922 ?auto_479923 )
      ( MAKE-4CRATE-VERIFY ?auto_479919 ?auto_479920 ?auto_479921 ?auto_479922 ?auto_479923 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479958 - SURFACE
      ?auto_479959 - SURFACE
      ?auto_479960 - SURFACE
      ?auto_479961 - SURFACE
      ?auto_479962 - SURFACE
    )
    :vars
    (
      ?auto_479968 - HOIST
      ?auto_479966 - PLACE
      ?auto_479963 - PLACE
      ?auto_479964 - HOIST
      ?auto_479967 - SURFACE
      ?auto_479965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479968 ?auto_479966 ) ( SURFACE-AT ?auto_479961 ?auto_479966 ) ( CLEAR ?auto_479961 ) ( IS-CRATE ?auto_479962 ) ( not ( = ?auto_479961 ?auto_479962 ) ) ( AVAILABLE ?auto_479968 ) ( ON ?auto_479961 ?auto_479960 ) ( not ( = ?auto_479960 ?auto_479961 ) ) ( not ( = ?auto_479960 ?auto_479962 ) ) ( not ( = ?auto_479963 ?auto_479966 ) ) ( HOIST-AT ?auto_479964 ?auto_479963 ) ( not ( = ?auto_479968 ?auto_479964 ) ) ( AVAILABLE ?auto_479964 ) ( SURFACE-AT ?auto_479962 ?auto_479963 ) ( ON ?auto_479962 ?auto_479967 ) ( CLEAR ?auto_479962 ) ( not ( = ?auto_479961 ?auto_479967 ) ) ( not ( = ?auto_479962 ?auto_479967 ) ) ( not ( = ?auto_479960 ?auto_479967 ) ) ( TRUCK-AT ?auto_479965 ?auto_479966 ) ( ON ?auto_479959 ?auto_479958 ) ( ON ?auto_479960 ?auto_479959 ) ( not ( = ?auto_479958 ?auto_479959 ) ) ( not ( = ?auto_479958 ?auto_479960 ) ) ( not ( = ?auto_479958 ?auto_479961 ) ) ( not ( = ?auto_479958 ?auto_479962 ) ) ( not ( = ?auto_479958 ?auto_479967 ) ) ( not ( = ?auto_479959 ?auto_479960 ) ) ( not ( = ?auto_479959 ?auto_479961 ) ) ( not ( = ?auto_479959 ?auto_479962 ) ) ( not ( = ?auto_479959 ?auto_479967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479960 ?auto_479961 ?auto_479962 )
      ( MAKE-4CRATE-VERIFY ?auto_479958 ?auto_479959 ?auto_479960 ?auto_479961 ?auto_479962 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479997 - SURFACE
      ?auto_479998 - SURFACE
      ?auto_479999 - SURFACE
      ?auto_480000 - SURFACE
      ?auto_480001 - SURFACE
    )
    :vars
    (
      ?auto_480005 - HOIST
      ?auto_480007 - PLACE
      ?auto_480006 - PLACE
      ?auto_480003 - HOIST
      ?auto_480002 - SURFACE
      ?auto_480004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480005 ?auto_480007 ) ( IS-CRATE ?auto_480001 ) ( not ( = ?auto_480000 ?auto_480001 ) ) ( not ( = ?auto_479999 ?auto_480000 ) ) ( not ( = ?auto_479999 ?auto_480001 ) ) ( not ( = ?auto_480006 ?auto_480007 ) ) ( HOIST-AT ?auto_480003 ?auto_480006 ) ( not ( = ?auto_480005 ?auto_480003 ) ) ( AVAILABLE ?auto_480003 ) ( SURFACE-AT ?auto_480001 ?auto_480006 ) ( ON ?auto_480001 ?auto_480002 ) ( CLEAR ?auto_480001 ) ( not ( = ?auto_480000 ?auto_480002 ) ) ( not ( = ?auto_480001 ?auto_480002 ) ) ( not ( = ?auto_479999 ?auto_480002 ) ) ( TRUCK-AT ?auto_480004 ?auto_480007 ) ( SURFACE-AT ?auto_479999 ?auto_480007 ) ( CLEAR ?auto_479999 ) ( LIFTING ?auto_480005 ?auto_480000 ) ( IS-CRATE ?auto_480000 ) ( ON ?auto_479998 ?auto_479997 ) ( ON ?auto_479999 ?auto_479998 ) ( not ( = ?auto_479997 ?auto_479998 ) ) ( not ( = ?auto_479997 ?auto_479999 ) ) ( not ( = ?auto_479997 ?auto_480000 ) ) ( not ( = ?auto_479997 ?auto_480001 ) ) ( not ( = ?auto_479997 ?auto_480002 ) ) ( not ( = ?auto_479998 ?auto_479999 ) ) ( not ( = ?auto_479998 ?auto_480000 ) ) ( not ( = ?auto_479998 ?auto_480001 ) ) ( not ( = ?auto_479998 ?auto_480002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479999 ?auto_480000 ?auto_480001 )
      ( MAKE-4CRATE-VERIFY ?auto_479997 ?auto_479998 ?auto_479999 ?auto_480000 ?auto_480001 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480036 - SURFACE
      ?auto_480037 - SURFACE
      ?auto_480038 - SURFACE
      ?auto_480039 - SURFACE
      ?auto_480040 - SURFACE
    )
    :vars
    (
      ?auto_480041 - HOIST
      ?auto_480044 - PLACE
      ?auto_480042 - PLACE
      ?auto_480043 - HOIST
      ?auto_480046 - SURFACE
      ?auto_480045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480041 ?auto_480044 ) ( IS-CRATE ?auto_480040 ) ( not ( = ?auto_480039 ?auto_480040 ) ) ( not ( = ?auto_480038 ?auto_480039 ) ) ( not ( = ?auto_480038 ?auto_480040 ) ) ( not ( = ?auto_480042 ?auto_480044 ) ) ( HOIST-AT ?auto_480043 ?auto_480042 ) ( not ( = ?auto_480041 ?auto_480043 ) ) ( AVAILABLE ?auto_480043 ) ( SURFACE-AT ?auto_480040 ?auto_480042 ) ( ON ?auto_480040 ?auto_480046 ) ( CLEAR ?auto_480040 ) ( not ( = ?auto_480039 ?auto_480046 ) ) ( not ( = ?auto_480040 ?auto_480046 ) ) ( not ( = ?auto_480038 ?auto_480046 ) ) ( TRUCK-AT ?auto_480045 ?auto_480044 ) ( SURFACE-AT ?auto_480038 ?auto_480044 ) ( CLEAR ?auto_480038 ) ( IS-CRATE ?auto_480039 ) ( AVAILABLE ?auto_480041 ) ( IN ?auto_480039 ?auto_480045 ) ( ON ?auto_480037 ?auto_480036 ) ( ON ?auto_480038 ?auto_480037 ) ( not ( = ?auto_480036 ?auto_480037 ) ) ( not ( = ?auto_480036 ?auto_480038 ) ) ( not ( = ?auto_480036 ?auto_480039 ) ) ( not ( = ?auto_480036 ?auto_480040 ) ) ( not ( = ?auto_480036 ?auto_480046 ) ) ( not ( = ?auto_480037 ?auto_480038 ) ) ( not ( = ?auto_480037 ?auto_480039 ) ) ( not ( = ?auto_480037 ?auto_480040 ) ) ( not ( = ?auto_480037 ?auto_480046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480038 ?auto_480039 ?auto_480040 )
      ( MAKE-4CRATE-VERIFY ?auto_480036 ?auto_480037 ?auto_480038 ?auto_480039 ?auto_480040 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480696 - SURFACE
      ?auto_480697 - SURFACE
      ?auto_480698 - SURFACE
      ?auto_480699 - SURFACE
      ?auto_480700 - SURFACE
      ?auto_480701 - SURFACE
    )
    :vars
    (
      ?auto_480702 - HOIST
      ?auto_480703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480702 ?auto_480703 ) ( SURFACE-AT ?auto_480700 ?auto_480703 ) ( CLEAR ?auto_480700 ) ( LIFTING ?auto_480702 ?auto_480701 ) ( IS-CRATE ?auto_480701 ) ( not ( = ?auto_480700 ?auto_480701 ) ) ( ON ?auto_480697 ?auto_480696 ) ( ON ?auto_480698 ?auto_480697 ) ( ON ?auto_480699 ?auto_480698 ) ( ON ?auto_480700 ?auto_480699 ) ( not ( = ?auto_480696 ?auto_480697 ) ) ( not ( = ?auto_480696 ?auto_480698 ) ) ( not ( = ?auto_480696 ?auto_480699 ) ) ( not ( = ?auto_480696 ?auto_480700 ) ) ( not ( = ?auto_480696 ?auto_480701 ) ) ( not ( = ?auto_480697 ?auto_480698 ) ) ( not ( = ?auto_480697 ?auto_480699 ) ) ( not ( = ?auto_480697 ?auto_480700 ) ) ( not ( = ?auto_480697 ?auto_480701 ) ) ( not ( = ?auto_480698 ?auto_480699 ) ) ( not ( = ?auto_480698 ?auto_480700 ) ) ( not ( = ?auto_480698 ?auto_480701 ) ) ( not ( = ?auto_480699 ?auto_480700 ) ) ( not ( = ?auto_480699 ?auto_480701 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_480700 ?auto_480701 )
      ( MAKE-5CRATE-VERIFY ?auto_480696 ?auto_480697 ?auto_480698 ?auto_480699 ?auto_480700 ?auto_480701 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480730 - SURFACE
      ?auto_480731 - SURFACE
      ?auto_480732 - SURFACE
      ?auto_480733 - SURFACE
      ?auto_480734 - SURFACE
      ?auto_480735 - SURFACE
    )
    :vars
    (
      ?auto_480736 - HOIST
      ?auto_480737 - PLACE
      ?auto_480738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480736 ?auto_480737 ) ( SURFACE-AT ?auto_480734 ?auto_480737 ) ( CLEAR ?auto_480734 ) ( IS-CRATE ?auto_480735 ) ( not ( = ?auto_480734 ?auto_480735 ) ) ( TRUCK-AT ?auto_480738 ?auto_480737 ) ( AVAILABLE ?auto_480736 ) ( IN ?auto_480735 ?auto_480738 ) ( ON ?auto_480734 ?auto_480733 ) ( not ( = ?auto_480733 ?auto_480734 ) ) ( not ( = ?auto_480733 ?auto_480735 ) ) ( ON ?auto_480731 ?auto_480730 ) ( ON ?auto_480732 ?auto_480731 ) ( ON ?auto_480733 ?auto_480732 ) ( not ( = ?auto_480730 ?auto_480731 ) ) ( not ( = ?auto_480730 ?auto_480732 ) ) ( not ( = ?auto_480730 ?auto_480733 ) ) ( not ( = ?auto_480730 ?auto_480734 ) ) ( not ( = ?auto_480730 ?auto_480735 ) ) ( not ( = ?auto_480731 ?auto_480732 ) ) ( not ( = ?auto_480731 ?auto_480733 ) ) ( not ( = ?auto_480731 ?auto_480734 ) ) ( not ( = ?auto_480731 ?auto_480735 ) ) ( not ( = ?auto_480732 ?auto_480733 ) ) ( not ( = ?auto_480732 ?auto_480734 ) ) ( not ( = ?auto_480732 ?auto_480735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480733 ?auto_480734 ?auto_480735 )
      ( MAKE-5CRATE-VERIFY ?auto_480730 ?auto_480731 ?auto_480732 ?auto_480733 ?auto_480734 ?auto_480735 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480770 - SURFACE
      ?auto_480771 - SURFACE
      ?auto_480772 - SURFACE
      ?auto_480773 - SURFACE
      ?auto_480774 - SURFACE
      ?auto_480775 - SURFACE
    )
    :vars
    (
      ?auto_480777 - HOIST
      ?auto_480776 - PLACE
      ?auto_480778 - TRUCK
      ?auto_480779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480777 ?auto_480776 ) ( SURFACE-AT ?auto_480774 ?auto_480776 ) ( CLEAR ?auto_480774 ) ( IS-CRATE ?auto_480775 ) ( not ( = ?auto_480774 ?auto_480775 ) ) ( AVAILABLE ?auto_480777 ) ( IN ?auto_480775 ?auto_480778 ) ( ON ?auto_480774 ?auto_480773 ) ( not ( = ?auto_480773 ?auto_480774 ) ) ( not ( = ?auto_480773 ?auto_480775 ) ) ( TRUCK-AT ?auto_480778 ?auto_480779 ) ( not ( = ?auto_480779 ?auto_480776 ) ) ( ON ?auto_480771 ?auto_480770 ) ( ON ?auto_480772 ?auto_480771 ) ( ON ?auto_480773 ?auto_480772 ) ( not ( = ?auto_480770 ?auto_480771 ) ) ( not ( = ?auto_480770 ?auto_480772 ) ) ( not ( = ?auto_480770 ?auto_480773 ) ) ( not ( = ?auto_480770 ?auto_480774 ) ) ( not ( = ?auto_480770 ?auto_480775 ) ) ( not ( = ?auto_480771 ?auto_480772 ) ) ( not ( = ?auto_480771 ?auto_480773 ) ) ( not ( = ?auto_480771 ?auto_480774 ) ) ( not ( = ?auto_480771 ?auto_480775 ) ) ( not ( = ?auto_480772 ?auto_480773 ) ) ( not ( = ?auto_480772 ?auto_480774 ) ) ( not ( = ?auto_480772 ?auto_480775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480773 ?auto_480774 ?auto_480775 )
      ( MAKE-5CRATE-VERIFY ?auto_480770 ?auto_480771 ?auto_480772 ?auto_480773 ?auto_480774 ?auto_480775 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480815 - SURFACE
      ?auto_480816 - SURFACE
      ?auto_480817 - SURFACE
      ?auto_480818 - SURFACE
      ?auto_480819 - SURFACE
      ?auto_480820 - SURFACE
    )
    :vars
    (
      ?auto_480825 - HOIST
      ?auto_480821 - PLACE
      ?auto_480824 - TRUCK
      ?auto_480823 - PLACE
      ?auto_480822 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_480825 ?auto_480821 ) ( SURFACE-AT ?auto_480819 ?auto_480821 ) ( CLEAR ?auto_480819 ) ( IS-CRATE ?auto_480820 ) ( not ( = ?auto_480819 ?auto_480820 ) ) ( AVAILABLE ?auto_480825 ) ( ON ?auto_480819 ?auto_480818 ) ( not ( = ?auto_480818 ?auto_480819 ) ) ( not ( = ?auto_480818 ?auto_480820 ) ) ( TRUCK-AT ?auto_480824 ?auto_480823 ) ( not ( = ?auto_480823 ?auto_480821 ) ) ( HOIST-AT ?auto_480822 ?auto_480823 ) ( LIFTING ?auto_480822 ?auto_480820 ) ( not ( = ?auto_480825 ?auto_480822 ) ) ( ON ?auto_480816 ?auto_480815 ) ( ON ?auto_480817 ?auto_480816 ) ( ON ?auto_480818 ?auto_480817 ) ( not ( = ?auto_480815 ?auto_480816 ) ) ( not ( = ?auto_480815 ?auto_480817 ) ) ( not ( = ?auto_480815 ?auto_480818 ) ) ( not ( = ?auto_480815 ?auto_480819 ) ) ( not ( = ?auto_480815 ?auto_480820 ) ) ( not ( = ?auto_480816 ?auto_480817 ) ) ( not ( = ?auto_480816 ?auto_480818 ) ) ( not ( = ?auto_480816 ?auto_480819 ) ) ( not ( = ?auto_480816 ?auto_480820 ) ) ( not ( = ?auto_480817 ?auto_480818 ) ) ( not ( = ?auto_480817 ?auto_480819 ) ) ( not ( = ?auto_480817 ?auto_480820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480818 ?auto_480819 ?auto_480820 )
      ( MAKE-5CRATE-VERIFY ?auto_480815 ?auto_480816 ?auto_480817 ?auto_480818 ?auto_480819 ?auto_480820 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480865 - SURFACE
      ?auto_480866 - SURFACE
      ?auto_480867 - SURFACE
      ?auto_480868 - SURFACE
      ?auto_480869 - SURFACE
      ?auto_480870 - SURFACE
    )
    :vars
    (
      ?auto_480873 - HOIST
      ?auto_480871 - PLACE
      ?auto_480876 - TRUCK
      ?auto_480872 - PLACE
      ?auto_480875 - HOIST
      ?auto_480874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480873 ?auto_480871 ) ( SURFACE-AT ?auto_480869 ?auto_480871 ) ( CLEAR ?auto_480869 ) ( IS-CRATE ?auto_480870 ) ( not ( = ?auto_480869 ?auto_480870 ) ) ( AVAILABLE ?auto_480873 ) ( ON ?auto_480869 ?auto_480868 ) ( not ( = ?auto_480868 ?auto_480869 ) ) ( not ( = ?auto_480868 ?auto_480870 ) ) ( TRUCK-AT ?auto_480876 ?auto_480872 ) ( not ( = ?auto_480872 ?auto_480871 ) ) ( HOIST-AT ?auto_480875 ?auto_480872 ) ( not ( = ?auto_480873 ?auto_480875 ) ) ( AVAILABLE ?auto_480875 ) ( SURFACE-AT ?auto_480870 ?auto_480872 ) ( ON ?auto_480870 ?auto_480874 ) ( CLEAR ?auto_480870 ) ( not ( = ?auto_480869 ?auto_480874 ) ) ( not ( = ?auto_480870 ?auto_480874 ) ) ( not ( = ?auto_480868 ?auto_480874 ) ) ( ON ?auto_480866 ?auto_480865 ) ( ON ?auto_480867 ?auto_480866 ) ( ON ?auto_480868 ?auto_480867 ) ( not ( = ?auto_480865 ?auto_480866 ) ) ( not ( = ?auto_480865 ?auto_480867 ) ) ( not ( = ?auto_480865 ?auto_480868 ) ) ( not ( = ?auto_480865 ?auto_480869 ) ) ( not ( = ?auto_480865 ?auto_480870 ) ) ( not ( = ?auto_480865 ?auto_480874 ) ) ( not ( = ?auto_480866 ?auto_480867 ) ) ( not ( = ?auto_480866 ?auto_480868 ) ) ( not ( = ?auto_480866 ?auto_480869 ) ) ( not ( = ?auto_480866 ?auto_480870 ) ) ( not ( = ?auto_480866 ?auto_480874 ) ) ( not ( = ?auto_480867 ?auto_480868 ) ) ( not ( = ?auto_480867 ?auto_480869 ) ) ( not ( = ?auto_480867 ?auto_480870 ) ) ( not ( = ?auto_480867 ?auto_480874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480868 ?auto_480869 ?auto_480870 )
      ( MAKE-5CRATE-VERIFY ?auto_480865 ?auto_480866 ?auto_480867 ?auto_480868 ?auto_480869 ?auto_480870 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480916 - SURFACE
      ?auto_480917 - SURFACE
      ?auto_480918 - SURFACE
      ?auto_480919 - SURFACE
      ?auto_480920 - SURFACE
      ?auto_480921 - SURFACE
    )
    :vars
    (
      ?auto_480922 - HOIST
      ?auto_480925 - PLACE
      ?auto_480923 - PLACE
      ?auto_480926 - HOIST
      ?auto_480927 - SURFACE
      ?auto_480924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480922 ?auto_480925 ) ( SURFACE-AT ?auto_480920 ?auto_480925 ) ( CLEAR ?auto_480920 ) ( IS-CRATE ?auto_480921 ) ( not ( = ?auto_480920 ?auto_480921 ) ) ( AVAILABLE ?auto_480922 ) ( ON ?auto_480920 ?auto_480919 ) ( not ( = ?auto_480919 ?auto_480920 ) ) ( not ( = ?auto_480919 ?auto_480921 ) ) ( not ( = ?auto_480923 ?auto_480925 ) ) ( HOIST-AT ?auto_480926 ?auto_480923 ) ( not ( = ?auto_480922 ?auto_480926 ) ) ( AVAILABLE ?auto_480926 ) ( SURFACE-AT ?auto_480921 ?auto_480923 ) ( ON ?auto_480921 ?auto_480927 ) ( CLEAR ?auto_480921 ) ( not ( = ?auto_480920 ?auto_480927 ) ) ( not ( = ?auto_480921 ?auto_480927 ) ) ( not ( = ?auto_480919 ?auto_480927 ) ) ( TRUCK-AT ?auto_480924 ?auto_480925 ) ( ON ?auto_480917 ?auto_480916 ) ( ON ?auto_480918 ?auto_480917 ) ( ON ?auto_480919 ?auto_480918 ) ( not ( = ?auto_480916 ?auto_480917 ) ) ( not ( = ?auto_480916 ?auto_480918 ) ) ( not ( = ?auto_480916 ?auto_480919 ) ) ( not ( = ?auto_480916 ?auto_480920 ) ) ( not ( = ?auto_480916 ?auto_480921 ) ) ( not ( = ?auto_480916 ?auto_480927 ) ) ( not ( = ?auto_480917 ?auto_480918 ) ) ( not ( = ?auto_480917 ?auto_480919 ) ) ( not ( = ?auto_480917 ?auto_480920 ) ) ( not ( = ?auto_480917 ?auto_480921 ) ) ( not ( = ?auto_480917 ?auto_480927 ) ) ( not ( = ?auto_480918 ?auto_480919 ) ) ( not ( = ?auto_480918 ?auto_480920 ) ) ( not ( = ?auto_480918 ?auto_480921 ) ) ( not ( = ?auto_480918 ?auto_480927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480919 ?auto_480920 ?auto_480921 )
      ( MAKE-5CRATE-VERIFY ?auto_480916 ?auto_480917 ?auto_480918 ?auto_480919 ?auto_480920 ?auto_480921 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480967 - SURFACE
      ?auto_480968 - SURFACE
      ?auto_480969 - SURFACE
      ?auto_480970 - SURFACE
      ?auto_480971 - SURFACE
      ?auto_480972 - SURFACE
    )
    :vars
    (
      ?auto_480976 - HOIST
      ?auto_480975 - PLACE
      ?auto_480973 - PLACE
      ?auto_480978 - HOIST
      ?auto_480977 - SURFACE
      ?auto_480974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480976 ?auto_480975 ) ( IS-CRATE ?auto_480972 ) ( not ( = ?auto_480971 ?auto_480972 ) ) ( not ( = ?auto_480970 ?auto_480971 ) ) ( not ( = ?auto_480970 ?auto_480972 ) ) ( not ( = ?auto_480973 ?auto_480975 ) ) ( HOIST-AT ?auto_480978 ?auto_480973 ) ( not ( = ?auto_480976 ?auto_480978 ) ) ( AVAILABLE ?auto_480978 ) ( SURFACE-AT ?auto_480972 ?auto_480973 ) ( ON ?auto_480972 ?auto_480977 ) ( CLEAR ?auto_480972 ) ( not ( = ?auto_480971 ?auto_480977 ) ) ( not ( = ?auto_480972 ?auto_480977 ) ) ( not ( = ?auto_480970 ?auto_480977 ) ) ( TRUCK-AT ?auto_480974 ?auto_480975 ) ( SURFACE-AT ?auto_480970 ?auto_480975 ) ( CLEAR ?auto_480970 ) ( LIFTING ?auto_480976 ?auto_480971 ) ( IS-CRATE ?auto_480971 ) ( ON ?auto_480968 ?auto_480967 ) ( ON ?auto_480969 ?auto_480968 ) ( ON ?auto_480970 ?auto_480969 ) ( not ( = ?auto_480967 ?auto_480968 ) ) ( not ( = ?auto_480967 ?auto_480969 ) ) ( not ( = ?auto_480967 ?auto_480970 ) ) ( not ( = ?auto_480967 ?auto_480971 ) ) ( not ( = ?auto_480967 ?auto_480972 ) ) ( not ( = ?auto_480967 ?auto_480977 ) ) ( not ( = ?auto_480968 ?auto_480969 ) ) ( not ( = ?auto_480968 ?auto_480970 ) ) ( not ( = ?auto_480968 ?auto_480971 ) ) ( not ( = ?auto_480968 ?auto_480972 ) ) ( not ( = ?auto_480968 ?auto_480977 ) ) ( not ( = ?auto_480969 ?auto_480970 ) ) ( not ( = ?auto_480969 ?auto_480971 ) ) ( not ( = ?auto_480969 ?auto_480972 ) ) ( not ( = ?auto_480969 ?auto_480977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480970 ?auto_480971 ?auto_480972 )
      ( MAKE-5CRATE-VERIFY ?auto_480967 ?auto_480968 ?auto_480969 ?auto_480970 ?auto_480971 ?auto_480972 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481018 - SURFACE
      ?auto_481019 - SURFACE
      ?auto_481020 - SURFACE
      ?auto_481021 - SURFACE
      ?auto_481022 - SURFACE
      ?auto_481023 - SURFACE
    )
    :vars
    (
      ?auto_481028 - HOIST
      ?auto_481024 - PLACE
      ?auto_481025 - PLACE
      ?auto_481026 - HOIST
      ?auto_481027 - SURFACE
      ?auto_481029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_481028 ?auto_481024 ) ( IS-CRATE ?auto_481023 ) ( not ( = ?auto_481022 ?auto_481023 ) ) ( not ( = ?auto_481021 ?auto_481022 ) ) ( not ( = ?auto_481021 ?auto_481023 ) ) ( not ( = ?auto_481025 ?auto_481024 ) ) ( HOIST-AT ?auto_481026 ?auto_481025 ) ( not ( = ?auto_481028 ?auto_481026 ) ) ( AVAILABLE ?auto_481026 ) ( SURFACE-AT ?auto_481023 ?auto_481025 ) ( ON ?auto_481023 ?auto_481027 ) ( CLEAR ?auto_481023 ) ( not ( = ?auto_481022 ?auto_481027 ) ) ( not ( = ?auto_481023 ?auto_481027 ) ) ( not ( = ?auto_481021 ?auto_481027 ) ) ( TRUCK-AT ?auto_481029 ?auto_481024 ) ( SURFACE-AT ?auto_481021 ?auto_481024 ) ( CLEAR ?auto_481021 ) ( IS-CRATE ?auto_481022 ) ( AVAILABLE ?auto_481028 ) ( IN ?auto_481022 ?auto_481029 ) ( ON ?auto_481019 ?auto_481018 ) ( ON ?auto_481020 ?auto_481019 ) ( ON ?auto_481021 ?auto_481020 ) ( not ( = ?auto_481018 ?auto_481019 ) ) ( not ( = ?auto_481018 ?auto_481020 ) ) ( not ( = ?auto_481018 ?auto_481021 ) ) ( not ( = ?auto_481018 ?auto_481022 ) ) ( not ( = ?auto_481018 ?auto_481023 ) ) ( not ( = ?auto_481018 ?auto_481027 ) ) ( not ( = ?auto_481019 ?auto_481020 ) ) ( not ( = ?auto_481019 ?auto_481021 ) ) ( not ( = ?auto_481019 ?auto_481022 ) ) ( not ( = ?auto_481019 ?auto_481023 ) ) ( not ( = ?auto_481019 ?auto_481027 ) ) ( not ( = ?auto_481020 ?auto_481021 ) ) ( not ( = ?auto_481020 ?auto_481022 ) ) ( not ( = ?auto_481020 ?auto_481023 ) ) ( not ( = ?auto_481020 ?auto_481027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481021 ?auto_481022 ?auto_481023 )
      ( MAKE-5CRATE-VERIFY ?auto_481018 ?auto_481019 ?auto_481020 ?auto_481021 ?auto_481022 ?auto_481023 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482227 - SURFACE
      ?auto_482228 - SURFACE
      ?auto_482229 - SURFACE
      ?auto_482230 - SURFACE
      ?auto_482231 - SURFACE
      ?auto_482232 - SURFACE
      ?auto_482233 - SURFACE
    )
    :vars
    (
      ?auto_482234 - HOIST
      ?auto_482235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482234 ?auto_482235 ) ( SURFACE-AT ?auto_482232 ?auto_482235 ) ( CLEAR ?auto_482232 ) ( LIFTING ?auto_482234 ?auto_482233 ) ( IS-CRATE ?auto_482233 ) ( not ( = ?auto_482232 ?auto_482233 ) ) ( ON ?auto_482228 ?auto_482227 ) ( ON ?auto_482229 ?auto_482228 ) ( ON ?auto_482230 ?auto_482229 ) ( ON ?auto_482231 ?auto_482230 ) ( ON ?auto_482232 ?auto_482231 ) ( not ( = ?auto_482227 ?auto_482228 ) ) ( not ( = ?auto_482227 ?auto_482229 ) ) ( not ( = ?auto_482227 ?auto_482230 ) ) ( not ( = ?auto_482227 ?auto_482231 ) ) ( not ( = ?auto_482227 ?auto_482232 ) ) ( not ( = ?auto_482227 ?auto_482233 ) ) ( not ( = ?auto_482228 ?auto_482229 ) ) ( not ( = ?auto_482228 ?auto_482230 ) ) ( not ( = ?auto_482228 ?auto_482231 ) ) ( not ( = ?auto_482228 ?auto_482232 ) ) ( not ( = ?auto_482228 ?auto_482233 ) ) ( not ( = ?auto_482229 ?auto_482230 ) ) ( not ( = ?auto_482229 ?auto_482231 ) ) ( not ( = ?auto_482229 ?auto_482232 ) ) ( not ( = ?auto_482229 ?auto_482233 ) ) ( not ( = ?auto_482230 ?auto_482231 ) ) ( not ( = ?auto_482230 ?auto_482232 ) ) ( not ( = ?auto_482230 ?auto_482233 ) ) ( not ( = ?auto_482231 ?auto_482232 ) ) ( not ( = ?auto_482231 ?auto_482233 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_482232 ?auto_482233 )
      ( MAKE-6CRATE-VERIFY ?auto_482227 ?auto_482228 ?auto_482229 ?auto_482230 ?auto_482231 ?auto_482232 ?auto_482233 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482271 - SURFACE
      ?auto_482272 - SURFACE
      ?auto_482273 - SURFACE
      ?auto_482274 - SURFACE
      ?auto_482275 - SURFACE
      ?auto_482276 - SURFACE
      ?auto_482277 - SURFACE
    )
    :vars
    (
      ?auto_482278 - HOIST
      ?auto_482279 - PLACE
      ?auto_482280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482278 ?auto_482279 ) ( SURFACE-AT ?auto_482276 ?auto_482279 ) ( CLEAR ?auto_482276 ) ( IS-CRATE ?auto_482277 ) ( not ( = ?auto_482276 ?auto_482277 ) ) ( TRUCK-AT ?auto_482280 ?auto_482279 ) ( AVAILABLE ?auto_482278 ) ( IN ?auto_482277 ?auto_482280 ) ( ON ?auto_482276 ?auto_482275 ) ( not ( = ?auto_482275 ?auto_482276 ) ) ( not ( = ?auto_482275 ?auto_482277 ) ) ( ON ?auto_482272 ?auto_482271 ) ( ON ?auto_482273 ?auto_482272 ) ( ON ?auto_482274 ?auto_482273 ) ( ON ?auto_482275 ?auto_482274 ) ( not ( = ?auto_482271 ?auto_482272 ) ) ( not ( = ?auto_482271 ?auto_482273 ) ) ( not ( = ?auto_482271 ?auto_482274 ) ) ( not ( = ?auto_482271 ?auto_482275 ) ) ( not ( = ?auto_482271 ?auto_482276 ) ) ( not ( = ?auto_482271 ?auto_482277 ) ) ( not ( = ?auto_482272 ?auto_482273 ) ) ( not ( = ?auto_482272 ?auto_482274 ) ) ( not ( = ?auto_482272 ?auto_482275 ) ) ( not ( = ?auto_482272 ?auto_482276 ) ) ( not ( = ?auto_482272 ?auto_482277 ) ) ( not ( = ?auto_482273 ?auto_482274 ) ) ( not ( = ?auto_482273 ?auto_482275 ) ) ( not ( = ?auto_482273 ?auto_482276 ) ) ( not ( = ?auto_482273 ?auto_482277 ) ) ( not ( = ?auto_482274 ?auto_482275 ) ) ( not ( = ?auto_482274 ?auto_482276 ) ) ( not ( = ?auto_482274 ?auto_482277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482275 ?auto_482276 ?auto_482277 )
      ( MAKE-6CRATE-VERIFY ?auto_482271 ?auto_482272 ?auto_482273 ?auto_482274 ?auto_482275 ?auto_482276 ?auto_482277 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482322 - SURFACE
      ?auto_482323 - SURFACE
      ?auto_482324 - SURFACE
      ?auto_482325 - SURFACE
      ?auto_482326 - SURFACE
      ?auto_482327 - SURFACE
      ?auto_482328 - SURFACE
    )
    :vars
    (
      ?auto_482331 - HOIST
      ?auto_482329 - PLACE
      ?auto_482332 - TRUCK
      ?auto_482330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482331 ?auto_482329 ) ( SURFACE-AT ?auto_482327 ?auto_482329 ) ( CLEAR ?auto_482327 ) ( IS-CRATE ?auto_482328 ) ( not ( = ?auto_482327 ?auto_482328 ) ) ( AVAILABLE ?auto_482331 ) ( IN ?auto_482328 ?auto_482332 ) ( ON ?auto_482327 ?auto_482326 ) ( not ( = ?auto_482326 ?auto_482327 ) ) ( not ( = ?auto_482326 ?auto_482328 ) ) ( TRUCK-AT ?auto_482332 ?auto_482330 ) ( not ( = ?auto_482330 ?auto_482329 ) ) ( ON ?auto_482323 ?auto_482322 ) ( ON ?auto_482324 ?auto_482323 ) ( ON ?auto_482325 ?auto_482324 ) ( ON ?auto_482326 ?auto_482325 ) ( not ( = ?auto_482322 ?auto_482323 ) ) ( not ( = ?auto_482322 ?auto_482324 ) ) ( not ( = ?auto_482322 ?auto_482325 ) ) ( not ( = ?auto_482322 ?auto_482326 ) ) ( not ( = ?auto_482322 ?auto_482327 ) ) ( not ( = ?auto_482322 ?auto_482328 ) ) ( not ( = ?auto_482323 ?auto_482324 ) ) ( not ( = ?auto_482323 ?auto_482325 ) ) ( not ( = ?auto_482323 ?auto_482326 ) ) ( not ( = ?auto_482323 ?auto_482327 ) ) ( not ( = ?auto_482323 ?auto_482328 ) ) ( not ( = ?auto_482324 ?auto_482325 ) ) ( not ( = ?auto_482324 ?auto_482326 ) ) ( not ( = ?auto_482324 ?auto_482327 ) ) ( not ( = ?auto_482324 ?auto_482328 ) ) ( not ( = ?auto_482325 ?auto_482326 ) ) ( not ( = ?auto_482325 ?auto_482327 ) ) ( not ( = ?auto_482325 ?auto_482328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482326 ?auto_482327 ?auto_482328 )
      ( MAKE-6CRATE-VERIFY ?auto_482322 ?auto_482323 ?auto_482324 ?auto_482325 ?auto_482326 ?auto_482327 ?auto_482328 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482379 - SURFACE
      ?auto_482380 - SURFACE
      ?auto_482381 - SURFACE
      ?auto_482382 - SURFACE
      ?auto_482383 - SURFACE
      ?auto_482384 - SURFACE
      ?auto_482385 - SURFACE
    )
    :vars
    (
      ?auto_482388 - HOIST
      ?auto_482389 - PLACE
      ?auto_482390 - TRUCK
      ?auto_482387 - PLACE
      ?auto_482386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_482388 ?auto_482389 ) ( SURFACE-AT ?auto_482384 ?auto_482389 ) ( CLEAR ?auto_482384 ) ( IS-CRATE ?auto_482385 ) ( not ( = ?auto_482384 ?auto_482385 ) ) ( AVAILABLE ?auto_482388 ) ( ON ?auto_482384 ?auto_482383 ) ( not ( = ?auto_482383 ?auto_482384 ) ) ( not ( = ?auto_482383 ?auto_482385 ) ) ( TRUCK-AT ?auto_482390 ?auto_482387 ) ( not ( = ?auto_482387 ?auto_482389 ) ) ( HOIST-AT ?auto_482386 ?auto_482387 ) ( LIFTING ?auto_482386 ?auto_482385 ) ( not ( = ?auto_482388 ?auto_482386 ) ) ( ON ?auto_482380 ?auto_482379 ) ( ON ?auto_482381 ?auto_482380 ) ( ON ?auto_482382 ?auto_482381 ) ( ON ?auto_482383 ?auto_482382 ) ( not ( = ?auto_482379 ?auto_482380 ) ) ( not ( = ?auto_482379 ?auto_482381 ) ) ( not ( = ?auto_482379 ?auto_482382 ) ) ( not ( = ?auto_482379 ?auto_482383 ) ) ( not ( = ?auto_482379 ?auto_482384 ) ) ( not ( = ?auto_482379 ?auto_482385 ) ) ( not ( = ?auto_482380 ?auto_482381 ) ) ( not ( = ?auto_482380 ?auto_482382 ) ) ( not ( = ?auto_482380 ?auto_482383 ) ) ( not ( = ?auto_482380 ?auto_482384 ) ) ( not ( = ?auto_482380 ?auto_482385 ) ) ( not ( = ?auto_482381 ?auto_482382 ) ) ( not ( = ?auto_482381 ?auto_482383 ) ) ( not ( = ?auto_482381 ?auto_482384 ) ) ( not ( = ?auto_482381 ?auto_482385 ) ) ( not ( = ?auto_482382 ?auto_482383 ) ) ( not ( = ?auto_482382 ?auto_482384 ) ) ( not ( = ?auto_482382 ?auto_482385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482383 ?auto_482384 ?auto_482385 )
      ( MAKE-6CRATE-VERIFY ?auto_482379 ?auto_482380 ?auto_482381 ?auto_482382 ?auto_482383 ?auto_482384 ?auto_482385 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482442 - SURFACE
      ?auto_482443 - SURFACE
      ?auto_482444 - SURFACE
      ?auto_482445 - SURFACE
      ?auto_482446 - SURFACE
      ?auto_482447 - SURFACE
      ?auto_482448 - SURFACE
    )
    :vars
    (
      ?auto_482452 - HOIST
      ?auto_482453 - PLACE
      ?auto_482450 - TRUCK
      ?auto_482449 - PLACE
      ?auto_482451 - HOIST
      ?auto_482454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482452 ?auto_482453 ) ( SURFACE-AT ?auto_482447 ?auto_482453 ) ( CLEAR ?auto_482447 ) ( IS-CRATE ?auto_482448 ) ( not ( = ?auto_482447 ?auto_482448 ) ) ( AVAILABLE ?auto_482452 ) ( ON ?auto_482447 ?auto_482446 ) ( not ( = ?auto_482446 ?auto_482447 ) ) ( not ( = ?auto_482446 ?auto_482448 ) ) ( TRUCK-AT ?auto_482450 ?auto_482449 ) ( not ( = ?auto_482449 ?auto_482453 ) ) ( HOIST-AT ?auto_482451 ?auto_482449 ) ( not ( = ?auto_482452 ?auto_482451 ) ) ( AVAILABLE ?auto_482451 ) ( SURFACE-AT ?auto_482448 ?auto_482449 ) ( ON ?auto_482448 ?auto_482454 ) ( CLEAR ?auto_482448 ) ( not ( = ?auto_482447 ?auto_482454 ) ) ( not ( = ?auto_482448 ?auto_482454 ) ) ( not ( = ?auto_482446 ?auto_482454 ) ) ( ON ?auto_482443 ?auto_482442 ) ( ON ?auto_482444 ?auto_482443 ) ( ON ?auto_482445 ?auto_482444 ) ( ON ?auto_482446 ?auto_482445 ) ( not ( = ?auto_482442 ?auto_482443 ) ) ( not ( = ?auto_482442 ?auto_482444 ) ) ( not ( = ?auto_482442 ?auto_482445 ) ) ( not ( = ?auto_482442 ?auto_482446 ) ) ( not ( = ?auto_482442 ?auto_482447 ) ) ( not ( = ?auto_482442 ?auto_482448 ) ) ( not ( = ?auto_482442 ?auto_482454 ) ) ( not ( = ?auto_482443 ?auto_482444 ) ) ( not ( = ?auto_482443 ?auto_482445 ) ) ( not ( = ?auto_482443 ?auto_482446 ) ) ( not ( = ?auto_482443 ?auto_482447 ) ) ( not ( = ?auto_482443 ?auto_482448 ) ) ( not ( = ?auto_482443 ?auto_482454 ) ) ( not ( = ?auto_482444 ?auto_482445 ) ) ( not ( = ?auto_482444 ?auto_482446 ) ) ( not ( = ?auto_482444 ?auto_482447 ) ) ( not ( = ?auto_482444 ?auto_482448 ) ) ( not ( = ?auto_482444 ?auto_482454 ) ) ( not ( = ?auto_482445 ?auto_482446 ) ) ( not ( = ?auto_482445 ?auto_482447 ) ) ( not ( = ?auto_482445 ?auto_482448 ) ) ( not ( = ?auto_482445 ?auto_482454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482446 ?auto_482447 ?auto_482448 )
      ( MAKE-6CRATE-VERIFY ?auto_482442 ?auto_482443 ?auto_482444 ?auto_482445 ?auto_482446 ?auto_482447 ?auto_482448 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482506 - SURFACE
      ?auto_482507 - SURFACE
      ?auto_482508 - SURFACE
      ?auto_482509 - SURFACE
      ?auto_482510 - SURFACE
      ?auto_482511 - SURFACE
      ?auto_482512 - SURFACE
    )
    :vars
    (
      ?auto_482518 - HOIST
      ?auto_482517 - PLACE
      ?auto_482515 - PLACE
      ?auto_482516 - HOIST
      ?auto_482514 - SURFACE
      ?auto_482513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482518 ?auto_482517 ) ( SURFACE-AT ?auto_482511 ?auto_482517 ) ( CLEAR ?auto_482511 ) ( IS-CRATE ?auto_482512 ) ( not ( = ?auto_482511 ?auto_482512 ) ) ( AVAILABLE ?auto_482518 ) ( ON ?auto_482511 ?auto_482510 ) ( not ( = ?auto_482510 ?auto_482511 ) ) ( not ( = ?auto_482510 ?auto_482512 ) ) ( not ( = ?auto_482515 ?auto_482517 ) ) ( HOIST-AT ?auto_482516 ?auto_482515 ) ( not ( = ?auto_482518 ?auto_482516 ) ) ( AVAILABLE ?auto_482516 ) ( SURFACE-AT ?auto_482512 ?auto_482515 ) ( ON ?auto_482512 ?auto_482514 ) ( CLEAR ?auto_482512 ) ( not ( = ?auto_482511 ?auto_482514 ) ) ( not ( = ?auto_482512 ?auto_482514 ) ) ( not ( = ?auto_482510 ?auto_482514 ) ) ( TRUCK-AT ?auto_482513 ?auto_482517 ) ( ON ?auto_482507 ?auto_482506 ) ( ON ?auto_482508 ?auto_482507 ) ( ON ?auto_482509 ?auto_482508 ) ( ON ?auto_482510 ?auto_482509 ) ( not ( = ?auto_482506 ?auto_482507 ) ) ( not ( = ?auto_482506 ?auto_482508 ) ) ( not ( = ?auto_482506 ?auto_482509 ) ) ( not ( = ?auto_482506 ?auto_482510 ) ) ( not ( = ?auto_482506 ?auto_482511 ) ) ( not ( = ?auto_482506 ?auto_482512 ) ) ( not ( = ?auto_482506 ?auto_482514 ) ) ( not ( = ?auto_482507 ?auto_482508 ) ) ( not ( = ?auto_482507 ?auto_482509 ) ) ( not ( = ?auto_482507 ?auto_482510 ) ) ( not ( = ?auto_482507 ?auto_482511 ) ) ( not ( = ?auto_482507 ?auto_482512 ) ) ( not ( = ?auto_482507 ?auto_482514 ) ) ( not ( = ?auto_482508 ?auto_482509 ) ) ( not ( = ?auto_482508 ?auto_482510 ) ) ( not ( = ?auto_482508 ?auto_482511 ) ) ( not ( = ?auto_482508 ?auto_482512 ) ) ( not ( = ?auto_482508 ?auto_482514 ) ) ( not ( = ?auto_482509 ?auto_482510 ) ) ( not ( = ?auto_482509 ?auto_482511 ) ) ( not ( = ?auto_482509 ?auto_482512 ) ) ( not ( = ?auto_482509 ?auto_482514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482510 ?auto_482511 ?auto_482512 )
      ( MAKE-6CRATE-VERIFY ?auto_482506 ?auto_482507 ?auto_482508 ?auto_482509 ?auto_482510 ?auto_482511 ?auto_482512 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482570 - SURFACE
      ?auto_482571 - SURFACE
      ?auto_482572 - SURFACE
      ?auto_482573 - SURFACE
      ?auto_482574 - SURFACE
      ?auto_482575 - SURFACE
      ?auto_482576 - SURFACE
    )
    :vars
    (
      ?auto_482577 - HOIST
      ?auto_482579 - PLACE
      ?auto_482582 - PLACE
      ?auto_482581 - HOIST
      ?auto_482578 - SURFACE
      ?auto_482580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482577 ?auto_482579 ) ( IS-CRATE ?auto_482576 ) ( not ( = ?auto_482575 ?auto_482576 ) ) ( not ( = ?auto_482574 ?auto_482575 ) ) ( not ( = ?auto_482574 ?auto_482576 ) ) ( not ( = ?auto_482582 ?auto_482579 ) ) ( HOIST-AT ?auto_482581 ?auto_482582 ) ( not ( = ?auto_482577 ?auto_482581 ) ) ( AVAILABLE ?auto_482581 ) ( SURFACE-AT ?auto_482576 ?auto_482582 ) ( ON ?auto_482576 ?auto_482578 ) ( CLEAR ?auto_482576 ) ( not ( = ?auto_482575 ?auto_482578 ) ) ( not ( = ?auto_482576 ?auto_482578 ) ) ( not ( = ?auto_482574 ?auto_482578 ) ) ( TRUCK-AT ?auto_482580 ?auto_482579 ) ( SURFACE-AT ?auto_482574 ?auto_482579 ) ( CLEAR ?auto_482574 ) ( LIFTING ?auto_482577 ?auto_482575 ) ( IS-CRATE ?auto_482575 ) ( ON ?auto_482571 ?auto_482570 ) ( ON ?auto_482572 ?auto_482571 ) ( ON ?auto_482573 ?auto_482572 ) ( ON ?auto_482574 ?auto_482573 ) ( not ( = ?auto_482570 ?auto_482571 ) ) ( not ( = ?auto_482570 ?auto_482572 ) ) ( not ( = ?auto_482570 ?auto_482573 ) ) ( not ( = ?auto_482570 ?auto_482574 ) ) ( not ( = ?auto_482570 ?auto_482575 ) ) ( not ( = ?auto_482570 ?auto_482576 ) ) ( not ( = ?auto_482570 ?auto_482578 ) ) ( not ( = ?auto_482571 ?auto_482572 ) ) ( not ( = ?auto_482571 ?auto_482573 ) ) ( not ( = ?auto_482571 ?auto_482574 ) ) ( not ( = ?auto_482571 ?auto_482575 ) ) ( not ( = ?auto_482571 ?auto_482576 ) ) ( not ( = ?auto_482571 ?auto_482578 ) ) ( not ( = ?auto_482572 ?auto_482573 ) ) ( not ( = ?auto_482572 ?auto_482574 ) ) ( not ( = ?auto_482572 ?auto_482575 ) ) ( not ( = ?auto_482572 ?auto_482576 ) ) ( not ( = ?auto_482572 ?auto_482578 ) ) ( not ( = ?auto_482573 ?auto_482574 ) ) ( not ( = ?auto_482573 ?auto_482575 ) ) ( not ( = ?auto_482573 ?auto_482576 ) ) ( not ( = ?auto_482573 ?auto_482578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482574 ?auto_482575 ?auto_482576 )
      ( MAKE-6CRATE-VERIFY ?auto_482570 ?auto_482571 ?auto_482572 ?auto_482573 ?auto_482574 ?auto_482575 ?auto_482576 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482634 - SURFACE
      ?auto_482635 - SURFACE
      ?auto_482636 - SURFACE
      ?auto_482637 - SURFACE
      ?auto_482638 - SURFACE
      ?auto_482639 - SURFACE
      ?auto_482640 - SURFACE
    )
    :vars
    (
      ?auto_482645 - HOIST
      ?auto_482644 - PLACE
      ?auto_482643 - PLACE
      ?auto_482646 - HOIST
      ?auto_482642 - SURFACE
      ?auto_482641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482645 ?auto_482644 ) ( IS-CRATE ?auto_482640 ) ( not ( = ?auto_482639 ?auto_482640 ) ) ( not ( = ?auto_482638 ?auto_482639 ) ) ( not ( = ?auto_482638 ?auto_482640 ) ) ( not ( = ?auto_482643 ?auto_482644 ) ) ( HOIST-AT ?auto_482646 ?auto_482643 ) ( not ( = ?auto_482645 ?auto_482646 ) ) ( AVAILABLE ?auto_482646 ) ( SURFACE-AT ?auto_482640 ?auto_482643 ) ( ON ?auto_482640 ?auto_482642 ) ( CLEAR ?auto_482640 ) ( not ( = ?auto_482639 ?auto_482642 ) ) ( not ( = ?auto_482640 ?auto_482642 ) ) ( not ( = ?auto_482638 ?auto_482642 ) ) ( TRUCK-AT ?auto_482641 ?auto_482644 ) ( SURFACE-AT ?auto_482638 ?auto_482644 ) ( CLEAR ?auto_482638 ) ( IS-CRATE ?auto_482639 ) ( AVAILABLE ?auto_482645 ) ( IN ?auto_482639 ?auto_482641 ) ( ON ?auto_482635 ?auto_482634 ) ( ON ?auto_482636 ?auto_482635 ) ( ON ?auto_482637 ?auto_482636 ) ( ON ?auto_482638 ?auto_482637 ) ( not ( = ?auto_482634 ?auto_482635 ) ) ( not ( = ?auto_482634 ?auto_482636 ) ) ( not ( = ?auto_482634 ?auto_482637 ) ) ( not ( = ?auto_482634 ?auto_482638 ) ) ( not ( = ?auto_482634 ?auto_482639 ) ) ( not ( = ?auto_482634 ?auto_482640 ) ) ( not ( = ?auto_482634 ?auto_482642 ) ) ( not ( = ?auto_482635 ?auto_482636 ) ) ( not ( = ?auto_482635 ?auto_482637 ) ) ( not ( = ?auto_482635 ?auto_482638 ) ) ( not ( = ?auto_482635 ?auto_482639 ) ) ( not ( = ?auto_482635 ?auto_482640 ) ) ( not ( = ?auto_482635 ?auto_482642 ) ) ( not ( = ?auto_482636 ?auto_482637 ) ) ( not ( = ?auto_482636 ?auto_482638 ) ) ( not ( = ?auto_482636 ?auto_482639 ) ) ( not ( = ?auto_482636 ?auto_482640 ) ) ( not ( = ?auto_482636 ?auto_482642 ) ) ( not ( = ?auto_482637 ?auto_482638 ) ) ( not ( = ?auto_482637 ?auto_482639 ) ) ( not ( = ?auto_482637 ?auto_482640 ) ) ( not ( = ?auto_482637 ?auto_482642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482638 ?auto_482639 ?auto_482640 )
      ( MAKE-6CRATE-VERIFY ?auto_482634 ?auto_482635 ?auto_482636 ?auto_482637 ?auto_482638 ?auto_482639 ?auto_482640 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484590 - SURFACE
      ?auto_484591 - SURFACE
      ?auto_484592 - SURFACE
      ?auto_484593 - SURFACE
      ?auto_484594 - SURFACE
      ?auto_484595 - SURFACE
      ?auto_484596 - SURFACE
      ?auto_484597 - SURFACE
    )
    :vars
    (
      ?auto_484599 - HOIST
      ?auto_484598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_484599 ?auto_484598 ) ( SURFACE-AT ?auto_484596 ?auto_484598 ) ( CLEAR ?auto_484596 ) ( LIFTING ?auto_484599 ?auto_484597 ) ( IS-CRATE ?auto_484597 ) ( not ( = ?auto_484596 ?auto_484597 ) ) ( ON ?auto_484591 ?auto_484590 ) ( ON ?auto_484592 ?auto_484591 ) ( ON ?auto_484593 ?auto_484592 ) ( ON ?auto_484594 ?auto_484593 ) ( ON ?auto_484595 ?auto_484594 ) ( ON ?auto_484596 ?auto_484595 ) ( not ( = ?auto_484590 ?auto_484591 ) ) ( not ( = ?auto_484590 ?auto_484592 ) ) ( not ( = ?auto_484590 ?auto_484593 ) ) ( not ( = ?auto_484590 ?auto_484594 ) ) ( not ( = ?auto_484590 ?auto_484595 ) ) ( not ( = ?auto_484590 ?auto_484596 ) ) ( not ( = ?auto_484590 ?auto_484597 ) ) ( not ( = ?auto_484591 ?auto_484592 ) ) ( not ( = ?auto_484591 ?auto_484593 ) ) ( not ( = ?auto_484591 ?auto_484594 ) ) ( not ( = ?auto_484591 ?auto_484595 ) ) ( not ( = ?auto_484591 ?auto_484596 ) ) ( not ( = ?auto_484591 ?auto_484597 ) ) ( not ( = ?auto_484592 ?auto_484593 ) ) ( not ( = ?auto_484592 ?auto_484594 ) ) ( not ( = ?auto_484592 ?auto_484595 ) ) ( not ( = ?auto_484592 ?auto_484596 ) ) ( not ( = ?auto_484592 ?auto_484597 ) ) ( not ( = ?auto_484593 ?auto_484594 ) ) ( not ( = ?auto_484593 ?auto_484595 ) ) ( not ( = ?auto_484593 ?auto_484596 ) ) ( not ( = ?auto_484593 ?auto_484597 ) ) ( not ( = ?auto_484594 ?auto_484595 ) ) ( not ( = ?auto_484594 ?auto_484596 ) ) ( not ( = ?auto_484594 ?auto_484597 ) ) ( not ( = ?auto_484595 ?auto_484596 ) ) ( not ( = ?auto_484595 ?auto_484597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_484596 ?auto_484597 )
      ( MAKE-7CRATE-VERIFY ?auto_484590 ?auto_484591 ?auto_484592 ?auto_484593 ?auto_484594 ?auto_484595 ?auto_484596 ?auto_484597 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484645 - SURFACE
      ?auto_484646 - SURFACE
      ?auto_484647 - SURFACE
      ?auto_484648 - SURFACE
      ?auto_484649 - SURFACE
      ?auto_484650 - SURFACE
      ?auto_484651 - SURFACE
      ?auto_484652 - SURFACE
    )
    :vars
    (
      ?auto_484655 - HOIST
      ?auto_484653 - PLACE
      ?auto_484654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484655 ?auto_484653 ) ( SURFACE-AT ?auto_484651 ?auto_484653 ) ( CLEAR ?auto_484651 ) ( IS-CRATE ?auto_484652 ) ( not ( = ?auto_484651 ?auto_484652 ) ) ( TRUCK-AT ?auto_484654 ?auto_484653 ) ( AVAILABLE ?auto_484655 ) ( IN ?auto_484652 ?auto_484654 ) ( ON ?auto_484651 ?auto_484650 ) ( not ( = ?auto_484650 ?auto_484651 ) ) ( not ( = ?auto_484650 ?auto_484652 ) ) ( ON ?auto_484646 ?auto_484645 ) ( ON ?auto_484647 ?auto_484646 ) ( ON ?auto_484648 ?auto_484647 ) ( ON ?auto_484649 ?auto_484648 ) ( ON ?auto_484650 ?auto_484649 ) ( not ( = ?auto_484645 ?auto_484646 ) ) ( not ( = ?auto_484645 ?auto_484647 ) ) ( not ( = ?auto_484645 ?auto_484648 ) ) ( not ( = ?auto_484645 ?auto_484649 ) ) ( not ( = ?auto_484645 ?auto_484650 ) ) ( not ( = ?auto_484645 ?auto_484651 ) ) ( not ( = ?auto_484645 ?auto_484652 ) ) ( not ( = ?auto_484646 ?auto_484647 ) ) ( not ( = ?auto_484646 ?auto_484648 ) ) ( not ( = ?auto_484646 ?auto_484649 ) ) ( not ( = ?auto_484646 ?auto_484650 ) ) ( not ( = ?auto_484646 ?auto_484651 ) ) ( not ( = ?auto_484646 ?auto_484652 ) ) ( not ( = ?auto_484647 ?auto_484648 ) ) ( not ( = ?auto_484647 ?auto_484649 ) ) ( not ( = ?auto_484647 ?auto_484650 ) ) ( not ( = ?auto_484647 ?auto_484651 ) ) ( not ( = ?auto_484647 ?auto_484652 ) ) ( not ( = ?auto_484648 ?auto_484649 ) ) ( not ( = ?auto_484648 ?auto_484650 ) ) ( not ( = ?auto_484648 ?auto_484651 ) ) ( not ( = ?auto_484648 ?auto_484652 ) ) ( not ( = ?auto_484649 ?auto_484650 ) ) ( not ( = ?auto_484649 ?auto_484651 ) ) ( not ( = ?auto_484649 ?auto_484652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484650 ?auto_484651 ?auto_484652 )
      ( MAKE-7CRATE-VERIFY ?auto_484645 ?auto_484646 ?auto_484647 ?auto_484648 ?auto_484649 ?auto_484650 ?auto_484651 ?auto_484652 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484708 - SURFACE
      ?auto_484709 - SURFACE
      ?auto_484710 - SURFACE
      ?auto_484711 - SURFACE
      ?auto_484712 - SURFACE
      ?auto_484713 - SURFACE
      ?auto_484714 - SURFACE
      ?auto_484715 - SURFACE
    )
    :vars
    (
      ?auto_484716 - HOIST
      ?auto_484717 - PLACE
      ?auto_484719 - TRUCK
      ?auto_484718 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_484716 ?auto_484717 ) ( SURFACE-AT ?auto_484714 ?auto_484717 ) ( CLEAR ?auto_484714 ) ( IS-CRATE ?auto_484715 ) ( not ( = ?auto_484714 ?auto_484715 ) ) ( AVAILABLE ?auto_484716 ) ( IN ?auto_484715 ?auto_484719 ) ( ON ?auto_484714 ?auto_484713 ) ( not ( = ?auto_484713 ?auto_484714 ) ) ( not ( = ?auto_484713 ?auto_484715 ) ) ( TRUCK-AT ?auto_484719 ?auto_484718 ) ( not ( = ?auto_484718 ?auto_484717 ) ) ( ON ?auto_484709 ?auto_484708 ) ( ON ?auto_484710 ?auto_484709 ) ( ON ?auto_484711 ?auto_484710 ) ( ON ?auto_484712 ?auto_484711 ) ( ON ?auto_484713 ?auto_484712 ) ( not ( = ?auto_484708 ?auto_484709 ) ) ( not ( = ?auto_484708 ?auto_484710 ) ) ( not ( = ?auto_484708 ?auto_484711 ) ) ( not ( = ?auto_484708 ?auto_484712 ) ) ( not ( = ?auto_484708 ?auto_484713 ) ) ( not ( = ?auto_484708 ?auto_484714 ) ) ( not ( = ?auto_484708 ?auto_484715 ) ) ( not ( = ?auto_484709 ?auto_484710 ) ) ( not ( = ?auto_484709 ?auto_484711 ) ) ( not ( = ?auto_484709 ?auto_484712 ) ) ( not ( = ?auto_484709 ?auto_484713 ) ) ( not ( = ?auto_484709 ?auto_484714 ) ) ( not ( = ?auto_484709 ?auto_484715 ) ) ( not ( = ?auto_484710 ?auto_484711 ) ) ( not ( = ?auto_484710 ?auto_484712 ) ) ( not ( = ?auto_484710 ?auto_484713 ) ) ( not ( = ?auto_484710 ?auto_484714 ) ) ( not ( = ?auto_484710 ?auto_484715 ) ) ( not ( = ?auto_484711 ?auto_484712 ) ) ( not ( = ?auto_484711 ?auto_484713 ) ) ( not ( = ?auto_484711 ?auto_484714 ) ) ( not ( = ?auto_484711 ?auto_484715 ) ) ( not ( = ?auto_484712 ?auto_484713 ) ) ( not ( = ?auto_484712 ?auto_484714 ) ) ( not ( = ?auto_484712 ?auto_484715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484713 ?auto_484714 ?auto_484715 )
      ( MAKE-7CRATE-VERIFY ?auto_484708 ?auto_484709 ?auto_484710 ?auto_484711 ?auto_484712 ?auto_484713 ?auto_484714 ?auto_484715 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484778 - SURFACE
      ?auto_484779 - SURFACE
      ?auto_484780 - SURFACE
      ?auto_484781 - SURFACE
      ?auto_484782 - SURFACE
      ?auto_484783 - SURFACE
      ?auto_484784 - SURFACE
      ?auto_484785 - SURFACE
    )
    :vars
    (
      ?auto_484789 - HOIST
      ?auto_484786 - PLACE
      ?auto_484787 - TRUCK
      ?auto_484788 - PLACE
      ?auto_484790 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_484789 ?auto_484786 ) ( SURFACE-AT ?auto_484784 ?auto_484786 ) ( CLEAR ?auto_484784 ) ( IS-CRATE ?auto_484785 ) ( not ( = ?auto_484784 ?auto_484785 ) ) ( AVAILABLE ?auto_484789 ) ( ON ?auto_484784 ?auto_484783 ) ( not ( = ?auto_484783 ?auto_484784 ) ) ( not ( = ?auto_484783 ?auto_484785 ) ) ( TRUCK-AT ?auto_484787 ?auto_484788 ) ( not ( = ?auto_484788 ?auto_484786 ) ) ( HOIST-AT ?auto_484790 ?auto_484788 ) ( LIFTING ?auto_484790 ?auto_484785 ) ( not ( = ?auto_484789 ?auto_484790 ) ) ( ON ?auto_484779 ?auto_484778 ) ( ON ?auto_484780 ?auto_484779 ) ( ON ?auto_484781 ?auto_484780 ) ( ON ?auto_484782 ?auto_484781 ) ( ON ?auto_484783 ?auto_484782 ) ( not ( = ?auto_484778 ?auto_484779 ) ) ( not ( = ?auto_484778 ?auto_484780 ) ) ( not ( = ?auto_484778 ?auto_484781 ) ) ( not ( = ?auto_484778 ?auto_484782 ) ) ( not ( = ?auto_484778 ?auto_484783 ) ) ( not ( = ?auto_484778 ?auto_484784 ) ) ( not ( = ?auto_484778 ?auto_484785 ) ) ( not ( = ?auto_484779 ?auto_484780 ) ) ( not ( = ?auto_484779 ?auto_484781 ) ) ( not ( = ?auto_484779 ?auto_484782 ) ) ( not ( = ?auto_484779 ?auto_484783 ) ) ( not ( = ?auto_484779 ?auto_484784 ) ) ( not ( = ?auto_484779 ?auto_484785 ) ) ( not ( = ?auto_484780 ?auto_484781 ) ) ( not ( = ?auto_484780 ?auto_484782 ) ) ( not ( = ?auto_484780 ?auto_484783 ) ) ( not ( = ?auto_484780 ?auto_484784 ) ) ( not ( = ?auto_484780 ?auto_484785 ) ) ( not ( = ?auto_484781 ?auto_484782 ) ) ( not ( = ?auto_484781 ?auto_484783 ) ) ( not ( = ?auto_484781 ?auto_484784 ) ) ( not ( = ?auto_484781 ?auto_484785 ) ) ( not ( = ?auto_484782 ?auto_484783 ) ) ( not ( = ?auto_484782 ?auto_484784 ) ) ( not ( = ?auto_484782 ?auto_484785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484783 ?auto_484784 ?auto_484785 )
      ( MAKE-7CRATE-VERIFY ?auto_484778 ?auto_484779 ?auto_484780 ?auto_484781 ?auto_484782 ?auto_484783 ?auto_484784 ?auto_484785 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484855 - SURFACE
      ?auto_484856 - SURFACE
      ?auto_484857 - SURFACE
      ?auto_484858 - SURFACE
      ?auto_484859 - SURFACE
      ?auto_484860 - SURFACE
      ?auto_484861 - SURFACE
      ?auto_484862 - SURFACE
    )
    :vars
    (
      ?auto_484864 - HOIST
      ?auto_484867 - PLACE
      ?auto_484868 - TRUCK
      ?auto_484863 - PLACE
      ?auto_484865 - HOIST
      ?auto_484866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_484864 ?auto_484867 ) ( SURFACE-AT ?auto_484861 ?auto_484867 ) ( CLEAR ?auto_484861 ) ( IS-CRATE ?auto_484862 ) ( not ( = ?auto_484861 ?auto_484862 ) ) ( AVAILABLE ?auto_484864 ) ( ON ?auto_484861 ?auto_484860 ) ( not ( = ?auto_484860 ?auto_484861 ) ) ( not ( = ?auto_484860 ?auto_484862 ) ) ( TRUCK-AT ?auto_484868 ?auto_484863 ) ( not ( = ?auto_484863 ?auto_484867 ) ) ( HOIST-AT ?auto_484865 ?auto_484863 ) ( not ( = ?auto_484864 ?auto_484865 ) ) ( AVAILABLE ?auto_484865 ) ( SURFACE-AT ?auto_484862 ?auto_484863 ) ( ON ?auto_484862 ?auto_484866 ) ( CLEAR ?auto_484862 ) ( not ( = ?auto_484861 ?auto_484866 ) ) ( not ( = ?auto_484862 ?auto_484866 ) ) ( not ( = ?auto_484860 ?auto_484866 ) ) ( ON ?auto_484856 ?auto_484855 ) ( ON ?auto_484857 ?auto_484856 ) ( ON ?auto_484858 ?auto_484857 ) ( ON ?auto_484859 ?auto_484858 ) ( ON ?auto_484860 ?auto_484859 ) ( not ( = ?auto_484855 ?auto_484856 ) ) ( not ( = ?auto_484855 ?auto_484857 ) ) ( not ( = ?auto_484855 ?auto_484858 ) ) ( not ( = ?auto_484855 ?auto_484859 ) ) ( not ( = ?auto_484855 ?auto_484860 ) ) ( not ( = ?auto_484855 ?auto_484861 ) ) ( not ( = ?auto_484855 ?auto_484862 ) ) ( not ( = ?auto_484855 ?auto_484866 ) ) ( not ( = ?auto_484856 ?auto_484857 ) ) ( not ( = ?auto_484856 ?auto_484858 ) ) ( not ( = ?auto_484856 ?auto_484859 ) ) ( not ( = ?auto_484856 ?auto_484860 ) ) ( not ( = ?auto_484856 ?auto_484861 ) ) ( not ( = ?auto_484856 ?auto_484862 ) ) ( not ( = ?auto_484856 ?auto_484866 ) ) ( not ( = ?auto_484857 ?auto_484858 ) ) ( not ( = ?auto_484857 ?auto_484859 ) ) ( not ( = ?auto_484857 ?auto_484860 ) ) ( not ( = ?auto_484857 ?auto_484861 ) ) ( not ( = ?auto_484857 ?auto_484862 ) ) ( not ( = ?auto_484857 ?auto_484866 ) ) ( not ( = ?auto_484858 ?auto_484859 ) ) ( not ( = ?auto_484858 ?auto_484860 ) ) ( not ( = ?auto_484858 ?auto_484861 ) ) ( not ( = ?auto_484858 ?auto_484862 ) ) ( not ( = ?auto_484858 ?auto_484866 ) ) ( not ( = ?auto_484859 ?auto_484860 ) ) ( not ( = ?auto_484859 ?auto_484861 ) ) ( not ( = ?auto_484859 ?auto_484862 ) ) ( not ( = ?auto_484859 ?auto_484866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484860 ?auto_484861 ?auto_484862 )
      ( MAKE-7CRATE-VERIFY ?auto_484855 ?auto_484856 ?auto_484857 ?auto_484858 ?auto_484859 ?auto_484860 ?auto_484861 ?auto_484862 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484933 - SURFACE
      ?auto_484934 - SURFACE
      ?auto_484935 - SURFACE
      ?auto_484936 - SURFACE
      ?auto_484937 - SURFACE
      ?auto_484938 - SURFACE
      ?auto_484939 - SURFACE
      ?auto_484940 - SURFACE
    )
    :vars
    (
      ?auto_484942 - HOIST
      ?auto_484945 - PLACE
      ?auto_484946 - PLACE
      ?auto_484941 - HOIST
      ?auto_484943 - SURFACE
      ?auto_484944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484942 ?auto_484945 ) ( SURFACE-AT ?auto_484939 ?auto_484945 ) ( CLEAR ?auto_484939 ) ( IS-CRATE ?auto_484940 ) ( not ( = ?auto_484939 ?auto_484940 ) ) ( AVAILABLE ?auto_484942 ) ( ON ?auto_484939 ?auto_484938 ) ( not ( = ?auto_484938 ?auto_484939 ) ) ( not ( = ?auto_484938 ?auto_484940 ) ) ( not ( = ?auto_484946 ?auto_484945 ) ) ( HOIST-AT ?auto_484941 ?auto_484946 ) ( not ( = ?auto_484942 ?auto_484941 ) ) ( AVAILABLE ?auto_484941 ) ( SURFACE-AT ?auto_484940 ?auto_484946 ) ( ON ?auto_484940 ?auto_484943 ) ( CLEAR ?auto_484940 ) ( not ( = ?auto_484939 ?auto_484943 ) ) ( not ( = ?auto_484940 ?auto_484943 ) ) ( not ( = ?auto_484938 ?auto_484943 ) ) ( TRUCK-AT ?auto_484944 ?auto_484945 ) ( ON ?auto_484934 ?auto_484933 ) ( ON ?auto_484935 ?auto_484934 ) ( ON ?auto_484936 ?auto_484935 ) ( ON ?auto_484937 ?auto_484936 ) ( ON ?auto_484938 ?auto_484937 ) ( not ( = ?auto_484933 ?auto_484934 ) ) ( not ( = ?auto_484933 ?auto_484935 ) ) ( not ( = ?auto_484933 ?auto_484936 ) ) ( not ( = ?auto_484933 ?auto_484937 ) ) ( not ( = ?auto_484933 ?auto_484938 ) ) ( not ( = ?auto_484933 ?auto_484939 ) ) ( not ( = ?auto_484933 ?auto_484940 ) ) ( not ( = ?auto_484933 ?auto_484943 ) ) ( not ( = ?auto_484934 ?auto_484935 ) ) ( not ( = ?auto_484934 ?auto_484936 ) ) ( not ( = ?auto_484934 ?auto_484937 ) ) ( not ( = ?auto_484934 ?auto_484938 ) ) ( not ( = ?auto_484934 ?auto_484939 ) ) ( not ( = ?auto_484934 ?auto_484940 ) ) ( not ( = ?auto_484934 ?auto_484943 ) ) ( not ( = ?auto_484935 ?auto_484936 ) ) ( not ( = ?auto_484935 ?auto_484937 ) ) ( not ( = ?auto_484935 ?auto_484938 ) ) ( not ( = ?auto_484935 ?auto_484939 ) ) ( not ( = ?auto_484935 ?auto_484940 ) ) ( not ( = ?auto_484935 ?auto_484943 ) ) ( not ( = ?auto_484936 ?auto_484937 ) ) ( not ( = ?auto_484936 ?auto_484938 ) ) ( not ( = ?auto_484936 ?auto_484939 ) ) ( not ( = ?auto_484936 ?auto_484940 ) ) ( not ( = ?auto_484936 ?auto_484943 ) ) ( not ( = ?auto_484937 ?auto_484938 ) ) ( not ( = ?auto_484937 ?auto_484939 ) ) ( not ( = ?auto_484937 ?auto_484940 ) ) ( not ( = ?auto_484937 ?auto_484943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484938 ?auto_484939 ?auto_484940 )
      ( MAKE-7CRATE-VERIFY ?auto_484933 ?auto_484934 ?auto_484935 ?auto_484936 ?auto_484937 ?auto_484938 ?auto_484939 ?auto_484940 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485011 - SURFACE
      ?auto_485012 - SURFACE
      ?auto_485013 - SURFACE
      ?auto_485014 - SURFACE
      ?auto_485015 - SURFACE
      ?auto_485016 - SURFACE
      ?auto_485017 - SURFACE
      ?auto_485018 - SURFACE
    )
    :vars
    (
      ?auto_485023 - HOIST
      ?auto_485022 - PLACE
      ?auto_485021 - PLACE
      ?auto_485024 - HOIST
      ?auto_485020 - SURFACE
      ?auto_485019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485023 ?auto_485022 ) ( IS-CRATE ?auto_485018 ) ( not ( = ?auto_485017 ?auto_485018 ) ) ( not ( = ?auto_485016 ?auto_485017 ) ) ( not ( = ?auto_485016 ?auto_485018 ) ) ( not ( = ?auto_485021 ?auto_485022 ) ) ( HOIST-AT ?auto_485024 ?auto_485021 ) ( not ( = ?auto_485023 ?auto_485024 ) ) ( AVAILABLE ?auto_485024 ) ( SURFACE-AT ?auto_485018 ?auto_485021 ) ( ON ?auto_485018 ?auto_485020 ) ( CLEAR ?auto_485018 ) ( not ( = ?auto_485017 ?auto_485020 ) ) ( not ( = ?auto_485018 ?auto_485020 ) ) ( not ( = ?auto_485016 ?auto_485020 ) ) ( TRUCK-AT ?auto_485019 ?auto_485022 ) ( SURFACE-AT ?auto_485016 ?auto_485022 ) ( CLEAR ?auto_485016 ) ( LIFTING ?auto_485023 ?auto_485017 ) ( IS-CRATE ?auto_485017 ) ( ON ?auto_485012 ?auto_485011 ) ( ON ?auto_485013 ?auto_485012 ) ( ON ?auto_485014 ?auto_485013 ) ( ON ?auto_485015 ?auto_485014 ) ( ON ?auto_485016 ?auto_485015 ) ( not ( = ?auto_485011 ?auto_485012 ) ) ( not ( = ?auto_485011 ?auto_485013 ) ) ( not ( = ?auto_485011 ?auto_485014 ) ) ( not ( = ?auto_485011 ?auto_485015 ) ) ( not ( = ?auto_485011 ?auto_485016 ) ) ( not ( = ?auto_485011 ?auto_485017 ) ) ( not ( = ?auto_485011 ?auto_485018 ) ) ( not ( = ?auto_485011 ?auto_485020 ) ) ( not ( = ?auto_485012 ?auto_485013 ) ) ( not ( = ?auto_485012 ?auto_485014 ) ) ( not ( = ?auto_485012 ?auto_485015 ) ) ( not ( = ?auto_485012 ?auto_485016 ) ) ( not ( = ?auto_485012 ?auto_485017 ) ) ( not ( = ?auto_485012 ?auto_485018 ) ) ( not ( = ?auto_485012 ?auto_485020 ) ) ( not ( = ?auto_485013 ?auto_485014 ) ) ( not ( = ?auto_485013 ?auto_485015 ) ) ( not ( = ?auto_485013 ?auto_485016 ) ) ( not ( = ?auto_485013 ?auto_485017 ) ) ( not ( = ?auto_485013 ?auto_485018 ) ) ( not ( = ?auto_485013 ?auto_485020 ) ) ( not ( = ?auto_485014 ?auto_485015 ) ) ( not ( = ?auto_485014 ?auto_485016 ) ) ( not ( = ?auto_485014 ?auto_485017 ) ) ( not ( = ?auto_485014 ?auto_485018 ) ) ( not ( = ?auto_485014 ?auto_485020 ) ) ( not ( = ?auto_485015 ?auto_485016 ) ) ( not ( = ?auto_485015 ?auto_485017 ) ) ( not ( = ?auto_485015 ?auto_485018 ) ) ( not ( = ?auto_485015 ?auto_485020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485016 ?auto_485017 ?auto_485018 )
      ( MAKE-7CRATE-VERIFY ?auto_485011 ?auto_485012 ?auto_485013 ?auto_485014 ?auto_485015 ?auto_485016 ?auto_485017 ?auto_485018 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485089 - SURFACE
      ?auto_485090 - SURFACE
      ?auto_485091 - SURFACE
      ?auto_485092 - SURFACE
      ?auto_485093 - SURFACE
      ?auto_485094 - SURFACE
      ?auto_485095 - SURFACE
      ?auto_485096 - SURFACE
    )
    :vars
    (
      ?auto_485101 - HOIST
      ?auto_485097 - PLACE
      ?auto_485102 - PLACE
      ?auto_485099 - HOIST
      ?auto_485100 - SURFACE
      ?auto_485098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485101 ?auto_485097 ) ( IS-CRATE ?auto_485096 ) ( not ( = ?auto_485095 ?auto_485096 ) ) ( not ( = ?auto_485094 ?auto_485095 ) ) ( not ( = ?auto_485094 ?auto_485096 ) ) ( not ( = ?auto_485102 ?auto_485097 ) ) ( HOIST-AT ?auto_485099 ?auto_485102 ) ( not ( = ?auto_485101 ?auto_485099 ) ) ( AVAILABLE ?auto_485099 ) ( SURFACE-AT ?auto_485096 ?auto_485102 ) ( ON ?auto_485096 ?auto_485100 ) ( CLEAR ?auto_485096 ) ( not ( = ?auto_485095 ?auto_485100 ) ) ( not ( = ?auto_485096 ?auto_485100 ) ) ( not ( = ?auto_485094 ?auto_485100 ) ) ( TRUCK-AT ?auto_485098 ?auto_485097 ) ( SURFACE-AT ?auto_485094 ?auto_485097 ) ( CLEAR ?auto_485094 ) ( IS-CRATE ?auto_485095 ) ( AVAILABLE ?auto_485101 ) ( IN ?auto_485095 ?auto_485098 ) ( ON ?auto_485090 ?auto_485089 ) ( ON ?auto_485091 ?auto_485090 ) ( ON ?auto_485092 ?auto_485091 ) ( ON ?auto_485093 ?auto_485092 ) ( ON ?auto_485094 ?auto_485093 ) ( not ( = ?auto_485089 ?auto_485090 ) ) ( not ( = ?auto_485089 ?auto_485091 ) ) ( not ( = ?auto_485089 ?auto_485092 ) ) ( not ( = ?auto_485089 ?auto_485093 ) ) ( not ( = ?auto_485089 ?auto_485094 ) ) ( not ( = ?auto_485089 ?auto_485095 ) ) ( not ( = ?auto_485089 ?auto_485096 ) ) ( not ( = ?auto_485089 ?auto_485100 ) ) ( not ( = ?auto_485090 ?auto_485091 ) ) ( not ( = ?auto_485090 ?auto_485092 ) ) ( not ( = ?auto_485090 ?auto_485093 ) ) ( not ( = ?auto_485090 ?auto_485094 ) ) ( not ( = ?auto_485090 ?auto_485095 ) ) ( not ( = ?auto_485090 ?auto_485096 ) ) ( not ( = ?auto_485090 ?auto_485100 ) ) ( not ( = ?auto_485091 ?auto_485092 ) ) ( not ( = ?auto_485091 ?auto_485093 ) ) ( not ( = ?auto_485091 ?auto_485094 ) ) ( not ( = ?auto_485091 ?auto_485095 ) ) ( not ( = ?auto_485091 ?auto_485096 ) ) ( not ( = ?auto_485091 ?auto_485100 ) ) ( not ( = ?auto_485092 ?auto_485093 ) ) ( not ( = ?auto_485092 ?auto_485094 ) ) ( not ( = ?auto_485092 ?auto_485095 ) ) ( not ( = ?auto_485092 ?auto_485096 ) ) ( not ( = ?auto_485092 ?auto_485100 ) ) ( not ( = ?auto_485093 ?auto_485094 ) ) ( not ( = ?auto_485093 ?auto_485095 ) ) ( not ( = ?auto_485093 ?auto_485096 ) ) ( not ( = ?auto_485093 ?auto_485100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485094 ?auto_485095 ?auto_485096 )
      ( MAKE-7CRATE-VERIFY ?auto_485089 ?auto_485090 ?auto_485091 ?auto_485092 ?auto_485093 ?auto_485094 ?auto_485095 ?auto_485096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_486664 - SURFACE
      ?auto_486665 - SURFACE
    )
    :vars
    (
      ?auto_486667 - HOIST
      ?auto_486668 - PLACE
      ?auto_486671 - SURFACE
      ?auto_486669 - TRUCK
      ?auto_486672 - PLACE
      ?auto_486666 - HOIST
      ?auto_486670 - SURFACE
      ?auto_486673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_486667 ?auto_486668 ) ( SURFACE-AT ?auto_486664 ?auto_486668 ) ( CLEAR ?auto_486664 ) ( IS-CRATE ?auto_486665 ) ( not ( = ?auto_486664 ?auto_486665 ) ) ( AVAILABLE ?auto_486667 ) ( ON ?auto_486664 ?auto_486671 ) ( not ( = ?auto_486671 ?auto_486664 ) ) ( not ( = ?auto_486671 ?auto_486665 ) ) ( TRUCK-AT ?auto_486669 ?auto_486672 ) ( not ( = ?auto_486672 ?auto_486668 ) ) ( HOIST-AT ?auto_486666 ?auto_486672 ) ( not ( = ?auto_486667 ?auto_486666 ) ) ( SURFACE-AT ?auto_486665 ?auto_486672 ) ( ON ?auto_486665 ?auto_486670 ) ( CLEAR ?auto_486665 ) ( not ( = ?auto_486664 ?auto_486670 ) ) ( not ( = ?auto_486665 ?auto_486670 ) ) ( not ( = ?auto_486671 ?auto_486670 ) ) ( LIFTING ?auto_486666 ?auto_486673 ) ( IS-CRATE ?auto_486673 ) ( not ( = ?auto_486664 ?auto_486673 ) ) ( not ( = ?auto_486665 ?auto_486673 ) ) ( not ( = ?auto_486671 ?auto_486673 ) ) ( not ( = ?auto_486670 ?auto_486673 ) ) )
    :subtasks
    ( ( !LOAD ?auto_486666 ?auto_486673 ?auto_486669 ?auto_486672 )
      ( MAKE-1CRATE ?auto_486664 ?auto_486665 )
      ( MAKE-1CRATE-VERIFY ?auto_486664 ?auto_486665 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488000 - SURFACE
      ?auto_488001 - SURFACE
      ?auto_488002 - SURFACE
      ?auto_488003 - SURFACE
      ?auto_488004 - SURFACE
      ?auto_488005 - SURFACE
      ?auto_488006 - SURFACE
      ?auto_488007 - SURFACE
      ?auto_488008 - SURFACE
    )
    :vars
    (
      ?auto_488010 - HOIST
      ?auto_488009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_488010 ?auto_488009 ) ( SURFACE-AT ?auto_488007 ?auto_488009 ) ( CLEAR ?auto_488007 ) ( LIFTING ?auto_488010 ?auto_488008 ) ( IS-CRATE ?auto_488008 ) ( not ( = ?auto_488007 ?auto_488008 ) ) ( ON ?auto_488001 ?auto_488000 ) ( ON ?auto_488002 ?auto_488001 ) ( ON ?auto_488003 ?auto_488002 ) ( ON ?auto_488004 ?auto_488003 ) ( ON ?auto_488005 ?auto_488004 ) ( ON ?auto_488006 ?auto_488005 ) ( ON ?auto_488007 ?auto_488006 ) ( not ( = ?auto_488000 ?auto_488001 ) ) ( not ( = ?auto_488000 ?auto_488002 ) ) ( not ( = ?auto_488000 ?auto_488003 ) ) ( not ( = ?auto_488000 ?auto_488004 ) ) ( not ( = ?auto_488000 ?auto_488005 ) ) ( not ( = ?auto_488000 ?auto_488006 ) ) ( not ( = ?auto_488000 ?auto_488007 ) ) ( not ( = ?auto_488000 ?auto_488008 ) ) ( not ( = ?auto_488001 ?auto_488002 ) ) ( not ( = ?auto_488001 ?auto_488003 ) ) ( not ( = ?auto_488001 ?auto_488004 ) ) ( not ( = ?auto_488001 ?auto_488005 ) ) ( not ( = ?auto_488001 ?auto_488006 ) ) ( not ( = ?auto_488001 ?auto_488007 ) ) ( not ( = ?auto_488001 ?auto_488008 ) ) ( not ( = ?auto_488002 ?auto_488003 ) ) ( not ( = ?auto_488002 ?auto_488004 ) ) ( not ( = ?auto_488002 ?auto_488005 ) ) ( not ( = ?auto_488002 ?auto_488006 ) ) ( not ( = ?auto_488002 ?auto_488007 ) ) ( not ( = ?auto_488002 ?auto_488008 ) ) ( not ( = ?auto_488003 ?auto_488004 ) ) ( not ( = ?auto_488003 ?auto_488005 ) ) ( not ( = ?auto_488003 ?auto_488006 ) ) ( not ( = ?auto_488003 ?auto_488007 ) ) ( not ( = ?auto_488003 ?auto_488008 ) ) ( not ( = ?auto_488004 ?auto_488005 ) ) ( not ( = ?auto_488004 ?auto_488006 ) ) ( not ( = ?auto_488004 ?auto_488007 ) ) ( not ( = ?auto_488004 ?auto_488008 ) ) ( not ( = ?auto_488005 ?auto_488006 ) ) ( not ( = ?auto_488005 ?auto_488007 ) ) ( not ( = ?auto_488005 ?auto_488008 ) ) ( not ( = ?auto_488006 ?auto_488007 ) ) ( not ( = ?auto_488006 ?auto_488008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_488007 ?auto_488008 )
      ( MAKE-8CRATE-VERIFY ?auto_488000 ?auto_488001 ?auto_488002 ?auto_488003 ?auto_488004 ?auto_488005 ?auto_488006 ?auto_488007 ?auto_488008 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488067 - SURFACE
      ?auto_488068 - SURFACE
      ?auto_488069 - SURFACE
      ?auto_488070 - SURFACE
      ?auto_488071 - SURFACE
      ?auto_488072 - SURFACE
      ?auto_488073 - SURFACE
      ?auto_488074 - SURFACE
      ?auto_488075 - SURFACE
    )
    :vars
    (
      ?auto_488078 - HOIST
      ?auto_488076 - PLACE
      ?auto_488077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488078 ?auto_488076 ) ( SURFACE-AT ?auto_488074 ?auto_488076 ) ( CLEAR ?auto_488074 ) ( IS-CRATE ?auto_488075 ) ( not ( = ?auto_488074 ?auto_488075 ) ) ( TRUCK-AT ?auto_488077 ?auto_488076 ) ( AVAILABLE ?auto_488078 ) ( IN ?auto_488075 ?auto_488077 ) ( ON ?auto_488074 ?auto_488073 ) ( not ( = ?auto_488073 ?auto_488074 ) ) ( not ( = ?auto_488073 ?auto_488075 ) ) ( ON ?auto_488068 ?auto_488067 ) ( ON ?auto_488069 ?auto_488068 ) ( ON ?auto_488070 ?auto_488069 ) ( ON ?auto_488071 ?auto_488070 ) ( ON ?auto_488072 ?auto_488071 ) ( ON ?auto_488073 ?auto_488072 ) ( not ( = ?auto_488067 ?auto_488068 ) ) ( not ( = ?auto_488067 ?auto_488069 ) ) ( not ( = ?auto_488067 ?auto_488070 ) ) ( not ( = ?auto_488067 ?auto_488071 ) ) ( not ( = ?auto_488067 ?auto_488072 ) ) ( not ( = ?auto_488067 ?auto_488073 ) ) ( not ( = ?auto_488067 ?auto_488074 ) ) ( not ( = ?auto_488067 ?auto_488075 ) ) ( not ( = ?auto_488068 ?auto_488069 ) ) ( not ( = ?auto_488068 ?auto_488070 ) ) ( not ( = ?auto_488068 ?auto_488071 ) ) ( not ( = ?auto_488068 ?auto_488072 ) ) ( not ( = ?auto_488068 ?auto_488073 ) ) ( not ( = ?auto_488068 ?auto_488074 ) ) ( not ( = ?auto_488068 ?auto_488075 ) ) ( not ( = ?auto_488069 ?auto_488070 ) ) ( not ( = ?auto_488069 ?auto_488071 ) ) ( not ( = ?auto_488069 ?auto_488072 ) ) ( not ( = ?auto_488069 ?auto_488073 ) ) ( not ( = ?auto_488069 ?auto_488074 ) ) ( not ( = ?auto_488069 ?auto_488075 ) ) ( not ( = ?auto_488070 ?auto_488071 ) ) ( not ( = ?auto_488070 ?auto_488072 ) ) ( not ( = ?auto_488070 ?auto_488073 ) ) ( not ( = ?auto_488070 ?auto_488074 ) ) ( not ( = ?auto_488070 ?auto_488075 ) ) ( not ( = ?auto_488071 ?auto_488072 ) ) ( not ( = ?auto_488071 ?auto_488073 ) ) ( not ( = ?auto_488071 ?auto_488074 ) ) ( not ( = ?auto_488071 ?auto_488075 ) ) ( not ( = ?auto_488072 ?auto_488073 ) ) ( not ( = ?auto_488072 ?auto_488074 ) ) ( not ( = ?auto_488072 ?auto_488075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488073 ?auto_488074 ?auto_488075 )
      ( MAKE-8CRATE-VERIFY ?auto_488067 ?auto_488068 ?auto_488069 ?auto_488070 ?auto_488071 ?auto_488072 ?auto_488073 ?auto_488074 ?auto_488075 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488143 - SURFACE
      ?auto_488144 - SURFACE
      ?auto_488145 - SURFACE
      ?auto_488146 - SURFACE
      ?auto_488147 - SURFACE
      ?auto_488148 - SURFACE
      ?auto_488149 - SURFACE
      ?auto_488150 - SURFACE
      ?auto_488151 - SURFACE
    )
    :vars
    (
      ?auto_488154 - HOIST
      ?auto_488153 - PLACE
      ?auto_488155 - TRUCK
      ?auto_488152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_488154 ?auto_488153 ) ( SURFACE-AT ?auto_488150 ?auto_488153 ) ( CLEAR ?auto_488150 ) ( IS-CRATE ?auto_488151 ) ( not ( = ?auto_488150 ?auto_488151 ) ) ( AVAILABLE ?auto_488154 ) ( IN ?auto_488151 ?auto_488155 ) ( ON ?auto_488150 ?auto_488149 ) ( not ( = ?auto_488149 ?auto_488150 ) ) ( not ( = ?auto_488149 ?auto_488151 ) ) ( TRUCK-AT ?auto_488155 ?auto_488152 ) ( not ( = ?auto_488152 ?auto_488153 ) ) ( ON ?auto_488144 ?auto_488143 ) ( ON ?auto_488145 ?auto_488144 ) ( ON ?auto_488146 ?auto_488145 ) ( ON ?auto_488147 ?auto_488146 ) ( ON ?auto_488148 ?auto_488147 ) ( ON ?auto_488149 ?auto_488148 ) ( not ( = ?auto_488143 ?auto_488144 ) ) ( not ( = ?auto_488143 ?auto_488145 ) ) ( not ( = ?auto_488143 ?auto_488146 ) ) ( not ( = ?auto_488143 ?auto_488147 ) ) ( not ( = ?auto_488143 ?auto_488148 ) ) ( not ( = ?auto_488143 ?auto_488149 ) ) ( not ( = ?auto_488143 ?auto_488150 ) ) ( not ( = ?auto_488143 ?auto_488151 ) ) ( not ( = ?auto_488144 ?auto_488145 ) ) ( not ( = ?auto_488144 ?auto_488146 ) ) ( not ( = ?auto_488144 ?auto_488147 ) ) ( not ( = ?auto_488144 ?auto_488148 ) ) ( not ( = ?auto_488144 ?auto_488149 ) ) ( not ( = ?auto_488144 ?auto_488150 ) ) ( not ( = ?auto_488144 ?auto_488151 ) ) ( not ( = ?auto_488145 ?auto_488146 ) ) ( not ( = ?auto_488145 ?auto_488147 ) ) ( not ( = ?auto_488145 ?auto_488148 ) ) ( not ( = ?auto_488145 ?auto_488149 ) ) ( not ( = ?auto_488145 ?auto_488150 ) ) ( not ( = ?auto_488145 ?auto_488151 ) ) ( not ( = ?auto_488146 ?auto_488147 ) ) ( not ( = ?auto_488146 ?auto_488148 ) ) ( not ( = ?auto_488146 ?auto_488149 ) ) ( not ( = ?auto_488146 ?auto_488150 ) ) ( not ( = ?auto_488146 ?auto_488151 ) ) ( not ( = ?auto_488147 ?auto_488148 ) ) ( not ( = ?auto_488147 ?auto_488149 ) ) ( not ( = ?auto_488147 ?auto_488150 ) ) ( not ( = ?auto_488147 ?auto_488151 ) ) ( not ( = ?auto_488148 ?auto_488149 ) ) ( not ( = ?auto_488148 ?auto_488150 ) ) ( not ( = ?auto_488148 ?auto_488151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488149 ?auto_488150 ?auto_488151 )
      ( MAKE-8CRATE-VERIFY ?auto_488143 ?auto_488144 ?auto_488145 ?auto_488146 ?auto_488147 ?auto_488148 ?auto_488149 ?auto_488150 ?auto_488151 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488227 - SURFACE
      ?auto_488228 - SURFACE
      ?auto_488229 - SURFACE
      ?auto_488230 - SURFACE
      ?auto_488231 - SURFACE
      ?auto_488232 - SURFACE
      ?auto_488233 - SURFACE
      ?auto_488234 - SURFACE
      ?auto_488235 - SURFACE
    )
    :vars
    (
      ?auto_488238 - HOIST
      ?auto_488237 - PLACE
      ?auto_488240 - TRUCK
      ?auto_488236 - PLACE
      ?auto_488239 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_488238 ?auto_488237 ) ( SURFACE-AT ?auto_488234 ?auto_488237 ) ( CLEAR ?auto_488234 ) ( IS-CRATE ?auto_488235 ) ( not ( = ?auto_488234 ?auto_488235 ) ) ( AVAILABLE ?auto_488238 ) ( ON ?auto_488234 ?auto_488233 ) ( not ( = ?auto_488233 ?auto_488234 ) ) ( not ( = ?auto_488233 ?auto_488235 ) ) ( TRUCK-AT ?auto_488240 ?auto_488236 ) ( not ( = ?auto_488236 ?auto_488237 ) ) ( HOIST-AT ?auto_488239 ?auto_488236 ) ( LIFTING ?auto_488239 ?auto_488235 ) ( not ( = ?auto_488238 ?auto_488239 ) ) ( ON ?auto_488228 ?auto_488227 ) ( ON ?auto_488229 ?auto_488228 ) ( ON ?auto_488230 ?auto_488229 ) ( ON ?auto_488231 ?auto_488230 ) ( ON ?auto_488232 ?auto_488231 ) ( ON ?auto_488233 ?auto_488232 ) ( not ( = ?auto_488227 ?auto_488228 ) ) ( not ( = ?auto_488227 ?auto_488229 ) ) ( not ( = ?auto_488227 ?auto_488230 ) ) ( not ( = ?auto_488227 ?auto_488231 ) ) ( not ( = ?auto_488227 ?auto_488232 ) ) ( not ( = ?auto_488227 ?auto_488233 ) ) ( not ( = ?auto_488227 ?auto_488234 ) ) ( not ( = ?auto_488227 ?auto_488235 ) ) ( not ( = ?auto_488228 ?auto_488229 ) ) ( not ( = ?auto_488228 ?auto_488230 ) ) ( not ( = ?auto_488228 ?auto_488231 ) ) ( not ( = ?auto_488228 ?auto_488232 ) ) ( not ( = ?auto_488228 ?auto_488233 ) ) ( not ( = ?auto_488228 ?auto_488234 ) ) ( not ( = ?auto_488228 ?auto_488235 ) ) ( not ( = ?auto_488229 ?auto_488230 ) ) ( not ( = ?auto_488229 ?auto_488231 ) ) ( not ( = ?auto_488229 ?auto_488232 ) ) ( not ( = ?auto_488229 ?auto_488233 ) ) ( not ( = ?auto_488229 ?auto_488234 ) ) ( not ( = ?auto_488229 ?auto_488235 ) ) ( not ( = ?auto_488230 ?auto_488231 ) ) ( not ( = ?auto_488230 ?auto_488232 ) ) ( not ( = ?auto_488230 ?auto_488233 ) ) ( not ( = ?auto_488230 ?auto_488234 ) ) ( not ( = ?auto_488230 ?auto_488235 ) ) ( not ( = ?auto_488231 ?auto_488232 ) ) ( not ( = ?auto_488231 ?auto_488233 ) ) ( not ( = ?auto_488231 ?auto_488234 ) ) ( not ( = ?auto_488231 ?auto_488235 ) ) ( not ( = ?auto_488232 ?auto_488233 ) ) ( not ( = ?auto_488232 ?auto_488234 ) ) ( not ( = ?auto_488232 ?auto_488235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488233 ?auto_488234 ?auto_488235 )
      ( MAKE-8CRATE-VERIFY ?auto_488227 ?auto_488228 ?auto_488229 ?auto_488230 ?auto_488231 ?auto_488232 ?auto_488233 ?auto_488234 ?auto_488235 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488319 - SURFACE
      ?auto_488320 - SURFACE
      ?auto_488321 - SURFACE
      ?auto_488322 - SURFACE
      ?auto_488323 - SURFACE
      ?auto_488324 - SURFACE
      ?auto_488325 - SURFACE
      ?auto_488326 - SURFACE
      ?auto_488327 - SURFACE
    )
    :vars
    (
      ?auto_488331 - HOIST
      ?auto_488329 - PLACE
      ?auto_488330 - TRUCK
      ?auto_488333 - PLACE
      ?auto_488328 - HOIST
      ?auto_488332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_488331 ?auto_488329 ) ( SURFACE-AT ?auto_488326 ?auto_488329 ) ( CLEAR ?auto_488326 ) ( IS-CRATE ?auto_488327 ) ( not ( = ?auto_488326 ?auto_488327 ) ) ( AVAILABLE ?auto_488331 ) ( ON ?auto_488326 ?auto_488325 ) ( not ( = ?auto_488325 ?auto_488326 ) ) ( not ( = ?auto_488325 ?auto_488327 ) ) ( TRUCK-AT ?auto_488330 ?auto_488333 ) ( not ( = ?auto_488333 ?auto_488329 ) ) ( HOIST-AT ?auto_488328 ?auto_488333 ) ( not ( = ?auto_488331 ?auto_488328 ) ) ( AVAILABLE ?auto_488328 ) ( SURFACE-AT ?auto_488327 ?auto_488333 ) ( ON ?auto_488327 ?auto_488332 ) ( CLEAR ?auto_488327 ) ( not ( = ?auto_488326 ?auto_488332 ) ) ( not ( = ?auto_488327 ?auto_488332 ) ) ( not ( = ?auto_488325 ?auto_488332 ) ) ( ON ?auto_488320 ?auto_488319 ) ( ON ?auto_488321 ?auto_488320 ) ( ON ?auto_488322 ?auto_488321 ) ( ON ?auto_488323 ?auto_488322 ) ( ON ?auto_488324 ?auto_488323 ) ( ON ?auto_488325 ?auto_488324 ) ( not ( = ?auto_488319 ?auto_488320 ) ) ( not ( = ?auto_488319 ?auto_488321 ) ) ( not ( = ?auto_488319 ?auto_488322 ) ) ( not ( = ?auto_488319 ?auto_488323 ) ) ( not ( = ?auto_488319 ?auto_488324 ) ) ( not ( = ?auto_488319 ?auto_488325 ) ) ( not ( = ?auto_488319 ?auto_488326 ) ) ( not ( = ?auto_488319 ?auto_488327 ) ) ( not ( = ?auto_488319 ?auto_488332 ) ) ( not ( = ?auto_488320 ?auto_488321 ) ) ( not ( = ?auto_488320 ?auto_488322 ) ) ( not ( = ?auto_488320 ?auto_488323 ) ) ( not ( = ?auto_488320 ?auto_488324 ) ) ( not ( = ?auto_488320 ?auto_488325 ) ) ( not ( = ?auto_488320 ?auto_488326 ) ) ( not ( = ?auto_488320 ?auto_488327 ) ) ( not ( = ?auto_488320 ?auto_488332 ) ) ( not ( = ?auto_488321 ?auto_488322 ) ) ( not ( = ?auto_488321 ?auto_488323 ) ) ( not ( = ?auto_488321 ?auto_488324 ) ) ( not ( = ?auto_488321 ?auto_488325 ) ) ( not ( = ?auto_488321 ?auto_488326 ) ) ( not ( = ?auto_488321 ?auto_488327 ) ) ( not ( = ?auto_488321 ?auto_488332 ) ) ( not ( = ?auto_488322 ?auto_488323 ) ) ( not ( = ?auto_488322 ?auto_488324 ) ) ( not ( = ?auto_488322 ?auto_488325 ) ) ( not ( = ?auto_488322 ?auto_488326 ) ) ( not ( = ?auto_488322 ?auto_488327 ) ) ( not ( = ?auto_488322 ?auto_488332 ) ) ( not ( = ?auto_488323 ?auto_488324 ) ) ( not ( = ?auto_488323 ?auto_488325 ) ) ( not ( = ?auto_488323 ?auto_488326 ) ) ( not ( = ?auto_488323 ?auto_488327 ) ) ( not ( = ?auto_488323 ?auto_488332 ) ) ( not ( = ?auto_488324 ?auto_488325 ) ) ( not ( = ?auto_488324 ?auto_488326 ) ) ( not ( = ?auto_488324 ?auto_488327 ) ) ( not ( = ?auto_488324 ?auto_488332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488325 ?auto_488326 ?auto_488327 )
      ( MAKE-8CRATE-VERIFY ?auto_488319 ?auto_488320 ?auto_488321 ?auto_488322 ?auto_488323 ?auto_488324 ?auto_488325 ?auto_488326 ?auto_488327 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488412 - SURFACE
      ?auto_488413 - SURFACE
      ?auto_488414 - SURFACE
      ?auto_488415 - SURFACE
      ?auto_488416 - SURFACE
      ?auto_488417 - SURFACE
      ?auto_488418 - SURFACE
      ?auto_488419 - SURFACE
      ?auto_488420 - SURFACE
    )
    :vars
    (
      ?auto_488426 - HOIST
      ?auto_488425 - PLACE
      ?auto_488423 - PLACE
      ?auto_488422 - HOIST
      ?auto_488424 - SURFACE
      ?auto_488421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488426 ?auto_488425 ) ( SURFACE-AT ?auto_488419 ?auto_488425 ) ( CLEAR ?auto_488419 ) ( IS-CRATE ?auto_488420 ) ( not ( = ?auto_488419 ?auto_488420 ) ) ( AVAILABLE ?auto_488426 ) ( ON ?auto_488419 ?auto_488418 ) ( not ( = ?auto_488418 ?auto_488419 ) ) ( not ( = ?auto_488418 ?auto_488420 ) ) ( not ( = ?auto_488423 ?auto_488425 ) ) ( HOIST-AT ?auto_488422 ?auto_488423 ) ( not ( = ?auto_488426 ?auto_488422 ) ) ( AVAILABLE ?auto_488422 ) ( SURFACE-AT ?auto_488420 ?auto_488423 ) ( ON ?auto_488420 ?auto_488424 ) ( CLEAR ?auto_488420 ) ( not ( = ?auto_488419 ?auto_488424 ) ) ( not ( = ?auto_488420 ?auto_488424 ) ) ( not ( = ?auto_488418 ?auto_488424 ) ) ( TRUCK-AT ?auto_488421 ?auto_488425 ) ( ON ?auto_488413 ?auto_488412 ) ( ON ?auto_488414 ?auto_488413 ) ( ON ?auto_488415 ?auto_488414 ) ( ON ?auto_488416 ?auto_488415 ) ( ON ?auto_488417 ?auto_488416 ) ( ON ?auto_488418 ?auto_488417 ) ( not ( = ?auto_488412 ?auto_488413 ) ) ( not ( = ?auto_488412 ?auto_488414 ) ) ( not ( = ?auto_488412 ?auto_488415 ) ) ( not ( = ?auto_488412 ?auto_488416 ) ) ( not ( = ?auto_488412 ?auto_488417 ) ) ( not ( = ?auto_488412 ?auto_488418 ) ) ( not ( = ?auto_488412 ?auto_488419 ) ) ( not ( = ?auto_488412 ?auto_488420 ) ) ( not ( = ?auto_488412 ?auto_488424 ) ) ( not ( = ?auto_488413 ?auto_488414 ) ) ( not ( = ?auto_488413 ?auto_488415 ) ) ( not ( = ?auto_488413 ?auto_488416 ) ) ( not ( = ?auto_488413 ?auto_488417 ) ) ( not ( = ?auto_488413 ?auto_488418 ) ) ( not ( = ?auto_488413 ?auto_488419 ) ) ( not ( = ?auto_488413 ?auto_488420 ) ) ( not ( = ?auto_488413 ?auto_488424 ) ) ( not ( = ?auto_488414 ?auto_488415 ) ) ( not ( = ?auto_488414 ?auto_488416 ) ) ( not ( = ?auto_488414 ?auto_488417 ) ) ( not ( = ?auto_488414 ?auto_488418 ) ) ( not ( = ?auto_488414 ?auto_488419 ) ) ( not ( = ?auto_488414 ?auto_488420 ) ) ( not ( = ?auto_488414 ?auto_488424 ) ) ( not ( = ?auto_488415 ?auto_488416 ) ) ( not ( = ?auto_488415 ?auto_488417 ) ) ( not ( = ?auto_488415 ?auto_488418 ) ) ( not ( = ?auto_488415 ?auto_488419 ) ) ( not ( = ?auto_488415 ?auto_488420 ) ) ( not ( = ?auto_488415 ?auto_488424 ) ) ( not ( = ?auto_488416 ?auto_488417 ) ) ( not ( = ?auto_488416 ?auto_488418 ) ) ( not ( = ?auto_488416 ?auto_488419 ) ) ( not ( = ?auto_488416 ?auto_488420 ) ) ( not ( = ?auto_488416 ?auto_488424 ) ) ( not ( = ?auto_488417 ?auto_488418 ) ) ( not ( = ?auto_488417 ?auto_488419 ) ) ( not ( = ?auto_488417 ?auto_488420 ) ) ( not ( = ?auto_488417 ?auto_488424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488418 ?auto_488419 ?auto_488420 )
      ( MAKE-8CRATE-VERIFY ?auto_488412 ?auto_488413 ?auto_488414 ?auto_488415 ?auto_488416 ?auto_488417 ?auto_488418 ?auto_488419 ?auto_488420 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488505 - SURFACE
      ?auto_488506 - SURFACE
      ?auto_488507 - SURFACE
      ?auto_488508 - SURFACE
      ?auto_488509 - SURFACE
      ?auto_488510 - SURFACE
      ?auto_488511 - SURFACE
      ?auto_488512 - SURFACE
      ?auto_488513 - SURFACE
    )
    :vars
    (
      ?auto_488519 - HOIST
      ?auto_488516 - PLACE
      ?auto_488518 - PLACE
      ?auto_488517 - HOIST
      ?auto_488514 - SURFACE
      ?auto_488515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488519 ?auto_488516 ) ( IS-CRATE ?auto_488513 ) ( not ( = ?auto_488512 ?auto_488513 ) ) ( not ( = ?auto_488511 ?auto_488512 ) ) ( not ( = ?auto_488511 ?auto_488513 ) ) ( not ( = ?auto_488518 ?auto_488516 ) ) ( HOIST-AT ?auto_488517 ?auto_488518 ) ( not ( = ?auto_488519 ?auto_488517 ) ) ( AVAILABLE ?auto_488517 ) ( SURFACE-AT ?auto_488513 ?auto_488518 ) ( ON ?auto_488513 ?auto_488514 ) ( CLEAR ?auto_488513 ) ( not ( = ?auto_488512 ?auto_488514 ) ) ( not ( = ?auto_488513 ?auto_488514 ) ) ( not ( = ?auto_488511 ?auto_488514 ) ) ( TRUCK-AT ?auto_488515 ?auto_488516 ) ( SURFACE-AT ?auto_488511 ?auto_488516 ) ( CLEAR ?auto_488511 ) ( LIFTING ?auto_488519 ?auto_488512 ) ( IS-CRATE ?auto_488512 ) ( ON ?auto_488506 ?auto_488505 ) ( ON ?auto_488507 ?auto_488506 ) ( ON ?auto_488508 ?auto_488507 ) ( ON ?auto_488509 ?auto_488508 ) ( ON ?auto_488510 ?auto_488509 ) ( ON ?auto_488511 ?auto_488510 ) ( not ( = ?auto_488505 ?auto_488506 ) ) ( not ( = ?auto_488505 ?auto_488507 ) ) ( not ( = ?auto_488505 ?auto_488508 ) ) ( not ( = ?auto_488505 ?auto_488509 ) ) ( not ( = ?auto_488505 ?auto_488510 ) ) ( not ( = ?auto_488505 ?auto_488511 ) ) ( not ( = ?auto_488505 ?auto_488512 ) ) ( not ( = ?auto_488505 ?auto_488513 ) ) ( not ( = ?auto_488505 ?auto_488514 ) ) ( not ( = ?auto_488506 ?auto_488507 ) ) ( not ( = ?auto_488506 ?auto_488508 ) ) ( not ( = ?auto_488506 ?auto_488509 ) ) ( not ( = ?auto_488506 ?auto_488510 ) ) ( not ( = ?auto_488506 ?auto_488511 ) ) ( not ( = ?auto_488506 ?auto_488512 ) ) ( not ( = ?auto_488506 ?auto_488513 ) ) ( not ( = ?auto_488506 ?auto_488514 ) ) ( not ( = ?auto_488507 ?auto_488508 ) ) ( not ( = ?auto_488507 ?auto_488509 ) ) ( not ( = ?auto_488507 ?auto_488510 ) ) ( not ( = ?auto_488507 ?auto_488511 ) ) ( not ( = ?auto_488507 ?auto_488512 ) ) ( not ( = ?auto_488507 ?auto_488513 ) ) ( not ( = ?auto_488507 ?auto_488514 ) ) ( not ( = ?auto_488508 ?auto_488509 ) ) ( not ( = ?auto_488508 ?auto_488510 ) ) ( not ( = ?auto_488508 ?auto_488511 ) ) ( not ( = ?auto_488508 ?auto_488512 ) ) ( not ( = ?auto_488508 ?auto_488513 ) ) ( not ( = ?auto_488508 ?auto_488514 ) ) ( not ( = ?auto_488509 ?auto_488510 ) ) ( not ( = ?auto_488509 ?auto_488511 ) ) ( not ( = ?auto_488509 ?auto_488512 ) ) ( not ( = ?auto_488509 ?auto_488513 ) ) ( not ( = ?auto_488509 ?auto_488514 ) ) ( not ( = ?auto_488510 ?auto_488511 ) ) ( not ( = ?auto_488510 ?auto_488512 ) ) ( not ( = ?auto_488510 ?auto_488513 ) ) ( not ( = ?auto_488510 ?auto_488514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488511 ?auto_488512 ?auto_488513 )
      ( MAKE-8CRATE-VERIFY ?auto_488505 ?auto_488506 ?auto_488507 ?auto_488508 ?auto_488509 ?auto_488510 ?auto_488511 ?auto_488512 ?auto_488513 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488598 - SURFACE
      ?auto_488599 - SURFACE
      ?auto_488600 - SURFACE
      ?auto_488601 - SURFACE
      ?auto_488602 - SURFACE
      ?auto_488603 - SURFACE
      ?auto_488604 - SURFACE
      ?auto_488605 - SURFACE
      ?auto_488606 - SURFACE
    )
    :vars
    (
      ?auto_488608 - HOIST
      ?auto_488611 - PLACE
      ?auto_488607 - PLACE
      ?auto_488609 - HOIST
      ?auto_488610 - SURFACE
      ?auto_488612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488608 ?auto_488611 ) ( IS-CRATE ?auto_488606 ) ( not ( = ?auto_488605 ?auto_488606 ) ) ( not ( = ?auto_488604 ?auto_488605 ) ) ( not ( = ?auto_488604 ?auto_488606 ) ) ( not ( = ?auto_488607 ?auto_488611 ) ) ( HOIST-AT ?auto_488609 ?auto_488607 ) ( not ( = ?auto_488608 ?auto_488609 ) ) ( AVAILABLE ?auto_488609 ) ( SURFACE-AT ?auto_488606 ?auto_488607 ) ( ON ?auto_488606 ?auto_488610 ) ( CLEAR ?auto_488606 ) ( not ( = ?auto_488605 ?auto_488610 ) ) ( not ( = ?auto_488606 ?auto_488610 ) ) ( not ( = ?auto_488604 ?auto_488610 ) ) ( TRUCK-AT ?auto_488612 ?auto_488611 ) ( SURFACE-AT ?auto_488604 ?auto_488611 ) ( CLEAR ?auto_488604 ) ( IS-CRATE ?auto_488605 ) ( AVAILABLE ?auto_488608 ) ( IN ?auto_488605 ?auto_488612 ) ( ON ?auto_488599 ?auto_488598 ) ( ON ?auto_488600 ?auto_488599 ) ( ON ?auto_488601 ?auto_488600 ) ( ON ?auto_488602 ?auto_488601 ) ( ON ?auto_488603 ?auto_488602 ) ( ON ?auto_488604 ?auto_488603 ) ( not ( = ?auto_488598 ?auto_488599 ) ) ( not ( = ?auto_488598 ?auto_488600 ) ) ( not ( = ?auto_488598 ?auto_488601 ) ) ( not ( = ?auto_488598 ?auto_488602 ) ) ( not ( = ?auto_488598 ?auto_488603 ) ) ( not ( = ?auto_488598 ?auto_488604 ) ) ( not ( = ?auto_488598 ?auto_488605 ) ) ( not ( = ?auto_488598 ?auto_488606 ) ) ( not ( = ?auto_488598 ?auto_488610 ) ) ( not ( = ?auto_488599 ?auto_488600 ) ) ( not ( = ?auto_488599 ?auto_488601 ) ) ( not ( = ?auto_488599 ?auto_488602 ) ) ( not ( = ?auto_488599 ?auto_488603 ) ) ( not ( = ?auto_488599 ?auto_488604 ) ) ( not ( = ?auto_488599 ?auto_488605 ) ) ( not ( = ?auto_488599 ?auto_488606 ) ) ( not ( = ?auto_488599 ?auto_488610 ) ) ( not ( = ?auto_488600 ?auto_488601 ) ) ( not ( = ?auto_488600 ?auto_488602 ) ) ( not ( = ?auto_488600 ?auto_488603 ) ) ( not ( = ?auto_488600 ?auto_488604 ) ) ( not ( = ?auto_488600 ?auto_488605 ) ) ( not ( = ?auto_488600 ?auto_488606 ) ) ( not ( = ?auto_488600 ?auto_488610 ) ) ( not ( = ?auto_488601 ?auto_488602 ) ) ( not ( = ?auto_488601 ?auto_488603 ) ) ( not ( = ?auto_488601 ?auto_488604 ) ) ( not ( = ?auto_488601 ?auto_488605 ) ) ( not ( = ?auto_488601 ?auto_488606 ) ) ( not ( = ?auto_488601 ?auto_488610 ) ) ( not ( = ?auto_488602 ?auto_488603 ) ) ( not ( = ?auto_488602 ?auto_488604 ) ) ( not ( = ?auto_488602 ?auto_488605 ) ) ( not ( = ?auto_488602 ?auto_488606 ) ) ( not ( = ?auto_488602 ?auto_488610 ) ) ( not ( = ?auto_488603 ?auto_488604 ) ) ( not ( = ?auto_488603 ?auto_488605 ) ) ( not ( = ?auto_488603 ?auto_488606 ) ) ( not ( = ?auto_488603 ?auto_488610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488604 ?auto_488605 ?auto_488606 )
      ( MAKE-8CRATE-VERIFY ?auto_488598 ?auto_488599 ?auto_488600 ?auto_488601 ?auto_488602 ?auto_488603 ?auto_488604 ?auto_488605 ?auto_488606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_491093 - SURFACE
      ?auto_491094 - SURFACE
    )
    :vars
    (
      ?auto_491098 - HOIST
      ?auto_491097 - PLACE
      ?auto_491101 - SURFACE
      ?auto_491099 - PLACE
      ?auto_491096 - HOIST
      ?auto_491095 - SURFACE
      ?auto_491100 - TRUCK
      ?auto_491102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_491098 ?auto_491097 ) ( SURFACE-AT ?auto_491093 ?auto_491097 ) ( CLEAR ?auto_491093 ) ( IS-CRATE ?auto_491094 ) ( not ( = ?auto_491093 ?auto_491094 ) ) ( ON ?auto_491093 ?auto_491101 ) ( not ( = ?auto_491101 ?auto_491093 ) ) ( not ( = ?auto_491101 ?auto_491094 ) ) ( not ( = ?auto_491099 ?auto_491097 ) ) ( HOIST-AT ?auto_491096 ?auto_491099 ) ( not ( = ?auto_491098 ?auto_491096 ) ) ( AVAILABLE ?auto_491096 ) ( SURFACE-AT ?auto_491094 ?auto_491099 ) ( ON ?auto_491094 ?auto_491095 ) ( CLEAR ?auto_491094 ) ( not ( = ?auto_491093 ?auto_491095 ) ) ( not ( = ?auto_491094 ?auto_491095 ) ) ( not ( = ?auto_491101 ?auto_491095 ) ) ( TRUCK-AT ?auto_491100 ?auto_491097 ) ( LIFTING ?auto_491098 ?auto_491102 ) ( IS-CRATE ?auto_491102 ) ( not ( = ?auto_491093 ?auto_491102 ) ) ( not ( = ?auto_491094 ?auto_491102 ) ) ( not ( = ?auto_491101 ?auto_491102 ) ) ( not ( = ?auto_491095 ?auto_491102 ) ) )
    :subtasks
    ( ( !LOAD ?auto_491098 ?auto_491102 ?auto_491100 ?auto_491097 )
      ( MAKE-1CRATE ?auto_491093 ?auto_491094 )
      ( MAKE-1CRATE-VERIFY ?auto_491093 ?auto_491094 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492687 - SURFACE
      ?auto_492688 - SURFACE
      ?auto_492689 - SURFACE
      ?auto_492690 - SURFACE
      ?auto_492691 - SURFACE
      ?auto_492692 - SURFACE
      ?auto_492693 - SURFACE
      ?auto_492694 - SURFACE
      ?auto_492695 - SURFACE
      ?auto_492696 - SURFACE
    )
    :vars
    (
      ?auto_492697 - HOIST
      ?auto_492698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_492697 ?auto_492698 ) ( SURFACE-AT ?auto_492695 ?auto_492698 ) ( CLEAR ?auto_492695 ) ( LIFTING ?auto_492697 ?auto_492696 ) ( IS-CRATE ?auto_492696 ) ( not ( = ?auto_492695 ?auto_492696 ) ) ( ON ?auto_492688 ?auto_492687 ) ( ON ?auto_492689 ?auto_492688 ) ( ON ?auto_492690 ?auto_492689 ) ( ON ?auto_492691 ?auto_492690 ) ( ON ?auto_492692 ?auto_492691 ) ( ON ?auto_492693 ?auto_492692 ) ( ON ?auto_492694 ?auto_492693 ) ( ON ?auto_492695 ?auto_492694 ) ( not ( = ?auto_492687 ?auto_492688 ) ) ( not ( = ?auto_492687 ?auto_492689 ) ) ( not ( = ?auto_492687 ?auto_492690 ) ) ( not ( = ?auto_492687 ?auto_492691 ) ) ( not ( = ?auto_492687 ?auto_492692 ) ) ( not ( = ?auto_492687 ?auto_492693 ) ) ( not ( = ?auto_492687 ?auto_492694 ) ) ( not ( = ?auto_492687 ?auto_492695 ) ) ( not ( = ?auto_492687 ?auto_492696 ) ) ( not ( = ?auto_492688 ?auto_492689 ) ) ( not ( = ?auto_492688 ?auto_492690 ) ) ( not ( = ?auto_492688 ?auto_492691 ) ) ( not ( = ?auto_492688 ?auto_492692 ) ) ( not ( = ?auto_492688 ?auto_492693 ) ) ( not ( = ?auto_492688 ?auto_492694 ) ) ( not ( = ?auto_492688 ?auto_492695 ) ) ( not ( = ?auto_492688 ?auto_492696 ) ) ( not ( = ?auto_492689 ?auto_492690 ) ) ( not ( = ?auto_492689 ?auto_492691 ) ) ( not ( = ?auto_492689 ?auto_492692 ) ) ( not ( = ?auto_492689 ?auto_492693 ) ) ( not ( = ?auto_492689 ?auto_492694 ) ) ( not ( = ?auto_492689 ?auto_492695 ) ) ( not ( = ?auto_492689 ?auto_492696 ) ) ( not ( = ?auto_492690 ?auto_492691 ) ) ( not ( = ?auto_492690 ?auto_492692 ) ) ( not ( = ?auto_492690 ?auto_492693 ) ) ( not ( = ?auto_492690 ?auto_492694 ) ) ( not ( = ?auto_492690 ?auto_492695 ) ) ( not ( = ?auto_492690 ?auto_492696 ) ) ( not ( = ?auto_492691 ?auto_492692 ) ) ( not ( = ?auto_492691 ?auto_492693 ) ) ( not ( = ?auto_492691 ?auto_492694 ) ) ( not ( = ?auto_492691 ?auto_492695 ) ) ( not ( = ?auto_492691 ?auto_492696 ) ) ( not ( = ?auto_492692 ?auto_492693 ) ) ( not ( = ?auto_492692 ?auto_492694 ) ) ( not ( = ?auto_492692 ?auto_492695 ) ) ( not ( = ?auto_492692 ?auto_492696 ) ) ( not ( = ?auto_492693 ?auto_492694 ) ) ( not ( = ?auto_492693 ?auto_492695 ) ) ( not ( = ?auto_492693 ?auto_492696 ) ) ( not ( = ?auto_492694 ?auto_492695 ) ) ( not ( = ?auto_492694 ?auto_492696 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_492695 ?auto_492696 )
      ( MAKE-9CRATE-VERIFY ?auto_492687 ?auto_492688 ?auto_492689 ?auto_492690 ?auto_492691 ?auto_492692 ?auto_492693 ?auto_492694 ?auto_492695 ?auto_492696 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492767 - SURFACE
      ?auto_492768 - SURFACE
      ?auto_492769 - SURFACE
      ?auto_492770 - SURFACE
      ?auto_492771 - SURFACE
      ?auto_492772 - SURFACE
      ?auto_492773 - SURFACE
      ?auto_492774 - SURFACE
      ?auto_492775 - SURFACE
      ?auto_492776 - SURFACE
    )
    :vars
    (
      ?auto_492779 - HOIST
      ?auto_492777 - PLACE
      ?auto_492778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492779 ?auto_492777 ) ( SURFACE-AT ?auto_492775 ?auto_492777 ) ( CLEAR ?auto_492775 ) ( IS-CRATE ?auto_492776 ) ( not ( = ?auto_492775 ?auto_492776 ) ) ( TRUCK-AT ?auto_492778 ?auto_492777 ) ( AVAILABLE ?auto_492779 ) ( IN ?auto_492776 ?auto_492778 ) ( ON ?auto_492775 ?auto_492774 ) ( not ( = ?auto_492774 ?auto_492775 ) ) ( not ( = ?auto_492774 ?auto_492776 ) ) ( ON ?auto_492768 ?auto_492767 ) ( ON ?auto_492769 ?auto_492768 ) ( ON ?auto_492770 ?auto_492769 ) ( ON ?auto_492771 ?auto_492770 ) ( ON ?auto_492772 ?auto_492771 ) ( ON ?auto_492773 ?auto_492772 ) ( ON ?auto_492774 ?auto_492773 ) ( not ( = ?auto_492767 ?auto_492768 ) ) ( not ( = ?auto_492767 ?auto_492769 ) ) ( not ( = ?auto_492767 ?auto_492770 ) ) ( not ( = ?auto_492767 ?auto_492771 ) ) ( not ( = ?auto_492767 ?auto_492772 ) ) ( not ( = ?auto_492767 ?auto_492773 ) ) ( not ( = ?auto_492767 ?auto_492774 ) ) ( not ( = ?auto_492767 ?auto_492775 ) ) ( not ( = ?auto_492767 ?auto_492776 ) ) ( not ( = ?auto_492768 ?auto_492769 ) ) ( not ( = ?auto_492768 ?auto_492770 ) ) ( not ( = ?auto_492768 ?auto_492771 ) ) ( not ( = ?auto_492768 ?auto_492772 ) ) ( not ( = ?auto_492768 ?auto_492773 ) ) ( not ( = ?auto_492768 ?auto_492774 ) ) ( not ( = ?auto_492768 ?auto_492775 ) ) ( not ( = ?auto_492768 ?auto_492776 ) ) ( not ( = ?auto_492769 ?auto_492770 ) ) ( not ( = ?auto_492769 ?auto_492771 ) ) ( not ( = ?auto_492769 ?auto_492772 ) ) ( not ( = ?auto_492769 ?auto_492773 ) ) ( not ( = ?auto_492769 ?auto_492774 ) ) ( not ( = ?auto_492769 ?auto_492775 ) ) ( not ( = ?auto_492769 ?auto_492776 ) ) ( not ( = ?auto_492770 ?auto_492771 ) ) ( not ( = ?auto_492770 ?auto_492772 ) ) ( not ( = ?auto_492770 ?auto_492773 ) ) ( not ( = ?auto_492770 ?auto_492774 ) ) ( not ( = ?auto_492770 ?auto_492775 ) ) ( not ( = ?auto_492770 ?auto_492776 ) ) ( not ( = ?auto_492771 ?auto_492772 ) ) ( not ( = ?auto_492771 ?auto_492773 ) ) ( not ( = ?auto_492771 ?auto_492774 ) ) ( not ( = ?auto_492771 ?auto_492775 ) ) ( not ( = ?auto_492771 ?auto_492776 ) ) ( not ( = ?auto_492772 ?auto_492773 ) ) ( not ( = ?auto_492772 ?auto_492774 ) ) ( not ( = ?auto_492772 ?auto_492775 ) ) ( not ( = ?auto_492772 ?auto_492776 ) ) ( not ( = ?auto_492773 ?auto_492774 ) ) ( not ( = ?auto_492773 ?auto_492775 ) ) ( not ( = ?auto_492773 ?auto_492776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492774 ?auto_492775 ?auto_492776 )
      ( MAKE-9CRATE-VERIFY ?auto_492767 ?auto_492768 ?auto_492769 ?auto_492770 ?auto_492771 ?auto_492772 ?auto_492773 ?auto_492774 ?auto_492775 ?auto_492776 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492857 - SURFACE
      ?auto_492858 - SURFACE
      ?auto_492859 - SURFACE
      ?auto_492860 - SURFACE
      ?auto_492861 - SURFACE
      ?auto_492862 - SURFACE
      ?auto_492863 - SURFACE
      ?auto_492864 - SURFACE
      ?auto_492865 - SURFACE
      ?auto_492866 - SURFACE
    )
    :vars
    (
      ?auto_492867 - HOIST
      ?auto_492870 - PLACE
      ?auto_492869 - TRUCK
      ?auto_492868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_492867 ?auto_492870 ) ( SURFACE-AT ?auto_492865 ?auto_492870 ) ( CLEAR ?auto_492865 ) ( IS-CRATE ?auto_492866 ) ( not ( = ?auto_492865 ?auto_492866 ) ) ( AVAILABLE ?auto_492867 ) ( IN ?auto_492866 ?auto_492869 ) ( ON ?auto_492865 ?auto_492864 ) ( not ( = ?auto_492864 ?auto_492865 ) ) ( not ( = ?auto_492864 ?auto_492866 ) ) ( TRUCK-AT ?auto_492869 ?auto_492868 ) ( not ( = ?auto_492868 ?auto_492870 ) ) ( ON ?auto_492858 ?auto_492857 ) ( ON ?auto_492859 ?auto_492858 ) ( ON ?auto_492860 ?auto_492859 ) ( ON ?auto_492861 ?auto_492860 ) ( ON ?auto_492862 ?auto_492861 ) ( ON ?auto_492863 ?auto_492862 ) ( ON ?auto_492864 ?auto_492863 ) ( not ( = ?auto_492857 ?auto_492858 ) ) ( not ( = ?auto_492857 ?auto_492859 ) ) ( not ( = ?auto_492857 ?auto_492860 ) ) ( not ( = ?auto_492857 ?auto_492861 ) ) ( not ( = ?auto_492857 ?auto_492862 ) ) ( not ( = ?auto_492857 ?auto_492863 ) ) ( not ( = ?auto_492857 ?auto_492864 ) ) ( not ( = ?auto_492857 ?auto_492865 ) ) ( not ( = ?auto_492857 ?auto_492866 ) ) ( not ( = ?auto_492858 ?auto_492859 ) ) ( not ( = ?auto_492858 ?auto_492860 ) ) ( not ( = ?auto_492858 ?auto_492861 ) ) ( not ( = ?auto_492858 ?auto_492862 ) ) ( not ( = ?auto_492858 ?auto_492863 ) ) ( not ( = ?auto_492858 ?auto_492864 ) ) ( not ( = ?auto_492858 ?auto_492865 ) ) ( not ( = ?auto_492858 ?auto_492866 ) ) ( not ( = ?auto_492859 ?auto_492860 ) ) ( not ( = ?auto_492859 ?auto_492861 ) ) ( not ( = ?auto_492859 ?auto_492862 ) ) ( not ( = ?auto_492859 ?auto_492863 ) ) ( not ( = ?auto_492859 ?auto_492864 ) ) ( not ( = ?auto_492859 ?auto_492865 ) ) ( not ( = ?auto_492859 ?auto_492866 ) ) ( not ( = ?auto_492860 ?auto_492861 ) ) ( not ( = ?auto_492860 ?auto_492862 ) ) ( not ( = ?auto_492860 ?auto_492863 ) ) ( not ( = ?auto_492860 ?auto_492864 ) ) ( not ( = ?auto_492860 ?auto_492865 ) ) ( not ( = ?auto_492860 ?auto_492866 ) ) ( not ( = ?auto_492861 ?auto_492862 ) ) ( not ( = ?auto_492861 ?auto_492863 ) ) ( not ( = ?auto_492861 ?auto_492864 ) ) ( not ( = ?auto_492861 ?auto_492865 ) ) ( not ( = ?auto_492861 ?auto_492866 ) ) ( not ( = ?auto_492862 ?auto_492863 ) ) ( not ( = ?auto_492862 ?auto_492864 ) ) ( not ( = ?auto_492862 ?auto_492865 ) ) ( not ( = ?auto_492862 ?auto_492866 ) ) ( not ( = ?auto_492863 ?auto_492864 ) ) ( not ( = ?auto_492863 ?auto_492865 ) ) ( not ( = ?auto_492863 ?auto_492866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492864 ?auto_492865 ?auto_492866 )
      ( MAKE-9CRATE-VERIFY ?auto_492857 ?auto_492858 ?auto_492859 ?auto_492860 ?auto_492861 ?auto_492862 ?auto_492863 ?auto_492864 ?auto_492865 ?auto_492866 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492956 - SURFACE
      ?auto_492957 - SURFACE
      ?auto_492958 - SURFACE
      ?auto_492959 - SURFACE
      ?auto_492960 - SURFACE
      ?auto_492961 - SURFACE
      ?auto_492962 - SURFACE
      ?auto_492963 - SURFACE
      ?auto_492964 - SURFACE
      ?auto_492965 - SURFACE
    )
    :vars
    (
      ?auto_492966 - HOIST
      ?auto_492967 - PLACE
      ?auto_492969 - TRUCK
      ?auto_492970 - PLACE
      ?auto_492968 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_492966 ?auto_492967 ) ( SURFACE-AT ?auto_492964 ?auto_492967 ) ( CLEAR ?auto_492964 ) ( IS-CRATE ?auto_492965 ) ( not ( = ?auto_492964 ?auto_492965 ) ) ( AVAILABLE ?auto_492966 ) ( ON ?auto_492964 ?auto_492963 ) ( not ( = ?auto_492963 ?auto_492964 ) ) ( not ( = ?auto_492963 ?auto_492965 ) ) ( TRUCK-AT ?auto_492969 ?auto_492970 ) ( not ( = ?auto_492970 ?auto_492967 ) ) ( HOIST-AT ?auto_492968 ?auto_492970 ) ( LIFTING ?auto_492968 ?auto_492965 ) ( not ( = ?auto_492966 ?auto_492968 ) ) ( ON ?auto_492957 ?auto_492956 ) ( ON ?auto_492958 ?auto_492957 ) ( ON ?auto_492959 ?auto_492958 ) ( ON ?auto_492960 ?auto_492959 ) ( ON ?auto_492961 ?auto_492960 ) ( ON ?auto_492962 ?auto_492961 ) ( ON ?auto_492963 ?auto_492962 ) ( not ( = ?auto_492956 ?auto_492957 ) ) ( not ( = ?auto_492956 ?auto_492958 ) ) ( not ( = ?auto_492956 ?auto_492959 ) ) ( not ( = ?auto_492956 ?auto_492960 ) ) ( not ( = ?auto_492956 ?auto_492961 ) ) ( not ( = ?auto_492956 ?auto_492962 ) ) ( not ( = ?auto_492956 ?auto_492963 ) ) ( not ( = ?auto_492956 ?auto_492964 ) ) ( not ( = ?auto_492956 ?auto_492965 ) ) ( not ( = ?auto_492957 ?auto_492958 ) ) ( not ( = ?auto_492957 ?auto_492959 ) ) ( not ( = ?auto_492957 ?auto_492960 ) ) ( not ( = ?auto_492957 ?auto_492961 ) ) ( not ( = ?auto_492957 ?auto_492962 ) ) ( not ( = ?auto_492957 ?auto_492963 ) ) ( not ( = ?auto_492957 ?auto_492964 ) ) ( not ( = ?auto_492957 ?auto_492965 ) ) ( not ( = ?auto_492958 ?auto_492959 ) ) ( not ( = ?auto_492958 ?auto_492960 ) ) ( not ( = ?auto_492958 ?auto_492961 ) ) ( not ( = ?auto_492958 ?auto_492962 ) ) ( not ( = ?auto_492958 ?auto_492963 ) ) ( not ( = ?auto_492958 ?auto_492964 ) ) ( not ( = ?auto_492958 ?auto_492965 ) ) ( not ( = ?auto_492959 ?auto_492960 ) ) ( not ( = ?auto_492959 ?auto_492961 ) ) ( not ( = ?auto_492959 ?auto_492962 ) ) ( not ( = ?auto_492959 ?auto_492963 ) ) ( not ( = ?auto_492959 ?auto_492964 ) ) ( not ( = ?auto_492959 ?auto_492965 ) ) ( not ( = ?auto_492960 ?auto_492961 ) ) ( not ( = ?auto_492960 ?auto_492962 ) ) ( not ( = ?auto_492960 ?auto_492963 ) ) ( not ( = ?auto_492960 ?auto_492964 ) ) ( not ( = ?auto_492960 ?auto_492965 ) ) ( not ( = ?auto_492961 ?auto_492962 ) ) ( not ( = ?auto_492961 ?auto_492963 ) ) ( not ( = ?auto_492961 ?auto_492964 ) ) ( not ( = ?auto_492961 ?auto_492965 ) ) ( not ( = ?auto_492962 ?auto_492963 ) ) ( not ( = ?auto_492962 ?auto_492964 ) ) ( not ( = ?auto_492962 ?auto_492965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492963 ?auto_492964 ?auto_492965 )
      ( MAKE-9CRATE-VERIFY ?auto_492956 ?auto_492957 ?auto_492958 ?auto_492959 ?auto_492960 ?auto_492961 ?auto_492962 ?auto_492963 ?auto_492964 ?auto_492965 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493064 - SURFACE
      ?auto_493065 - SURFACE
      ?auto_493066 - SURFACE
      ?auto_493067 - SURFACE
      ?auto_493068 - SURFACE
      ?auto_493069 - SURFACE
      ?auto_493070 - SURFACE
      ?auto_493071 - SURFACE
      ?auto_493072 - SURFACE
      ?auto_493073 - SURFACE
    )
    :vars
    (
      ?auto_493077 - HOIST
      ?auto_493075 - PLACE
      ?auto_493078 - TRUCK
      ?auto_493074 - PLACE
      ?auto_493079 - HOIST
      ?auto_493076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_493077 ?auto_493075 ) ( SURFACE-AT ?auto_493072 ?auto_493075 ) ( CLEAR ?auto_493072 ) ( IS-CRATE ?auto_493073 ) ( not ( = ?auto_493072 ?auto_493073 ) ) ( AVAILABLE ?auto_493077 ) ( ON ?auto_493072 ?auto_493071 ) ( not ( = ?auto_493071 ?auto_493072 ) ) ( not ( = ?auto_493071 ?auto_493073 ) ) ( TRUCK-AT ?auto_493078 ?auto_493074 ) ( not ( = ?auto_493074 ?auto_493075 ) ) ( HOIST-AT ?auto_493079 ?auto_493074 ) ( not ( = ?auto_493077 ?auto_493079 ) ) ( AVAILABLE ?auto_493079 ) ( SURFACE-AT ?auto_493073 ?auto_493074 ) ( ON ?auto_493073 ?auto_493076 ) ( CLEAR ?auto_493073 ) ( not ( = ?auto_493072 ?auto_493076 ) ) ( not ( = ?auto_493073 ?auto_493076 ) ) ( not ( = ?auto_493071 ?auto_493076 ) ) ( ON ?auto_493065 ?auto_493064 ) ( ON ?auto_493066 ?auto_493065 ) ( ON ?auto_493067 ?auto_493066 ) ( ON ?auto_493068 ?auto_493067 ) ( ON ?auto_493069 ?auto_493068 ) ( ON ?auto_493070 ?auto_493069 ) ( ON ?auto_493071 ?auto_493070 ) ( not ( = ?auto_493064 ?auto_493065 ) ) ( not ( = ?auto_493064 ?auto_493066 ) ) ( not ( = ?auto_493064 ?auto_493067 ) ) ( not ( = ?auto_493064 ?auto_493068 ) ) ( not ( = ?auto_493064 ?auto_493069 ) ) ( not ( = ?auto_493064 ?auto_493070 ) ) ( not ( = ?auto_493064 ?auto_493071 ) ) ( not ( = ?auto_493064 ?auto_493072 ) ) ( not ( = ?auto_493064 ?auto_493073 ) ) ( not ( = ?auto_493064 ?auto_493076 ) ) ( not ( = ?auto_493065 ?auto_493066 ) ) ( not ( = ?auto_493065 ?auto_493067 ) ) ( not ( = ?auto_493065 ?auto_493068 ) ) ( not ( = ?auto_493065 ?auto_493069 ) ) ( not ( = ?auto_493065 ?auto_493070 ) ) ( not ( = ?auto_493065 ?auto_493071 ) ) ( not ( = ?auto_493065 ?auto_493072 ) ) ( not ( = ?auto_493065 ?auto_493073 ) ) ( not ( = ?auto_493065 ?auto_493076 ) ) ( not ( = ?auto_493066 ?auto_493067 ) ) ( not ( = ?auto_493066 ?auto_493068 ) ) ( not ( = ?auto_493066 ?auto_493069 ) ) ( not ( = ?auto_493066 ?auto_493070 ) ) ( not ( = ?auto_493066 ?auto_493071 ) ) ( not ( = ?auto_493066 ?auto_493072 ) ) ( not ( = ?auto_493066 ?auto_493073 ) ) ( not ( = ?auto_493066 ?auto_493076 ) ) ( not ( = ?auto_493067 ?auto_493068 ) ) ( not ( = ?auto_493067 ?auto_493069 ) ) ( not ( = ?auto_493067 ?auto_493070 ) ) ( not ( = ?auto_493067 ?auto_493071 ) ) ( not ( = ?auto_493067 ?auto_493072 ) ) ( not ( = ?auto_493067 ?auto_493073 ) ) ( not ( = ?auto_493067 ?auto_493076 ) ) ( not ( = ?auto_493068 ?auto_493069 ) ) ( not ( = ?auto_493068 ?auto_493070 ) ) ( not ( = ?auto_493068 ?auto_493071 ) ) ( not ( = ?auto_493068 ?auto_493072 ) ) ( not ( = ?auto_493068 ?auto_493073 ) ) ( not ( = ?auto_493068 ?auto_493076 ) ) ( not ( = ?auto_493069 ?auto_493070 ) ) ( not ( = ?auto_493069 ?auto_493071 ) ) ( not ( = ?auto_493069 ?auto_493072 ) ) ( not ( = ?auto_493069 ?auto_493073 ) ) ( not ( = ?auto_493069 ?auto_493076 ) ) ( not ( = ?auto_493070 ?auto_493071 ) ) ( not ( = ?auto_493070 ?auto_493072 ) ) ( not ( = ?auto_493070 ?auto_493073 ) ) ( not ( = ?auto_493070 ?auto_493076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493071 ?auto_493072 ?auto_493073 )
      ( MAKE-9CRATE-VERIFY ?auto_493064 ?auto_493065 ?auto_493066 ?auto_493067 ?auto_493068 ?auto_493069 ?auto_493070 ?auto_493071 ?auto_493072 ?auto_493073 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493173 - SURFACE
      ?auto_493174 - SURFACE
      ?auto_493175 - SURFACE
      ?auto_493176 - SURFACE
      ?auto_493177 - SURFACE
      ?auto_493178 - SURFACE
      ?auto_493179 - SURFACE
      ?auto_493180 - SURFACE
      ?auto_493181 - SURFACE
      ?auto_493182 - SURFACE
    )
    :vars
    (
      ?auto_493183 - HOIST
      ?auto_493185 - PLACE
      ?auto_493188 - PLACE
      ?auto_493186 - HOIST
      ?auto_493184 - SURFACE
      ?auto_493187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493183 ?auto_493185 ) ( SURFACE-AT ?auto_493181 ?auto_493185 ) ( CLEAR ?auto_493181 ) ( IS-CRATE ?auto_493182 ) ( not ( = ?auto_493181 ?auto_493182 ) ) ( AVAILABLE ?auto_493183 ) ( ON ?auto_493181 ?auto_493180 ) ( not ( = ?auto_493180 ?auto_493181 ) ) ( not ( = ?auto_493180 ?auto_493182 ) ) ( not ( = ?auto_493188 ?auto_493185 ) ) ( HOIST-AT ?auto_493186 ?auto_493188 ) ( not ( = ?auto_493183 ?auto_493186 ) ) ( AVAILABLE ?auto_493186 ) ( SURFACE-AT ?auto_493182 ?auto_493188 ) ( ON ?auto_493182 ?auto_493184 ) ( CLEAR ?auto_493182 ) ( not ( = ?auto_493181 ?auto_493184 ) ) ( not ( = ?auto_493182 ?auto_493184 ) ) ( not ( = ?auto_493180 ?auto_493184 ) ) ( TRUCK-AT ?auto_493187 ?auto_493185 ) ( ON ?auto_493174 ?auto_493173 ) ( ON ?auto_493175 ?auto_493174 ) ( ON ?auto_493176 ?auto_493175 ) ( ON ?auto_493177 ?auto_493176 ) ( ON ?auto_493178 ?auto_493177 ) ( ON ?auto_493179 ?auto_493178 ) ( ON ?auto_493180 ?auto_493179 ) ( not ( = ?auto_493173 ?auto_493174 ) ) ( not ( = ?auto_493173 ?auto_493175 ) ) ( not ( = ?auto_493173 ?auto_493176 ) ) ( not ( = ?auto_493173 ?auto_493177 ) ) ( not ( = ?auto_493173 ?auto_493178 ) ) ( not ( = ?auto_493173 ?auto_493179 ) ) ( not ( = ?auto_493173 ?auto_493180 ) ) ( not ( = ?auto_493173 ?auto_493181 ) ) ( not ( = ?auto_493173 ?auto_493182 ) ) ( not ( = ?auto_493173 ?auto_493184 ) ) ( not ( = ?auto_493174 ?auto_493175 ) ) ( not ( = ?auto_493174 ?auto_493176 ) ) ( not ( = ?auto_493174 ?auto_493177 ) ) ( not ( = ?auto_493174 ?auto_493178 ) ) ( not ( = ?auto_493174 ?auto_493179 ) ) ( not ( = ?auto_493174 ?auto_493180 ) ) ( not ( = ?auto_493174 ?auto_493181 ) ) ( not ( = ?auto_493174 ?auto_493182 ) ) ( not ( = ?auto_493174 ?auto_493184 ) ) ( not ( = ?auto_493175 ?auto_493176 ) ) ( not ( = ?auto_493175 ?auto_493177 ) ) ( not ( = ?auto_493175 ?auto_493178 ) ) ( not ( = ?auto_493175 ?auto_493179 ) ) ( not ( = ?auto_493175 ?auto_493180 ) ) ( not ( = ?auto_493175 ?auto_493181 ) ) ( not ( = ?auto_493175 ?auto_493182 ) ) ( not ( = ?auto_493175 ?auto_493184 ) ) ( not ( = ?auto_493176 ?auto_493177 ) ) ( not ( = ?auto_493176 ?auto_493178 ) ) ( not ( = ?auto_493176 ?auto_493179 ) ) ( not ( = ?auto_493176 ?auto_493180 ) ) ( not ( = ?auto_493176 ?auto_493181 ) ) ( not ( = ?auto_493176 ?auto_493182 ) ) ( not ( = ?auto_493176 ?auto_493184 ) ) ( not ( = ?auto_493177 ?auto_493178 ) ) ( not ( = ?auto_493177 ?auto_493179 ) ) ( not ( = ?auto_493177 ?auto_493180 ) ) ( not ( = ?auto_493177 ?auto_493181 ) ) ( not ( = ?auto_493177 ?auto_493182 ) ) ( not ( = ?auto_493177 ?auto_493184 ) ) ( not ( = ?auto_493178 ?auto_493179 ) ) ( not ( = ?auto_493178 ?auto_493180 ) ) ( not ( = ?auto_493178 ?auto_493181 ) ) ( not ( = ?auto_493178 ?auto_493182 ) ) ( not ( = ?auto_493178 ?auto_493184 ) ) ( not ( = ?auto_493179 ?auto_493180 ) ) ( not ( = ?auto_493179 ?auto_493181 ) ) ( not ( = ?auto_493179 ?auto_493182 ) ) ( not ( = ?auto_493179 ?auto_493184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493180 ?auto_493181 ?auto_493182 )
      ( MAKE-9CRATE-VERIFY ?auto_493173 ?auto_493174 ?auto_493175 ?auto_493176 ?auto_493177 ?auto_493178 ?auto_493179 ?auto_493180 ?auto_493181 ?auto_493182 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493282 - SURFACE
      ?auto_493283 - SURFACE
      ?auto_493284 - SURFACE
      ?auto_493285 - SURFACE
      ?auto_493286 - SURFACE
      ?auto_493287 - SURFACE
      ?auto_493288 - SURFACE
      ?auto_493289 - SURFACE
      ?auto_493290 - SURFACE
      ?auto_493291 - SURFACE
    )
    :vars
    (
      ?auto_493294 - HOIST
      ?auto_493292 - PLACE
      ?auto_493296 - PLACE
      ?auto_493293 - HOIST
      ?auto_493295 - SURFACE
      ?auto_493297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493294 ?auto_493292 ) ( IS-CRATE ?auto_493291 ) ( not ( = ?auto_493290 ?auto_493291 ) ) ( not ( = ?auto_493289 ?auto_493290 ) ) ( not ( = ?auto_493289 ?auto_493291 ) ) ( not ( = ?auto_493296 ?auto_493292 ) ) ( HOIST-AT ?auto_493293 ?auto_493296 ) ( not ( = ?auto_493294 ?auto_493293 ) ) ( AVAILABLE ?auto_493293 ) ( SURFACE-AT ?auto_493291 ?auto_493296 ) ( ON ?auto_493291 ?auto_493295 ) ( CLEAR ?auto_493291 ) ( not ( = ?auto_493290 ?auto_493295 ) ) ( not ( = ?auto_493291 ?auto_493295 ) ) ( not ( = ?auto_493289 ?auto_493295 ) ) ( TRUCK-AT ?auto_493297 ?auto_493292 ) ( SURFACE-AT ?auto_493289 ?auto_493292 ) ( CLEAR ?auto_493289 ) ( LIFTING ?auto_493294 ?auto_493290 ) ( IS-CRATE ?auto_493290 ) ( ON ?auto_493283 ?auto_493282 ) ( ON ?auto_493284 ?auto_493283 ) ( ON ?auto_493285 ?auto_493284 ) ( ON ?auto_493286 ?auto_493285 ) ( ON ?auto_493287 ?auto_493286 ) ( ON ?auto_493288 ?auto_493287 ) ( ON ?auto_493289 ?auto_493288 ) ( not ( = ?auto_493282 ?auto_493283 ) ) ( not ( = ?auto_493282 ?auto_493284 ) ) ( not ( = ?auto_493282 ?auto_493285 ) ) ( not ( = ?auto_493282 ?auto_493286 ) ) ( not ( = ?auto_493282 ?auto_493287 ) ) ( not ( = ?auto_493282 ?auto_493288 ) ) ( not ( = ?auto_493282 ?auto_493289 ) ) ( not ( = ?auto_493282 ?auto_493290 ) ) ( not ( = ?auto_493282 ?auto_493291 ) ) ( not ( = ?auto_493282 ?auto_493295 ) ) ( not ( = ?auto_493283 ?auto_493284 ) ) ( not ( = ?auto_493283 ?auto_493285 ) ) ( not ( = ?auto_493283 ?auto_493286 ) ) ( not ( = ?auto_493283 ?auto_493287 ) ) ( not ( = ?auto_493283 ?auto_493288 ) ) ( not ( = ?auto_493283 ?auto_493289 ) ) ( not ( = ?auto_493283 ?auto_493290 ) ) ( not ( = ?auto_493283 ?auto_493291 ) ) ( not ( = ?auto_493283 ?auto_493295 ) ) ( not ( = ?auto_493284 ?auto_493285 ) ) ( not ( = ?auto_493284 ?auto_493286 ) ) ( not ( = ?auto_493284 ?auto_493287 ) ) ( not ( = ?auto_493284 ?auto_493288 ) ) ( not ( = ?auto_493284 ?auto_493289 ) ) ( not ( = ?auto_493284 ?auto_493290 ) ) ( not ( = ?auto_493284 ?auto_493291 ) ) ( not ( = ?auto_493284 ?auto_493295 ) ) ( not ( = ?auto_493285 ?auto_493286 ) ) ( not ( = ?auto_493285 ?auto_493287 ) ) ( not ( = ?auto_493285 ?auto_493288 ) ) ( not ( = ?auto_493285 ?auto_493289 ) ) ( not ( = ?auto_493285 ?auto_493290 ) ) ( not ( = ?auto_493285 ?auto_493291 ) ) ( not ( = ?auto_493285 ?auto_493295 ) ) ( not ( = ?auto_493286 ?auto_493287 ) ) ( not ( = ?auto_493286 ?auto_493288 ) ) ( not ( = ?auto_493286 ?auto_493289 ) ) ( not ( = ?auto_493286 ?auto_493290 ) ) ( not ( = ?auto_493286 ?auto_493291 ) ) ( not ( = ?auto_493286 ?auto_493295 ) ) ( not ( = ?auto_493287 ?auto_493288 ) ) ( not ( = ?auto_493287 ?auto_493289 ) ) ( not ( = ?auto_493287 ?auto_493290 ) ) ( not ( = ?auto_493287 ?auto_493291 ) ) ( not ( = ?auto_493287 ?auto_493295 ) ) ( not ( = ?auto_493288 ?auto_493289 ) ) ( not ( = ?auto_493288 ?auto_493290 ) ) ( not ( = ?auto_493288 ?auto_493291 ) ) ( not ( = ?auto_493288 ?auto_493295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493289 ?auto_493290 ?auto_493291 )
      ( MAKE-9CRATE-VERIFY ?auto_493282 ?auto_493283 ?auto_493284 ?auto_493285 ?auto_493286 ?auto_493287 ?auto_493288 ?auto_493289 ?auto_493290 ?auto_493291 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493391 - SURFACE
      ?auto_493392 - SURFACE
      ?auto_493393 - SURFACE
      ?auto_493394 - SURFACE
      ?auto_493395 - SURFACE
      ?auto_493396 - SURFACE
      ?auto_493397 - SURFACE
      ?auto_493398 - SURFACE
      ?auto_493399 - SURFACE
      ?auto_493400 - SURFACE
    )
    :vars
    (
      ?auto_493404 - HOIST
      ?auto_493403 - PLACE
      ?auto_493406 - PLACE
      ?auto_493401 - HOIST
      ?auto_493402 - SURFACE
      ?auto_493405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493404 ?auto_493403 ) ( IS-CRATE ?auto_493400 ) ( not ( = ?auto_493399 ?auto_493400 ) ) ( not ( = ?auto_493398 ?auto_493399 ) ) ( not ( = ?auto_493398 ?auto_493400 ) ) ( not ( = ?auto_493406 ?auto_493403 ) ) ( HOIST-AT ?auto_493401 ?auto_493406 ) ( not ( = ?auto_493404 ?auto_493401 ) ) ( AVAILABLE ?auto_493401 ) ( SURFACE-AT ?auto_493400 ?auto_493406 ) ( ON ?auto_493400 ?auto_493402 ) ( CLEAR ?auto_493400 ) ( not ( = ?auto_493399 ?auto_493402 ) ) ( not ( = ?auto_493400 ?auto_493402 ) ) ( not ( = ?auto_493398 ?auto_493402 ) ) ( TRUCK-AT ?auto_493405 ?auto_493403 ) ( SURFACE-AT ?auto_493398 ?auto_493403 ) ( CLEAR ?auto_493398 ) ( IS-CRATE ?auto_493399 ) ( AVAILABLE ?auto_493404 ) ( IN ?auto_493399 ?auto_493405 ) ( ON ?auto_493392 ?auto_493391 ) ( ON ?auto_493393 ?auto_493392 ) ( ON ?auto_493394 ?auto_493393 ) ( ON ?auto_493395 ?auto_493394 ) ( ON ?auto_493396 ?auto_493395 ) ( ON ?auto_493397 ?auto_493396 ) ( ON ?auto_493398 ?auto_493397 ) ( not ( = ?auto_493391 ?auto_493392 ) ) ( not ( = ?auto_493391 ?auto_493393 ) ) ( not ( = ?auto_493391 ?auto_493394 ) ) ( not ( = ?auto_493391 ?auto_493395 ) ) ( not ( = ?auto_493391 ?auto_493396 ) ) ( not ( = ?auto_493391 ?auto_493397 ) ) ( not ( = ?auto_493391 ?auto_493398 ) ) ( not ( = ?auto_493391 ?auto_493399 ) ) ( not ( = ?auto_493391 ?auto_493400 ) ) ( not ( = ?auto_493391 ?auto_493402 ) ) ( not ( = ?auto_493392 ?auto_493393 ) ) ( not ( = ?auto_493392 ?auto_493394 ) ) ( not ( = ?auto_493392 ?auto_493395 ) ) ( not ( = ?auto_493392 ?auto_493396 ) ) ( not ( = ?auto_493392 ?auto_493397 ) ) ( not ( = ?auto_493392 ?auto_493398 ) ) ( not ( = ?auto_493392 ?auto_493399 ) ) ( not ( = ?auto_493392 ?auto_493400 ) ) ( not ( = ?auto_493392 ?auto_493402 ) ) ( not ( = ?auto_493393 ?auto_493394 ) ) ( not ( = ?auto_493393 ?auto_493395 ) ) ( not ( = ?auto_493393 ?auto_493396 ) ) ( not ( = ?auto_493393 ?auto_493397 ) ) ( not ( = ?auto_493393 ?auto_493398 ) ) ( not ( = ?auto_493393 ?auto_493399 ) ) ( not ( = ?auto_493393 ?auto_493400 ) ) ( not ( = ?auto_493393 ?auto_493402 ) ) ( not ( = ?auto_493394 ?auto_493395 ) ) ( not ( = ?auto_493394 ?auto_493396 ) ) ( not ( = ?auto_493394 ?auto_493397 ) ) ( not ( = ?auto_493394 ?auto_493398 ) ) ( not ( = ?auto_493394 ?auto_493399 ) ) ( not ( = ?auto_493394 ?auto_493400 ) ) ( not ( = ?auto_493394 ?auto_493402 ) ) ( not ( = ?auto_493395 ?auto_493396 ) ) ( not ( = ?auto_493395 ?auto_493397 ) ) ( not ( = ?auto_493395 ?auto_493398 ) ) ( not ( = ?auto_493395 ?auto_493399 ) ) ( not ( = ?auto_493395 ?auto_493400 ) ) ( not ( = ?auto_493395 ?auto_493402 ) ) ( not ( = ?auto_493396 ?auto_493397 ) ) ( not ( = ?auto_493396 ?auto_493398 ) ) ( not ( = ?auto_493396 ?auto_493399 ) ) ( not ( = ?auto_493396 ?auto_493400 ) ) ( not ( = ?auto_493396 ?auto_493402 ) ) ( not ( = ?auto_493397 ?auto_493398 ) ) ( not ( = ?auto_493397 ?auto_493399 ) ) ( not ( = ?auto_493397 ?auto_493400 ) ) ( not ( = ?auto_493397 ?auto_493402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493398 ?auto_493399 ?auto_493400 )
      ( MAKE-9CRATE-VERIFY ?auto_493391 ?auto_493392 ?auto_493393 ?auto_493394 ?auto_493395 ?auto_493396 ?auto_493397 ?auto_493398 ?auto_493399 ?auto_493400 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_498937 - SURFACE
      ?auto_498938 - SURFACE
      ?auto_498939 - SURFACE
      ?auto_498940 - SURFACE
      ?auto_498941 - SURFACE
      ?auto_498942 - SURFACE
      ?auto_498943 - SURFACE
      ?auto_498944 - SURFACE
      ?auto_498945 - SURFACE
      ?auto_498946 - SURFACE
      ?auto_498947 - SURFACE
    )
    :vars
    (
      ?auto_498949 - HOIST
      ?auto_498948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_498949 ?auto_498948 ) ( SURFACE-AT ?auto_498946 ?auto_498948 ) ( CLEAR ?auto_498946 ) ( LIFTING ?auto_498949 ?auto_498947 ) ( IS-CRATE ?auto_498947 ) ( not ( = ?auto_498946 ?auto_498947 ) ) ( ON ?auto_498938 ?auto_498937 ) ( ON ?auto_498939 ?auto_498938 ) ( ON ?auto_498940 ?auto_498939 ) ( ON ?auto_498941 ?auto_498940 ) ( ON ?auto_498942 ?auto_498941 ) ( ON ?auto_498943 ?auto_498942 ) ( ON ?auto_498944 ?auto_498943 ) ( ON ?auto_498945 ?auto_498944 ) ( ON ?auto_498946 ?auto_498945 ) ( not ( = ?auto_498937 ?auto_498938 ) ) ( not ( = ?auto_498937 ?auto_498939 ) ) ( not ( = ?auto_498937 ?auto_498940 ) ) ( not ( = ?auto_498937 ?auto_498941 ) ) ( not ( = ?auto_498937 ?auto_498942 ) ) ( not ( = ?auto_498937 ?auto_498943 ) ) ( not ( = ?auto_498937 ?auto_498944 ) ) ( not ( = ?auto_498937 ?auto_498945 ) ) ( not ( = ?auto_498937 ?auto_498946 ) ) ( not ( = ?auto_498937 ?auto_498947 ) ) ( not ( = ?auto_498938 ?auto_498939 ) ) ( not ( = ?auto_498938 ?auto_498940 ) ) ( not ( = ?auto_498938 ?auto_498941 ) ) ( not ( = ?auto_498938 ?auto_498942 ) ) ( not ( = ?auto_498938 ?auto_498943 ) ) ( not ( = ?auto_498938 ?auto_498944 ) ) ( not ( = ?auto_498938 ?auto_498945 ) ) ( not ( = ?auto_498938 ?auto_498946 ) ) ( not ( = ?auto_498938 ?auto_498947 ) ) ( not ( = ?auto_498939 ?auto_498940 ) ) ( not ( = ?auto_498939 ?auto_498941 ) ) ( not ( = ?auto_498939 ?auto_498942 ) ) ( not ( = ?auto_498939 ?auto_498943 ) ) ( not ( = ?auto_498939 ?auto_498944 ) ) ( not ( = ?auto_498939 ?auto_498945 ) ) ( not ( = ?auto_498939 ?auto_498946 ) ) ( not ( = ?auto_498939 ?auto_498947 ) ) ( not ( = ?auto_498940 ?auto_498941 ) ) ( not ( = ?auto_498940 ?auto_498942 ) ) ( not ( = ?auto_498940 ?auto_498943 ) ) ( not ( = ?auto_498940 ?auto_498944 ) ) ( not ( = ?auto_498940 ?auto_498945 ) ) ( not ( = ?auto_498940 ?auto_498946 ) ) ( not ( = ?auto_498940 ?auto_498947 ) ) ( not ( = ?auto_498941 ?auto_498942 ) ) ( not ( = ?auto_498941 ?auto_498943 ) ) ( not ( = ?auto_498941 ?auto_498944 ) ) ( not ( = ?auto_498941 ?auto_498945 ) ) ( not ( = ?auto_498941 ?auto_498946 ) ) ( not ( = ?auto_498941 ?auto_498947 ) ) ( not ( = ?auto_498942 ?auto_498943 ) ) ( not ( = ?auto_498942 ?auto_498944 ) ) ( not ( = ?auto_498942 ?auto_498945 ) ) ( not ( = ?auto_498942 ?auto_498946 ) ) ( not ( = ?auto_498942 ?auto_498947 ) ) ( not ( = ?auto_498943 ?auto_498944 ) ) ( not ( = ?auto_498943 ?auto_498945 ) ) ( not ( = ?auto_498943 ?auto_498946 ) ) ( not ( = ?auto_498943 ?auto_498947 ) ) ( not ( = ?auto_498944 ?auto_498945 ) ) ( not ( = ?auto_498944 ?auto_498946 ) ) ( not ( = ?auto_498944 ?auto_498947 ) ) ( not ( = ?auto_498945 ?auto_498946 ) ) ( not ( = ?auto_498945 ?auto_498947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_498946 ?auto_498947 )
      ( MAKE-10CRATE-VERIFY ?auto_498937 ?auto_498938 ?auto_498939 ?auto_498940 ?auto_498941 ?auto_498942 ?auto_498943 ?auto_498944 ?auto_498945 ?auto_498946 ?auto_498947 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499031 - SURFACE
      ?auto_499032 - SURFACE
      ?auto_499033 - SURFACE
      ?auto_499034 - SURFACE
      ?auto_499035 - SURFACE
      ?auto_499036 - SURFACE
      ?auto_499037 - SURFACE
      ?auto_499038 - SURFACE
      ?auto_499039 - SURFACE
      ?auto_499040 - SURFACE
      ?auto_499041 - SURFACE
    )
    :vars
    (
      ?auto_499044 - HOIST
      ?auto_499042 - PLACE
      ?auto_499043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499044 ?auto_499042 ) ( SURFACE-AT ?auto_499040 ?auto_499042 ) ( CLEAR ?auto_499040 ) ( IS-CRATE ?auto_499041 ) ( not ( = ?auto_499040 ?auto_499041 ) ) ( TRUCK-AT ?auto_499043 ?auto_499042 ) ( AVAILABLE ?auto_499044 ) ( IN ?auto_499041 ?auto_499043 ) ( ON ?auto_499040 ?auto_499039 ) ( not ( = ?auto_499039 ?auto_499040 ) ) ( not ( = ?auto_499039 ?auto_499041 ) ) ( ON ?auto_499032 ?auto_499031 ) ( ON ?auto_499033 ?auto_499032 ) ( ON ?auto_499034 ?auto_499033 ) ( ON ?auto_499035 ?auto_499034 ) ( ON ?auto_499036 ?auto_499035 ) ( ON ?auto_499037 ?auto_499036 ) ( ON ?auto_499038 ?auto_499037 ) ( ON ?auto_499039 ?auto_499038 ) ( not ( = ?auto_499031 ?auto_499032 ) ) ( not ( = ?auto_499031 ?auto_499033 ) ) ( not ( = ?auto_499031 ?auto_499034 ) ) ( not ( = ?auto_499031 ?auto_499035 ) ) ( not ( = ?auto_499031 ?auto_499036 ) ) ( not ( = ?auto_499031 ?auto_499037 ) ) ( not ( = ?auto_499031 ?auto_499038 ) ) ( not ( = ?auto_499031 ?auto_499039 ) ) ( not ( = ?auto_499031 ?auto_499040 ) ) ( not ( = ?auto_499031 ?auto_499041 ) ) ( not ( = ?auto_499032 ?auto_499033 ) ) ( not ( = ?auto_499032 ?auto_499034 ) ) ( not ( = ?auto_499032 ?auto_499035 ) ) ( not ( = ?auto_499032 ?auto_499036 ) ) ( not ( = ?auto_499032 ?auto_499037 ) ) ( not ( = ?auto_499032 ?auto_499038 ) ) ( not ( = ?auto_499032 ?auto_499039 ) ) ( not ( = ?auto_499032 ?auto_499040 ) ) ( not ( = ?auto_499032 ?auto_499041 ) ) ( not ( = ?auto_499033 ?auto_499034 ) ) ( not ( = ?auto_499033 ?auto_499035 ) ) ( not ( = ?auto_499033 ?auto_499036 ) ) ( not ( = ?auto_499033 ?auto_499037 ) ) ( not ( = ?auto_499033 ?auto_499038 ) ) ( not ( = ?auto_499033 ?auto_499039 ) ) ( not ( = ?auto_499033 ?auto_499040 ) ) ( not ( = ?auto_499033 ?auto_499041 ) ) ( not ( = ?auto_499034 ?auto_499035 ) ) ( not ( = ?auto_499034 ?auto_499036 ) ) ( not ( = ?auto_499034 ?auto_499037 ) ) ( not ( = ?auto_499034 ?auto_499038 ) ) ( not ( = ?auto_499034 ?auto_499039 ) ) ( not ( = ?auto_499034 ?auto_499040 ) ) ( not ( = ?auto_499034 ?auto_499041 ) ) ( not ( = ?auto_499035 ?auto_499036 ) ) ( not ( = ?auto_499035 ?auto_499037 ) ) ( not ( = ?auto_499035 ?auto_499038 ) ) ( not ( = ?auto_499035 ?auto_499039 ) ) ( not ( = ?auto_499035 ?auto_499040 ) ) ( not ( = ?auto_499035 ?auto_499041 ) ) ( not ( = ?auto_499036 ?auto_499037 ) ) ( not ( = ?auto_499036 ?auto_499038 ) ) ( not ( = ?auto_499036 ?auto_499039 ) ) ( not ( = ?auto_499036 ?auto_499040 ) ) ( not ( = ?auto_499036 ?auto_499041 ) ) ( not ( = ?auto_499037 ?auto_499038 ) ) ( not ( = ?auto_499037 ?auto_499039 ) ) ( not ( = ?auto_499037 ?auto_499040 ) ) ( not ( = ?auto_499037 ?auto_499041 ) ) ( not ( = ?auto_499038 ?auto_499039 ) ) ( not ( = ?auto_499038 ?auto_499040 ) ) ( not ( = ?auto_499038 ?auto_499041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499039 ?auto_499040 ?auto_499041 )
      ( MAKE-10CRATE-VERIFY ?auto_499031 ?auto_499032 ?auto_499033 ?auto_499034 ?auto_499035 ?auto_499036 ?auto_499037 ?auto_499038 ?auto_499039 ?auto_499040 ?auto_499041 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499136 - SURFACE
      ?auto_499137 - SURFACE
      ?auto_499138 - SURFACE
      ?auto_499139 - SURFACE
      ?auto_499140 - SURFACE
      ?auto_499141 - SURFACE
      ?auto_499142 - SURFACE
      ?auto_499143 - SURFACE
      ?auto_499144 - SURFACE
      ?auto_499145 - SURFACE
      ?auto_499146 - SURFACE
    )
    :vars
    (
      ?auto_499148 - HOIST
      ?auto_499150 - PLACE
      ?auto_499147 - TRUCK
      ?auto_499149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_499148 ?auto_499150 ) ( SURFACE-AT ?auto_499145 ?auto_499150 ) ( CLEAR ?auto_499145 ) ( IS-CRATE ?auto_499146 ) ( not ( = ?auto_499145 ?auto_499146 ) ) ( AVAILABLE ?auto_499148 ) ( IN ?auto_499146 ?auto_499147 ) ( ON ?auto_499145 ?auto_499144 ) ( not ( = ?auto_499144 ?auto_499145 ) ) ( not ( = ?auto_499144 ?auto_499146 ) ) ( TRUCK-AT ?auto_499147 ?auto_499149 ) ( not ( = ?auto_499149 ?auto_499150 ) ) ( ON ?auto_499137 ?auto_499136 ) ( ON ?auto_499138 ?auto_499137 ) ( ON ?auto_499139 ?auto_499138 ) ( ON ?auto_499140 ?auto_499139 ) ( ON ?auto_499141 ?auto_499140 ) ( ON ?auto_499142 ?auto_499141 ) ( ON ?auto_499143 ?auto_499142 ) ( ON ?auto_499144 ?auto_499143 ) ( not ( = ?auto_499136 ?auto_499137 ) ) ( not ( = ?auto_499136 ?auto_499138 ) ) ( not ( = ?auto_499136 ?auto_499139 ) ) ( not ( = ?auto_499136 ?auto_499140 ) ) ( not ( = ?auto_499136 ?auto_499141 ) ) ( not ( = ?auto_499136 ?auto_499142 ) ) ( not ( = ?auto_499136 ?auto_499143 ) ) ( not ( = ?auto_499136 ?auto_499144 ) ) ( not ( = ?auto_499136 ?auto_499145 ) ) ( not ( = ?auto_499136 ?auto_499146 ) ) ( not ( = ?auto_499137 ?auto_499138 ) ) ( not ( = ?auto_499137 ?auto_499139 ) ) ( not ( = ?auto_499137 ?auto_499140 ) ) ( not ( = ?auto_499137 ?auto_499141 ) ) ( not ( = ?auto_499137 ?auto_499142 ) ) ( not ( = ?auto_499137 ?auto_499143 ) ) ( not ( = ?auto_499137 ?auto_499144 ) ) ( not ( = ?auto_499137 ?auto_499145 ) ) ( not ( = ?auto_499137 ?auto_499146 ) ) ( not ( = ?auto_499138 ?auto_499139 ) ) ( not ( = ?auto_499138 ?auto_499140 ) ) ( not ( = ?auto_499138 ?auto_499141 ) ) ( not ( = ?auto_499138 ?auto_499142 ) ) ( not ( = ?auto_499138 ?auto_499143 ) ) ( not ( = ?auto_499138 ?auto_499144 ) ) ( not ( = ?auto_499138 ?auto_499145 ) ) ( not ( = ?auto_499138 ?auto_499146 ) ) ( not ( = ?auto_499139 ?auto_499140 ) ) ( not ( = ?auto_499139 ?auto_499141 ) ) ( not ( = ?auto_499139 ?auto_499142 ) ) ( not ( = ?auto_499139 ?auto_499143 ) ) ( not ( = ?auto_499139 ?auto_499144 ) ) ( not ( = ?auto_499139 ?auto_499145 ) ) ( not ( = ?auto_499139 ?auto_499146 ) ) ( not ( = ?auto_499140 ?auto_499141 ) ) ( not ( = ?auto_499140 ?auto_499142 ) ) ( not ( = ?auto_499140 ?auto_499143 ) ) ( not ( = ?auto_499140 ?auto_499144 ) ) ( not ( = ?auto_499140 ?auto_499145 ) ) ( not ( = ?auto_499140 ?auto_499146 ) ) ( not ( = ?auto_499141 ?auto_499142 ) ) ( not ( = ?auto_499141 ?auto_499143 ) ) ( not ( = ?auto_499141 ?auto_499144 ) ) ( not ( = ?auto_499141 ?auto_499145 ) ) ( not ( = ?auto_499141 ?auto_499146 ) ) ( not ( = ?auto_499142 ?auto_499143 ) ) ( not ( = ?auto_499142 ?auto_499144 ) ) ( not ( = ?auto_499142 ?auto_499145 ) ) ( not ( = ?auto_499142 ?auto_499146 ) ) ( not ( = ?auto_499143 ?auto_499144 ) ) ( not ( = ?auto_499143 ?auto_499145 ) ) ( not ( = ?auto_499143 ?auto_499146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499144 ?auto_499145 ?auto_499146 )
      ( MAKE-10CRATE-VERIFY ?auto_499136 ?auto_499137 ?auto_499138 ?auto_499139 ?auto_499140 ?auto_499141 ?auto_499142 ?auto_499143 ?auto_499144 ?auto_499145 ?auto_499146 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499251 - SURFACE
      ?auto_499252 - SURFACE
      ?auto_499253 - SURFACE
      ?auto_499254 - SURFACE
      ?auto_499255 - SURFACE
      ?auto_499256 - SURFACE
      ?auto_499257 - SURFACE
      ?auto_499258 - SURFACE
      ?auto_499259 - SURFACE
      ?auto_499260 - SURFACE
      ?auto_499261 - SURFACE
    )
    :vars
    (
      ?auto_499265 - HOIST
      ?auto_499263 - PLACE
      ?auto_499264 - TRUCK
      ?auto_499262 - PLACE
      ?auto_499266 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_499265 ?auto_499263 ) ( SURFACE-AT ?auto_499260 ?auto_499263 ) ( CLEAR ?auto_499260 ) ( IS-CRATE ?auto_499261 ) ( not ( = ?auto_499260 ?auto_499261 ) ) ( AVAILABLE ?auto_499265 ) ( ON ?auto_499260 ?auto_499259 ) ( not ( = ?auto_499259 ?auto_499260 ) ) ( not ( = ?auto_499259 ?auto_499261 ) ) ( TRUCK-AT ?auto_499264 ?auto_499262 ) ( not ( = ?auto_499262 ?auto_499263 ) ) ( HOIST-AT ?auto_499266 ?auto_499262 ) ( LIFTING ?auto_499266 ?auto_499261 ) ( not ( = ?auto_499265 ?auto_499266 ) ) ( ON ?auto_499252 ?auto_499251 ) ( ON ?auto_499253 ?auto_499252 ) ( ON ?auto_499254 ?auto_499253 ) ( ON ?auto_499255 ?auto_499254 ) ( ON ?auto_499256 ?auto_499255 ) ( ON ?auto_499257 ?auto_499256 ) ( ON ?auto_499258 ?auto_499257 ) ( ON ?auto_499259 ?auto_499258 ) ( not ( = ?auto_499251 ?auto_499252 ) ) ( not ( = ?auto_499251 ?auto_499253 ) ) ( not ( = ?auto_499251 ?auto_499254 ) ) ( not ( = ?auto_499251 ?auto_499255 ) ) ( not ( = ?auto_499251 ?auto_499256 ) ) ( not ( = ?auto_499251 ?auto_499257 ) ) ( not ( = ?auto_499251 ?auto_499258 ) ) ( not ( = ?auto_499251 ?auto_499259 ) ) ( not ( = ?auto_499251 ?auto_499260 ) ) ( not ( = ?auto_499251 ?auto_499261 ) ) ( not ( = ?auto_499252 ?auto_499253 ) ) ( not ( = ?auto_499252 ?auto_499254 ) ) ( not ( = ?auto_499252 ?auto_499255 ) ) ( not ( = ?auto_499252 ?auto_499256 ) ) ( not ( = ?auto_499252 ?auto_499257 ) ) ( not ( = ?auto_499252 ?auto_499258 ) ) ( not ( = ?auto_499252 ?auto_499259 ) ) ( not ( = ?auto_499252 ?auto_499260 ) ) ( not ( = ?auto_499252 ?auto_499261 ) ) ( not ( = ?auto_499253 ?auto_499254 ) ) ( not ( = ?auto_499253 ?auto_499255 ) ) ( not ( = ?auto_499253 ?auto_499256 ) ) ( not ( = ?auto_499253 ?auto_499257 ) ) ( not ( = ?auto_499253 ?auto_499258 ) ) ( not ( = ?auto_499253 ?auto_499259 ) ) ( not ( = ?auto_499253 ?auto_499260 ) ) ( not ( = ?auto_499253 ?auto_499261 ) ) ( not ( = ?auto_499254 ?auto_499255 ) ) ( not ( = ?auto_499254 ?auto_499256 ) ) ( not ( = ?auto_499254 ?auto_499257 ) ) ( not ( = ?auto_499254 ?auto_499258 ) ) ( not ( = ?auto_499254 ?auto_499259 ) ) ( not ( = ?auto_499254 ?auto_499260 ) ) ( not ( = ?auto_499254 ?auto_499261 ) ) ( not ( = ?auto_499255 ?auto_499256 ) ) ( not ( = ?auto_499255 ?auto_499257 ) ) ( not ( = ?auto_499255 ?auto_499258 ) ) ( not ( = ?auto_499255 ?auto_499259 ) ) ( not ( = ?auto_499255 ?auto_499260 ) ) ( not ( = ?auto_499255 ?auto_499261 ) ) ( not ( = ?auto_499256 ?auto_499257 ) ) ( not ( = ?auto_499256 ?auto_499258 ) ) ( not ( = ?auto_499256 ?auto_499259 ) ) ( not ( = ?auto_499256 ?auto_499260 ) ) ( not ( = ?auto_499256 ?auto_499261 ) ) ( not ( = ?auto_499257 ?auto_499258 ) ) ( not ( = ?auto_499257 ?auto_499259 ) ) ( not ( = ?auto_499257 ?auto_499260 ) ) ( not ( = ?auto_499257 ?auto_499261 ) ) ( not ( = ?auto_499258 ?auto_499259 ) ) ( not ( = ?auto_499258 ?auto_499260 ) ) ( not ( = ?auto_499258 ?auto_499261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499259 ?auto_499260 ?auto_499261 )
      ( MAKE-10CRATE-VERIFY ?auto_499251 ?auto_499252 ?auto_499253 ?auto_499254 ?auto_499255 ?auto_499256 ?auto_499257 ?auto_499258 ?auto_499259 ?auto_499260 ?auto_499261 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499376 - SURFACE
      ?auto_499377 - SURFACE
      ?auto_499378 - SURFACE
      ?auto_499379 - SURFACE
      ?auto_499380 - SURFACE
      ?auto_499381 - SURFACE
      ?auto_499382 - SURFACE
      ?auto_499383 - SURFACE
      ?auto_499384 - SURFACE
      ?auto_499385 - SURFACE
      ?auto_499386 - SURFACE
    )
    :vars
    (
      ?auto_499389 - HOIST
      ?auto_499392 - PLACE
      ?auto_499390 - TRUCK
      ?auto_499391 - PLACE
      ?auto_499387 - HOIST
      ?auto_499388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_499389 ?auto_499392 ) ( SURFACE-AT ?auto_499385 ?auto_499392 ) ( CLEAR ?auto_499385 ) ( IS-CRATE ?auto_499386 ) ( not ( = ?auto_499385 ?auto_499386 ) ) ( AVAILABLE ?auto_499389 ) ( ON ?auto_499385 ?auto_499384 ) ( not ( = ?auto_499384 ?auto_499385 ) ) ( not ( = ?auto_499384 ?auto_499386 ) ) ( TRUCK-AT ?auto_499390 ?auto_499391 ) ( not ( = ?auto_499391 ?auto_499392 ) ) ( HOIST-AT ?auto_499387 ?auto_499391 ) ( not ( = ?auto_499389 ?auto_499387 ) ) ( AVAILABLE ?auto_499387 ) ( SURFACE-AT ?auto_499386 ?auto_499391 ) ( ON ?auto_499386 ?auto_499388 ) ( CLEAR ?auto_499386 ) ( not ( = ?auto_499385 ?auto_499388 ) ) ( not ( = ?auto_499386 ?auto_499388 ) ) ( not ( = ?auto_499384 ?auto_499388 ) ) ( ON ?auto_499377 ?auto_499376 ) ( ON ?auto_499378 ?auto_499377 ) ( ON ?auto_499379 ?auto_499378 ) ( ON ?auto_499380 ?auto_499379 ) ( ON ?auto_499381 ?auto_499380 ) ( ON ?auto_499382 ?auto_499381 ) ( ON ?auto_499383 ?auto_499382 ) ( ON ?auto_499384 ?auto_499383 ) ( not ( = ?auto_499376 ?auto_499377 ) ) ( not ( = ?auto_499376 ?auto_499378 ) ) ( not ( = ?auto_499376 ?auto_499379 ) ) ( not ( = ?auto_499376 ?auto_499380 ) ) ( not ( = ?auto_499376 ?auto_499381 ) ) ( not ( = ?auto_499376 ?auto_499382 ) ) ( not ( = ?auto_499376 ?auto_499383 ) ) ( not ( = ?auto_499376 ?auto_499384 ) ) ( not ( = ?auto_499376 ?auto_499385 ) ) ( not ( = ?auto_499376 ?auto_499386 ) ) ( not ( = ?auto_499376 ?auto_499388 ) ) ( not ( = ?auto_499377 ?auto_499378 ) ) ( not ( = ?auto_499377 ?auto_499379 ) ) ( not ( = ?auto_499377 ?auto_499380 ) ) ( not ( = ?auto_499377 ?auto_499381 ) ) ( not ( = ?auto_499377 ?auto_499382 ) ) ( not ( = ?auto_499377 ?auto_499383 ) ) ( not ( = ?auto_499377 ?auto_499384 ) ) ( not ( = ?auto_499377 ?auto_499385 ) ) ( not ( = ?auto_499377 ?auto_499386 ) ) ( not ( = ?auto_499377 ?auto_499388 ) ) ( not ( = ?auto_499378 ?auto_499379 ) ) ( not ( = ?auto_499378 ?auto_499380 ) ) ( not ( = ?auto_499378 ?auto_499381 ) ) ( not ( = ?auto_499378 ?auto_499382 ) ) ( not ( = ?auto_499378 ?auto_499383 ) ) ( not ( = ?auto_499378 ?auto_499384 ) ) ( not ( = ?auto_499378 ?auto_499385 ) ) ( not ( = ?auto_499378 ?auto_499386 ) ) ( not ( = ?auto_499378 ?auto_499388 ) ) ( not ( = ?auto_499379 ?auto_499380 ) ) ( not ( = ?auto_499379 ?auto_499381 ) ) ( not ( = ?auto_499379 ?auto_499382 ) ) ( not ( = ?auto_499379 ?auto_499383 ) ) ( not ( = ?auto_499379 ?auto_499384 ) ) ( not ( = ?auto_499379 ?auto_499385 ) ) ( not ( = ?auto_499379 ?auto_499386 ) ) ( not ( = ?auto_499379 ?auto_499388 ) ) ( not ( = ?auto_499380 ?auto_499381 ) ) ( not ( = ?auto_499380 ?auto_499382 ) ) ( not ( = ?auto_499380 ?auto_499383 ) ) ( not ( = ?auto_499380 ?auto_499384 ) ) ( not ( = ?auto_499380 ?auto_499385 ) ) ( not ( = ?auto_499380 ?auto_499386 ) ) ( not ( = ?auto_499380 ?auto_499388 ) ) ( not ( = ?auto_499381 ?auto_499382 ) ) ( not ( = ?auto_499381 ?auto_499383 ) ) ( not ( = ?auto_499381 ?auto_499384 ) ) ( not ( = ?auto_499381 ?auto_499385 ) ) ( not ( = ?auto_499381 ?auto_499386 ) ) ( not ( = ?auto_499381 ?auto_499388 ) ) ( not ( = ?auto_499382 ?auto_499383 ) ) ( not ( = ?auto_499382 ?auto_499384 ) ) ( not ( = ?auto_499382 ?auto_499385 ) ) ( not ( = ?auto_499382 ?auto_499386 ) ) ( not ( = ?auto_499382 ?auto_499388 ) ) ( not ( = ?auto_499383 ?auto_499384 ) ) ( not ( = ?auto_499383 ?auto_499385 ) ) ( not ( = ?auto_499383 ?auto_499386 ) ) ( not ( = ?auto_499383 ?auto_499388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499384 ?auto_499385 ?auto_499386 )
      ( MAKE-10CRATE-VERIFY ?auto_499376 ?auto_499377 ?auto_499378 ?auto_499379 ?auto_499380 ?auto_499381 ?auto_499382 ?auto_499383 ?auto_499384 ?auto_499385 ?auto_499386 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499502 - SURFACE
      ?auto_499503 - SURFACE
      ?auto_499504 - SURFACE
      ?auto_499505 - SURFACE
      ?auto_499506 - SURFACE
      ?auto_499507 - SURFACE
      ?auto_499508 - SURFACE
      ?auto_499509 - SURFACE
      ?auto_499510 - SURFACE
      ?auto_499511 - SURFACE
      ?auto_499512 - SURFACE
    )
    :vars
    (
      ?auto_499513 - HOIST
      ?auto_499518 - PLACE
      ?auto_499517 - PLACE
      ?auto_499514 - HOIST
      ?auto_499516 - SURFACE
      ?auto_499515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499513 ?auto_499518 ) ( SURFACE-AT ?auto_499511 ?auto_499518 ) ( CLEAR ?auto_499511 ) ( IS-CRATE ?auto_499512 ) ( not ( = ?auto_499511 ?auto_499512 ) ) ( AVAILABLE ?auto_499513 ) ( ON ?auto_499511 ?auto_499510 ) ( not ( = ?auto_499510 ?auto_499511 ) ) ( not ( = ?auto_499510 ?auto_499512 ) ) ( not ( = ?auto_499517 ?auto_499518 ) ) ( HOIST-AT ?auto_499514 ?auto_499517 ) ( not ( = ?auto_499513 ?auto_499514 ) ) ( AVAILABLE ?auto_499514 ) ( SURFACE-AT ?auto_499512 ?auto_499517 ) ( ON ?auto_499512 ?auto_499516 ) ( CLEAR ?auto_499512 ) ( not ( = ?auto_499511 ?auto_499516 ) ) ( not ( = ?auto_499512 ?auto_499516 ) ) ( not ( = ?auto_499510 ?auto_499516 ) ) ( TRUCK-AT ?auto_499515 ?auto_499518 ) ( ON ?auto_499503 ?auto_499502 ) ( ON ?auto_499504 ?auto_499503 ) ( ON ?auto_499505 ?auto_499504 ) ( ON ?auto_499506 ?auto_499505 ) ( ON ?auto_499507 ?auto_499506 ) ( ON ?auto_499508 ?auto_499507 ) ( ON ?auto_499509 ?auto_499508 ) ( ON ?auto_499510 ?auto_499509 ) ( not ( = ?auto_499502 ?auto_499503 ) ) ( not ( = ?auto_499502 ?auto_499504 ) ) ( not ( = ?auto_499502 ?auto_499505 ) ) ( not ( = ?auto_499502 ?auto_499506 ) ) ( not ( = ?auto_499502 ?auto_499507 ) ) ( not ( = ?auto_499502 ?auto_499508 ) ) ( not ( = ?auto_499502 ?auto_499509 ) ) ( not ( = ?auto_499502 ?auto_499510 ) ) ( not ( = ?auto_499502 ?auto_499511 ) ) ( not ( = ?auto_499502 ?auto_499512 ) ) ( not ( = ?auto_499502 ?auto_499516 ) ) ( not ( = ?auto_499503 ?auto_499504 ) ) ( not ( = ?auto_499503 ?auto_499505 ) ) ( not ( = ?auto_499503 ?auto_499506 ) ) ( not ( = ?auto_499503 ?auto_499507 ) ) ( not ( = ?auto_499503 ?auto_499508 ) ) ( not ( = ?auto_499503 ?auto_499509 ) ) ( not ( = ?auto_499503 ?auto_499510 ) ) ( not ( = ?auto_499503 ?auto_499511 ) ) ( not ( = ?auto_499503 ?auto_499512 ) ) ( not ( = ?auto_499503 ?auto_499516 ) ) ( not ( = ?auto_499504 ?auto_499505 ) ) ( not ( = ?auto_499504 ?auto_499506 ) ) ( not ( = ?auto_499504 ?auto_499507 ) ) ( not ( = ?auto_499504 ?auto_499508 ) ) ( not ( = ?auto_499504 ?auto_499509 ) ) ( not ( = ?auto_499504 ?auto_499510 ) ) ( not ( = ?auto_499504 ?auto_499511 ) ) ( not ( = ?auto_499504 ?auto_499512 ) ) ( not ( = ?auto_499504 ?auto_499516 ) ) ( not ( = ?auto_499505 ?auto_499506 ) ) ( not ( = ?auto_499505 ?auto_499507 ) ) ( not ( = ?auto_499505 ?auto_499508 ) ) ( not ( = ?auto_499505 ?auto_499509 ) ) ( not ( = ?auto_499505 ?auto_499510 ) ) ( not ( = ?auto_499505 ?auto_499511 ) ) ( not ( = ?auto_499505 ?auto_499512 ) ) ( not ( = ?auto_499505 ?auto_499516 ) ) ( not ( = ?auto_499506 ?auto_499507 ) ) ( not ( = ?auto_499506 ?auto_499508 ) ) ( not ( = ?auto_499506 ?auto_499509 ) ) ( not ( = ?auto_499506 ?auto_499510 ) ) ( not ( = ?auto_499506 ?auto_499511 ) ) ( not ( = ?auto_499506 ?auto_499512 ) ) ( not ( = ?auto_499506 ?auto_499516 ) ) ( not ( = ?auto_499507 ?auto_499508 ) ) ( not ( = ?auto_499507 ?auto_499509 ) ) ( not ( = ?auto_499507 ?auto_499510 ) ) ( not ( = ?auto_499507 ?auto_499511 ) ) ( not ( = ?auto_499507 ?auto_499512 ) ) ( not ( = ?auto_499507 ?auto_499516 ) ) ( not ( = ?auto_499508 ?auto_499509 ) ) ( not ( = ?auto_499508 ?auto_499510 ) ) ( not ( = ?auto_499508 ?auto_499511 ) ) ( not ( = ?auto_499508 ?auto_499512 ) ) ( not ( = ?auto_499508 ?auto_499516 ) ) ( not ( = ?auto_499509 ?auto_499510 ) ) ( not ( = ?auto_499509 ?auto_499511 ) ) ( not ( = ?auto_499509 ?auto_499512 ) ) ( not ( = ?auto_499509 ?auto_499516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499510 ?auto_499511 ?auto_499512 )
      ( MAKE-10CRATE-VERIFY ?auto_499502 ?auto_499503 ?auto_499504 ?auto_499505 ?auto_499506 ?auto_499507 ?auto_499508 ?auto_499509 ?auto_499510 ?auto_499511 ?auto_499512 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499628 - SURFACE
      ?auto_499629 - SURFACE
      ?auto_499630 - SURFACE
      ?auto_499631 - SURFACE
      ?auto_499632 - SURFACE
      ?auto_499633 - SURFACE
      ?auto_499634 - SURFACE
      ?auto_499635 - SURFACE
      ?auto_499636 - SURFACE
      ?auto_499637 - SURFACE
      ?auto_499638 - SURFACE
    )
    :vars
    (
      ?auto_499642 - HOIST
      ?auto_499640 - PLACE
      ?auto_499639 - PLACE
      ?auto_499644 - HOIST
      ?auto_499641 - SURFACE
      ?auto_499643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499642 ?auto_499640 ) ( IS-CRATE ?auto_499638 ) ( not ( = ?auto_499637 ?auto_499638 ) ) ( not ( = ?auto_499636 ?auto_499637 ) ) ( not ( = ?auto_499636 ?auto_499638 ) ) ( not ( = ?auto_499639 ?auto_499640 ) ) ( HOIST-AT ?auto_499644 ?auto_499639 ) ( not ( = ?auto_499642 ?auto_499644 ) ) ( AVAILABLE ?auto_499644 ) ( SURFACE-AT ?auto_499638 ?auto_499639 ) ( ON ?auto_499638 ?auto_499641 ) ( CLEAR ?auto_499638 ) ( not ( = ?auto_499637 ?auto_499641 ) ) ( not ( = ?auto_499638 ?auto_499641 ) ) ( not ( = ?auto_499636 ?auto_499641 ) ) ( TRUCK-AT ?auto_499643 ?auto_499640 ) ( SURFACE-AT ?auto_499636 ?auto_499640 ) ( CLEAR ?auto_499636 ) ( LIFTING ?auto_499642 ?auto_499637 ) ( IS-CRATE ?auto_499637 ) ( ON ?auto_499629 ?auto_499628 ) ( ON ?auto_499630 ?auto_499629 ) ( ON ?auto_499631 ?auto_499630 ) ( ON ?auto_499632 ?auto_499631 ) ( ON ?auto_499633 ?auto_499632 ) ( ON ?auto_499634 ?auto_499633 ) ( ON ?auto_499635 ?auto_499634 ) ( ON ?auto_499636 ?auto_499635 ) ( not ( = ?auto_499628 ?auto_499629 ) ) ( not ( = ?auto_499628 ?auto_499630 ) ) ( not ( = ?auto_499628 ?auto_499631 ) ) ( not ( = ?auto_499628 ?auto_499632 ) ) ( not ( = ?auto_499628 ?auto_499633 ) ) ( not ( = ?auto_499628 ?auto_499634 ) ) ( not ( = ?auto_499628 ?auto_499635 ) ) ( not ( = ?auto_499628 ?auto_499636 ) ) ( not ( = ?auto_499628 ?auto_499637 ) ) ( not ( = ?auto_499628 ?auto_499638 ) ) ( not ( = ?auto_499628 ?auto_499641 ) ) ( not ( = ?auto_499629 ?auto_499630 ) ) ( not ( = ?auto_499629 ?auto_499631 ) ) ( not ( = ?auto_499629 ?auto_499632 ) ) ( not ( = ?auto_499629 ?auto_499633 ) ) ( not ( = ?auto_499629 ?auto_499634 ) ) ( not ( = ?auto_499629 ?auto_499635 ) ) ( not ( = ?auto_499629 ?auto_499636 ) ) ( not ( = ?auto_499629 ?auto_499637 ) ) ( not ( = ?auto_499629 ?auto_499638 ) ) ( not ( = ?auto_499629 ?auto_499641 ) ) ( not ( = ?auto_499630 ?auto_499631 ) ) ( not ( = ?auto_499630 ?auto_499632 ) ) ( not ( = ?auto_499630 ?auto_499633 ) ) ( not ( = ?auto_499630 ?auto_499634 ) ) ( not ( = ?auto_499630 ?auto_499635 ) ) ( not ( = ?auto_499630 ?auto_499636 ) ) ( not ( = ?auto_499630 ?auto_499637 ) ) ( not ( = ?auto_499630 ?auto_499638 ) ) ( not ( = ?auto_499630 ?auto_499641 ) ) ( not ( = ?auto_499631 ?auto_499632 ) ) ( not ( = ?auto_499631 ?auto_499633 ) ) ( not ( = ?auto_499631 ?auto_499634 ) ) ( not ( = ?auto_499631 ?auto_499635 ) ) ( not ( = ?auto_499631 ?auto_499636 ) ) ( not ( = ?auto_499631 ?auto_499637 ) ) ( not ( = ?auto_499631 ?auto_499638 ) ) ( not ( = ?auto_499631 ?auto_499641 ) ) ( not ( = ?auto_499632 ?auto_499633 ) ) ( not ( = ?auto_499632 ?auto_499634 ) ) ( not ( = ?auto_499632 ?auto_499635 ) ) ( not ( = ?auto_499632 ?auto_499636 ) ) ( not ( = ?auto_499632 ?auto_499637 ) ) ( not ( = ?auto_499632 ?auto_499638 ) ) ( not ( = ?auto_499632 ?auto_499641 ) ) ( not ( = ?auto_499633 ?auto_499634 ) ) ( not ( = ?auto_499633 ?auto_499635 ) ) ( not ( = ?auto_499633 ?auto_499636 ) ) ( not ( = ?auto_499633 ?auto_499637 ) ) ( not ( = ?auto_499633 ?auto_499638 ) ) ( not ( = ?auto_499633 ?auto_499641 ) ) ( not ( = ?auto_499634 ?auto_499635 ) ) ( not ( = ?auto_499634 ?auto_499636 ) ) ( not ( = ?auto_499634 ?auto_499637 ) ) ( not ( = ?auto_499634 ?auto_499638 ) ) ( not ( = ?auto_499634 ?auto_499641 ) ) ( not ( = ?auto_499635 ?auto_499636 ) ) ( not ( = ?auto_499635 ?auto_499637 ) ) ( not ( = ?auto_499635 ?auto_499638 ) ) ( not ( = ?auto_499635 ?auto_499641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499636 ?auto_499637 ?auto_499638 )
      ( MAKE-10CRATE-VERIFY ?auto_499628 ?auto_499629 ?auto_499630 ?auto_499631 ?auto_499632 ?auto_499633 ?auto_499634 ?auto_499635 ?auto_499636 ?auto_499637 ?auto_499638 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499754 - SURFACE
      ?auto_499755 - SURFACE
      ?auto_499756 - SURFACE
      ?auto_499757 - SURFACE
      ?auto_499758 - SURFACE
      ?auto_499759 - SURFACE
      ?auto_499760 - SURFACE
      ?auto_499761 - SURFACE
      ?auto_499762 - SURFACE
      ?auto_499763 - SURFACE
      ?auto_499764 - SURFACE
    )
    :vars
    (
      ?auto_499770 - HOIST
      ?auto_499765 - PLACE
      ?auto_499768 - PLACE
      ?auto_499767 - HOIST
      ?auto_499769 - SURFACE
      ?auto_499766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499770 ?auto_499765 ) ( IS-CRATE ?auto_499764 ) ( not ( = ?auto_499763 ?auto_499764 ) ) ( not ( = ?auto_499762 ?auto_499763 ) ) ( not ( = ?auto_499762 ?auto_499764 ) ) ( not ( = ?auto_499768 ?auto_499765 ) ) ( HOIST-AT ?auto_499767 ?auto_499768 ) ( not ( = ?auto_499770 ?auto_499767 ) ) ( AVAILABLE ?auto_499767 ) ( SURFACE-AT ?auto_499764 ?auto_499768 ) ( ON ?auto_499764 ?auto_499769 ) ( CLEAR ?auto_499764 ) ( not ( = ?auto_499763 ?auto_499769 ) ) ( not ( = ?auto_499764 ?auto_499769 ) ) ( not ( = ?auto_499762 ?auto_499769 ) ) ( TRUCK-AT ?auto_499766 ?auto_499765 ) ( SURFACE-AT ?auto_499762 ?auto_499765 ) ( CLEAR ?auto_499762 ) ( IS-CRATE ?auto_499763 ) ( AVAILABLE ?auto_499770 ) ( IN ?auto_499763 ?auto_499766 ) ( ON ?auto_499755 ?auto_499754 ) ( ON ?auto_499756 ?auto_499755 ) ( ON ?auto_499757 ?auto_499756 ) ( ON ?auto_499758 ?auto_499757 ) ( ON ?auto_499759 ?auto_499758 ) ( ON ?auto_499760 ?auto_499759 ) ( ON ?auto_499761 ?auto_499760 ) ( ON ?auto_499762 ?auto_499761 ) ( not ( = ?auto_499754 ?auto_499755 ) ) ( not ( = ?auto_499754 ?auto_499756 ) ) ( not ( = ?auto_499754 ?auto_499757 ) ) ( not ( = ?auto_499754 ?auto_499758 ) ) ( not ( = ?auto_499754 ?auto_499759 ) ) ( not ( = ?auto_499754 ?auto_499760 ) ) ( not ( = ?auto_499754 ?auto_499761 ) ) ( not ( = ?auto_499754 ?auto_499762 ) ) ( not ( = ?auto_499754 ?auto_499763 ) ) ( not ( = ?auto_499754 ?auto_499764 ) ) ( not ( = ?auto_499754 ?auto_499769 ) ) ( not ( = ?auto_499755 ?auto_499756 ) ) ( not ( = ?auto_499755 ?auto_499757 ) ) ( not ( = ?auto_499755 ?auto_499758 ) ) ( not ( = ?auto_499755 ?auto_499759 ) ) ( not ( = ?auto_499755 ?auto_499760 ) ) ( not ( = ?auto_499755 ?auto_499761 ) ) ( not ( = ?auto_499755 ?auto_499762 ) ) ( not ( = ?auto_499755 ?auto_499763 ) ) ( not ( = ?auto_499755 ?auto_499764 ) ) ( not ( = ?auto_499755 ?auto_499769 ) ) ( not ( = ?auto_499756 ?auto_499757 ) ) ( not ( = ?auto_499756 ?auto_499758 ) ) ( not ( = ?auto_499756 ?auto_499759 ) ) ( not ( = ?auto_499756 ?auto_499760 ) ) ( not ( = ?auto_499756 ?auto_499761 ) ) ( not ( = ?auto_499756 ?auto_499762 ) ) ( not ( = ?auto_499756 ?auto_499763 ) ) ( not ( = ?auto_499756 ?auto_499764 ) ) ( not ( = ?auto_499756 ?auto_499769 ) ) ( not ( = ?auto_499757 ?auto_499758 ) ) ( not ( = ?auto_499757 ?auto_499759 ) ) ( not ( = ?auto_499757 ?auto_499760 ) ) ( not ( = ?auto_499757 ?auto_499761 ) ) ( not ( = ?auto_499757 ?auto_499762 ) ) ( not ( = ?auto_499757 ?auto_499763 ) ) ( not ( = ?auto_499757 ?auto_499764 ) ) ( not ( = ?auto_499757 ?auto_499769 ) ) ( not ( = ?auto_499758 ?auto_499759 ) ) ( not ( = ?auto_499758 ?auto_499760 ) ) ( not ( = ?auto_499758 ?auto_499761 ) ) ( not ( = ?auto_499758 ?auto_499762 ) ) ( not ( = ?auto_499758 ?auto_499763 ) ) ( not ( = ?auto_499758 ?auto_499764 ) ) ( not ( = ?auto_499758 ?auto_499769 ) ) ( not ( = ?auto_499759 ?auto_499760 ) ) ( not ( = ?auto_499759 ?auto_499761 ) ) ( not ( = ?auto_499759 ?auto_499762 ) ) ( not ( = ?auto_499759 ?auto_499763 ) ) ( not ( = ?auto_499759 ?auto_499764 ) ) ( not ( = ?auto_499759 ?auto_499769 ) ) ( not ( = ?auto_499760 ?auto_499761 ) ) ( not ( = ?auto_499760 ?auto_499762 ) ) ( not ( = ?auto_499760 ?auto_499763 ) ) ( not ( = ?auto_499760 ?auto_499764 ) ) ( not ( = ?auto_499760 ?auto_499769 ) ) ( not ( = ?auto_499761 ?auto_499762 ) ) ( not ( = ?auto_499761 ?auto_499763 ) ) ( not ( = ?auto_499761 ?auto_499764 ) ) ( not ( = ?auto_499761 ?auto_499769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499762 ?auto_499763 ?auto_499764 )
      ( MAKE-10CRATE-VERIFY ?auto_499754 ?auto_499755 ?auto_499756 ?auto_499757 ?auto_499758 ?auto_499759 ?auto_499760 ?auto_499761 ?auto_499762 ?auto_499763 ?auto_499764 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507018 - SURFACE
      ?auto_507019 - SURFACE
      ?auto_507020 - SURFACE
      ?auto_507021 - SURFACE
      ?auto_507022 - SURFACE
      ?auto_507023 - SURFACE
      ?auto_507024 - SURFACE
      ?auto_507025 - SURFACE
      ?auto_507026 - SURFACE
      ?auto_507027 - SURFACE
      ?auto_507028 - SURFACE
      ?auto_507029 - SURFACE
    )
    :vars
    (
      ?auto_507031 - HOIST
      ?auto_507030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507031 ?auto_507030 ) ( SURFACE-AT ?auto_507028 ?auto_507030 ) ( CLEAR ?auto_507028 ) ( LIFTING ?auto_507031 ?auto_507029 ) ( IS-CRATE ?auto_507029 ) ( not ( = ?auto_507028 ?auto_507029 ) ) ( ON ?auto_507019 ?auto_507018 ) ( ON ?auto_507020 ?auto_507019 ) ( ON ?auto_507021 ?auto_507020 ) ( ON ?auto_507022 ?auto_507021 ) ( ON ?auto_507023 ?auto_507022 ) ( ON ?auto_507024 ?auto_507023 ) ( ON ?auto_507025 ?auto_507024 ) ( ON ?auto_507026 ?auto_507025 ) ( ON ?auto_507027 ?auto_507026 ) ( ON ?auto_507028 ?auto_507027 ) ( not ( = ?auto_507018 ?auto_507019 ) ) ( not ( = ?auto_507018 ?auto_507020 ) ) ( not ( = ?auto_507018 ?auto_507021 ) ) ( not ( = ?auto_507018 ?auto_507022 ) ) ( not ( = ?auto_507018 ?auto_507023 ) ) ( not ( = ?auto_507018 ?auto_507024 ) ) ( not ( = ?auto_507018 ?auto_507025 ) ) ( not ( = ?auto_507018 ?auto_507026 ) ) ( not ( = ?auto_507018 ?auto_507027 ) ) ( not ( = ?auto_507018 ?auto_507028 ) ) ( not ( = ?auto_507018 ?auto_507029 ) ) ( not ( = ?auto_507019 ?auto_507020 ) ) ( not ( = ?auto_507019 ?auto_507021 ) ) ( not ( = ?auto_507019 ?auto_507022 ) ) ( not ( = ?auto_507019 ?auto_507023 ) ) ( not ( = ?auto_507019 ?auto_507024 ) ) ( not ( = ?auto_507019 ?auto_507025 ) ) ( not ( = ?auto_507019 ?auto_507026 ) ) ( not ( = ?auto_507019 ?auto_507027 ) ) ( not ( = ?auto_507019 ?auto_507028 ) ) ( not ( = ?auto_507019 ?auto_507029 ) ) ( not ( = ?auto_507020 ?auto_507021 ) ) ( not ( = ?auto_507020 ?auto_507022 ) ) ( not ( = ?auto_507020 ?auto_507023 ) ) ( not ( = ?auto_507020 ?auto_507024 ) ) ( not ( = ?auto_507020 ?auto_507025 ) ) ( not ( = ?auto_507020 ?auto_507026 ) ) ( not ( = ?auto_507020 ?auto_507027 ) ) ( not ( = ?auto_507020 ?auto_507028 ) ) ( not ( = ?auto_507020 ?auto_507029 ) ) ( not ( = ?auto_507021 ?auto_507022 ) ) ( not ( = ?auto_507021 ?auto_507023 ) ) ( not ( = ?auto_507021 ?auto_507024 ) ) ( not ( = ?auto_507021 ?auto_507025 ) ) ( not ( = ?auto_507021 ?auto_507026 ) ) ( not ( = ?auto_507021 ?auto_507027 ) ) ( not ( = ?auto_507021 ?auto_507028 ) ) ( not ( = ?auto_507021 ?auto_507029 ) ) ( not ( = ?auto_507022 ?auto_507023 ) ) ( not ( = ?auto_507022 ?auto_507024 ) ) ( not ( = ?auto_507022 ?auto_507025 ) ) ( not ( = ?auto_507022 ?auto_507026 ) ) ( not ( = ?auto_507022 ?auto_507027 ) ) ( not ( = ?auto_507022 ?auto_507028 ) ) ( not ( = ?auto_507022 ?auto_507029 ) ) ( not ( = ?auto_507023 ?auto_507024 ) ) ( not ( = ?auto_507023 ?auto_507025 ) ) ( not ( = ?auto_507023 ?auto_507026 ) ) ( not ( = ?auto_507023 ?auto_507027 ) ) ( not ( = ?auto_507023 ?auto_507028 ) ) ( not ( = ?auto_507023 ?auto_507029 ) ) ( not ( = ?auto_507024 ?auto_507025 ) ) ( not ( = ?auto_507024 ?auto_507026 ) ) ( not ( = ?auto_507024 ?auto_507027 ) ) ( not ( = ?auto_507024 ?auto_507028 ) ) ( not ( = ?auto_507024 ?auto_507029 ) ) ( not ( = ?auto_507025 ?auto_507026 ) ) ( not ( = ?auto_507025 ?auto_507027 ) ) ( not ( = ?auto_507025 ?auto_507028 ) ) ( not ( = ?auto_507025 ?auto_507029 ) ) ( not ( = ?auto_507026 ?auto_507027 ) ) ( not ( = ?auto_507026 ?auto_507028 ) ) ( not ( = ?auto_507026 ?auto_507029 ) ) ( not ( = ?auto_507027 ?auto_507028 ) ) ( not ( = ?auto_507027 ?auto_507029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_507028 ?auto_507029 )
      ( MAKE-11CRATE-VERIFY ?auto_507018 ?auto_507019 ?auto_507020 ?auto_507021 ?auto_507022 ?auto_507023 ?auto_507024 ?auto_507025 ?auto_507026 ?auto_507027 ?auto_507028 ?auto_507029 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507127 - SURFACE
      ?auto_507128 - SURFACE
      ?auto_507129 - SURFACE
      ?auto_507130 - SURFACE
      ?auto_507131 - SURFACE
      ?auto_507132 - SURFACE
      ?auto_507133 - SURFACE
      ?auto_507134 - SURFACE
      ?auto_507135 - SURFACE
      ?auto_507136 - SURFACE
      ?auto_507137 - SURFACE
      ?auto_507138 - SURFACE
    )
    :vars
    (
      ?auto_507140 - HOIST
      ?auto_507141 - PLACE
      ?auto_507139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507140 ?auto_507141 ) ( SURFACE-AT ?auto_507137 ?auto_507141 ) ( CLEAR ?auto_507137 ) ( IS-CRATE ?auto_507138 ) ( not ( = ?auto_507137 ?auto_507138 ) ) ( TRUCK-AT ?auto_507139 ?auto_507141 ) ( AVAILABLE ?auto_507140 ) ( IN ?auto_507138 ?auto_507139 ) ( ON ?auto_507137 ?auto_507136 ) ( not ( = ?auto_507136 ?auto_507137 ) ) ( not ( = ?auto_507136 ?auto_507138 ) ) ( ON ?auto_507128 ?auto_507127 ) ( ON ?auto_507129 ?auto_507128 ) ( ON ?auto_507130 ?auto_507129 ) ( ON ?auto_507131 ?auto_507130 ) ( ON ?auto_507132 ?auto_507131 ) ( ON ?auto_507133 ?auto_507132 ) ( ON ?auto_507134 ?auto_507133 ) ( ON ?auto_507135 ?auto_507134 ) ( ON ?auto_507136 ?auto_507135 ) ( not ( = ?auto_507127 ?auto_507128 ) ) ( not ( = ?auto_507127 ?auto_507129 ) ) ( not ( = ?auto_507127 ?auto_507130 ) ) ( not ( = ?auto_507127 ?auto_507131 ) ) ( not ( = ?auto_507127 ?auto_507132 ) ) ( not ( = ?auto_507127 ?auto_507133 ) ) ( not ( = ?auto_507127 ?auto_507134 ) ) ( not ( = ?auto_507127 ?auto_507135 ) ) ( not ( = ?auto_507127 ?auto_507136 ) ) ( not ( = ?auto_507127 ?auto_507137 ) ) ( not ( = ?auto_507127 ?auto_507138 ) ) ( not ( = ?auto_507128 ?auto_507129 ) ) ( not ( = ?auto_507128 ?auto_507130 ) ) ( not ( = ?auto_507128 ?auto_507131 ) ) ( not ( = ?auto_507128 ?auto_507132 ) ) ( not ( = ?auto_507128 ?auto_507133 ) ) ( not ( = ?auto_507128 ?auto_507134 ) ) ( not ( = ?auto_507128 ?auto_507135 ) ) ( not ( = ?auto_507128 ?auto_507136 ) ) ( not ( = ?auto_507128 ?auto_507137 ) ) ( not ( = ?auto_507128 ?auto_507138 ) ) ( not ( = ?auto_507129 ?auto_507130 ) ) ( not ( = ?auto_507129 ?auto_507131 ) ) ( not ( = ?auto_507129 ?auto_507132 ) ) ( not ( = ?auto_507129 ?auto_507133 ) ) ( not ( = ?auto_507129 ?auto_507134 ) ) ( not ( = ?auto_507129 ?auto_507135 ) ) ( not ( = ?auto_507129 ?auto_507136 ) ) ( not ( = ?auto_507129 ?auto_507137 ) ) ( not ( = ?auto_507129 ?auto_507138 ) ) ( not ( = ?auto_507130 ?auto_507131 ) ) ( not ( = ?auto_507130 ?auto_507132 ) ) ( not ( = ?auto_507130 ?auto_507133 ) ) ( not ( = ?auto_507130 ?auto_507134 ) ) ( not ( = ?auto_507130 ?auto_507135 ) ) ( not ( = ?auto_507130 ?auto_507136 ) ) ( not ( = ?auto_507130 ?auto_507137 ) ) ( not ( = ?auto_507130 ?auto_507138 ) ) ( not ( = ?auto_507131 ?auto_507132 ) ) ( not ( = ?auto_507131 ?auto_507133 ) ) ( not ( = ?auto_507131 ?auto_507134 ) ) ( not ( = ?auto_507131 ?auto_507135 ) ) ( not ( = ?auto_507131 ?auto_507136 ) ) ( not ( = ?auto_507131 ?auto_507137 ) ) ( not ( = ?auto_507131 ?auto_507138 ) ) ( not ( = ?auto_507132 ?auto_507133 ) ) ( not ( = ?auto_507132 ?auto_507134 ) ) ( not ( = ?auto_507132 ?auto_507135 ) ) ( not ( = ?auto_507132 ?auto_507136 ) ) ( not ( = ?auto_507132 ?auto_507137 ) ) ( not ( = ?auto_507132 ?auto_507138 ) ) ( not ( = ?auto_507133 ?auto_507134 ) ) ( not ( = ?auto_507133 ?auto_507135 ) ) ( not ( = ?auto_507133 ?auto_507136 ) ) ( not ( = ?auto_507133 ?auto_507137 ) ) ( not ( = ?auto_507133 ?auto_507138 ) ) ( not ( = ?auto_507134 ?auto_507135 ) ) ( not ( = ?auto_507134 ?auto_507136 ) ) ( not ( = ?auto_507134 ?auto_507137 ) ) ( not ( = ?auto_507134 ?auto_507138 ) ) ( not ( = ?auto_507135 ?auto_507136 ) ) ( not ( = ?auto_507135 ?auto_507137 ) ) ( not ( = ?auto_507135 ?auto_507138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507136 ?auto_507137 ?auto_507138 )
      ( MAKE-11CRATE-VERIFY ?auto_507127 ?auto_507128 ?auto_507129 ?auto_507130 ?auto_507131 ?auto_507132 ?auto_507133 ?auto_507134 ?auto_507135 ?auto_507136 ?auto_507137 ?auto_507138 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507248 - SURFACE
      ?auto_507249 - SURFACE
      ?auto_507250 - SURFACE
      ?auto_507251 - SURFACE
      ?auto_507252 - SURFACE
      ?auto_507253 - SURFACE
      ?auto_507254 - SURFACE
      ?auto_507255 - SURFACE
      ?auto_507256 - SURFACE
      ?auto_507257 - SURFACE
      ?auto_507258 - SURFACE
      ?auto_507259 - SURFACE
    )
    :vars
    (
      ?auto_507263 - HOIST
      ?auto_507261 - PLACE
      ?auto_507262 - TRUCK
      ?auto_507260 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507263 ?auto_507261 ) ( SURFACE-AT ?auto_507258 ?auto_507261 ) ( CLEAR ?auto_507258 ) ( IS-CRATE ?auto_507259 ) ( not ( = ?auto_507258 ?auto_507259 ) ) ( AVAILABLE ?auto_507263 ) ( IN ?auto_507259 ?auto_507262 ) ( ON ?auto_507258 ?auto_507257 ) ( not ( = ?auto_507257 ?auto_507258 ) ) ( not ( = ?auto_507257 ?auto_507259 ) ) ( TRUCK-AT ?auto_507262 ?auto_507260 ) ( not ( = ?auto_507260 ?auto_507261 ) ) ( ON ?auto_507249 ?auto_507248 ) ( ON ?auto_507250 ?auto_507249 ) ( ON ?auto_507251 ?auto_507250 ) ( ON ?auto_507252 ?auto_507251 ) ( ON ?auto_507253 ?auto_507252 ) ( ON ?auto_507254 ?auto_507253 ) ( ON ?auto_507255 ?auto_507254 ) ( ON ?auto_507256 ?auto_507255 ) ( ON ?auto_507257 ?auto_507256 ) ( not ( = ?auto_507248 ?auto_507249 ) ) ( not ( = ?auto_507248 ?auto_507250 ) ) ( not ( = ?auto_507248 ?auto_507251 ) ) ( not ( = ?auto_507248 ?auto_507252 ) ) ( not ( = ?auto_507248 ?auto_507253 ) ) ( not ( = ?auto_507248 ?auto_507254 ) ) ( not ( = ?auto_507248 ?auto_507255 ) ) ( not ( = ?auto_507248 ?auto_507256 ) ) ( not ( = ?auto_507248 ?auto_507257 ) ) ( not ( = ?auto_507248 ?auto_507258 ) ) ( not ( = ?auto_507248 ?auto_507259 ) ) ( not ( = ?auto_507249 ?auto_507250 ) ) ( not ( = ?auto_507249 ?auto_507251 ) ) ( not ( = ?auto_507249 ?auto_507252 ) ) ( not ( = ?auto_507249 ?auto_507253 ) ) ( not ( = ?auto_507249 ?auto_507254 ) ) ( not ( = ?auto_507249 ?auto_507255 ) ) ( not ( = ?auto_507249 ?auto_507256 ) ) ( not ( = ?auto_507249 ?auto_507257 ) ) ( not ( = ?auto_507249 ?auto_507258 ) ) ( not ( = ?auto_507249 ?auto_507259 ) ) ( not ( = ?auto_507250 ?auto_507251 ) ) ( not ( = ?auto_507250 ?auto_507252 ) ) ( not ( = ?auto_507250 ?auto_507253 ) ) ( not ( = ?auto_507250 ?auto_507254 ) ) ( not ( = ?auto_507250 ?auto_507255 ) ) ( not ( = ?auto_507250 ?auto_507256 ) ) ( not ( = ?auto_507250 ?auto_507257 ) ) ( not ( = ?auto_507250 ?auto_507258 ) ) ( not ( = ?auto_507250 ?auto_507259 ) ) ( not ( = ?auto_507251 ?auto_507252 ) ) ( not ( = ?auto_507251 ?auto_507253 ) ) ( not ( = ?auto_507251 ?auto_507254 ) ) ( not ( = ?auto_507251 ?auto_507255 ) ) ( not ( = ?auto_507251 ?auto_507256 ) ) ( not ( = ?auto_507251 ?auto_507257 ) ) ( not ( = ?auto_507251 ?auto_507258 ) ) ( not ( = ?auto_507251 ?auto_507259 ) ) ( not ( = ?auto_507252 ?auto_507253 ) ) ( not ( = ?auto_507252 ?auto_507254 ) ) ( not ( = ?auto_507252 ?auto_507255 ) ) ( not ( = ?auto_507252 ?auto_507256 ) ) ( not ( = ?auto_507252 ?auto_507257 ) ) ( not ( = ?auto_507252 ?auto_507258 ) ) ( not ( = ?auto_507252 ?auto_507259 ) ) ( not ( = ?auto_507253 ?auto_507254 ) ) ( not ( = ?auto_507253 ?auto_507255 ) ) ( not ( = ?auto_507253 ?auto_507256 ) ) ( not ( = ?auto_507253 ?auto_507257 ) ) ( not ( = ?auto_507253 ?auto_507258 ) ) ( not ( = ?auto_507253 ?auto_507259 ) ) ( not ( = ?auto_507254 ?auto_507255 ) ) ( not ( = ?auto_507254 ?auto_507256 ) ) ( not ( = ?auto_507254 ?auto_507257 ) ) ( not ( = ?auto_507254 ?auto_507258 ) ) ( not ( = ?auto_507254 ?auto_507259 ) ) ( not ( = ?auto_507255 ?auto_507256 ) ) ( not ( = ?auto_507255 ?auto_507257 ) ) ( not ( = ?auto_507255 ?auto_507258 ) ) ( not ( = ?auto_507255 ?auto_507259 ) ) ( not ( = ?auto_507256 ?auto_507257 ) ) ( not ( = ?auto_507256 ?auto_507258 ) ) ( not ( = ?auto_507256 ?auto_507259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507257 ?auto_507258 ?auto_507259 )
      ( MAKE-11CRATE-VERIFY ?auto_507248 ?auto_507249 ?auto_507250 ?auto_507251 ?auto_507252 ?auto_507253 ?auto_507254 ?auto_507255 ?auto_507256 ?auto_507257 ?auto_507258 ?auto_507259 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507380 - SURFACE
      ?auto_507381 - SURFACE
      ?auto_507382 - SURFACE
      ?auto_507383 - SURFACE
      ?auto_507384 - SURFACE
      ?auto_507385 - SURFACE
      ?auto_507386 - SURFACE
      ?auto_507387 - SURFACE
      ?auto_507388 - SURFACE
      ?auto_507389 - SURFACE
      ?auto_507390 - SURFACE
      ?auto_507391 - SURFACE
    )
    :vars
    (
      ?auto_507394 - HOIST
      ?auto_507396 - PLACE
      ?auto_507393 - TRUCK
      ?auto_507392 - PLACE
      ?auto_507395 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_507394 ?auto_507396 ) ( SURFACE-AT ?auto_507390 ?auto_507396 ) ( CLEAR ?auto_507390 ) ( IS-CRATE ?auto_507391 ) ( not ( = ?auto_507390 ?auto_507391 ) ) ( AVAILABLE ?auto_507394 ) ( ON ?auto_507390 ?auto_507389 ) ( not ( = ?auto_507389 ?auto_507390 ) ) ( not ( = ?auto_507389 ?auto_507391 ) ) ( TRUCK-AT ?auto_507393 ?auto_507392 ) ( not ( = ?auto_507392 ?auto_507396 ) ) ( HOIST-AT ?auto_507395 ?auto_507392 ) ( LIFTING ?auto_507395 ?auto_507391 ) ( not ( = ?auto_507394 ?auto_507395 ) ) ( ON ?auto_507381 ?auto_507380 ) ( ON ?auto_507382 ?auto_507381 ) ( ON ?auto_507383 ?auto_507382 ) ( ON ?auto_507384 ?auto_507383 ) ( ON ?auto_507385 ?auto_507384 ) ( ON ?auto_507386 ?auto_507385 ) ( ON ?auto_507387 ?auto_507386 ) ( ON ?auto_507388 ?auto_507387 ) ( ON ?auto_507389 ?auto_507388 ) ( not ( = ?auto_507380 ?auto_507381 ) ) ( not ( = ?auto_507380 ?auto_507382 ) ) ( not ( = ?auto_507380 ?auto_507383 ) ) ( not ( = ?auto_507380 ?auto_507384 ) ) ( not ( = ?auto_507380 ?auto_507385 ) ) ( not ( = ?auto_507380 ?auto_507386 ) ) ( not ( = ?auto_507380 ?auto_507387 ) ) ( not ( = ?auto_507380 ?auto_507388 ) ) ( not ( = ?auto_507380 ?auto_507389 ) ) ( not ( = ?auto_507380 ?auto_507390 ) ) ( not ( = ?auto_507380 ?auto_507391 ) ) ( not ( = ?auto_507381 ?auto_507382 ) ) ( not ( = ?auto_507381 ?auto_507383 ) ) ( not ( = ?auto_507381 ?auto_507384 ) ) ( not ( = ?auto_507381 ?auto_507385 ) ) ( not ( = ?auto_507381 ?auto_507386 ) ) ( not ( = ?auto_507381 ?auto_507387 ) ) ( not ( = ?auto_507381 ?auto_507388 ) ) ( not ( = ?auto_507381 ?auto_507389 ) ) ( not ( = ?auto_507381 ?auto_507390 ) ) ( not ( = ?auto_507381 ?auto_507391 ) ) ( not ( = ?auto_507382 ?auto_507383 ) ) ( not ( = ?auto_507382 ?auto_507384 ) ) ( not ( = ?auto_507382 ?auto_507385 ) ) ( not ( = ?auto_507382 ?auto_507386 ) ) ( not ( = ?auto_507382 ?auto_507387 ) ) ( not ( = ?auto_507382 ?auto_507388 ) ) ( not ( = ?auto_507382 ?auto_507389 ) ) ( not ( = ?auto_507382 ?auto_507390 ) ) ( not ( = ?auto_507382 ?auto_507391 ) ) ( not ( = ?auto_507383 ?auto_507384 ) ) ( not ( = ?auto_507383 ?auto_507385 ) ) ( not ( = ?auto_507383 ?auto_507386 ) ) ( not ( = ?auto_507383 ?auto_507387 ) ) ( not ( = ?auto_507383 ?auto_507388 ) ) ( not ( = ?auto_507383 ?auto_507389 ) ) ( not ( = ?auto_507383 ?auto_507390 ) ) ( not ( = ?auto_507383 ?auto_507391 ) ) ( not ( = ?auto_507384 ?auto_507385 ) ) ( not ( = ?auto_507384 ?auto_507386 ) ) ( not ( = ?auto_507384 ?auto_507387 ) ) ( not ( = ?auto_507384 ?auto_507388 ) ) ( not ( = ?auto_507384 ?auto_507389 ) ) ( not ( = ?auto_507384 ?auto_507390 ) ) ( not ( = ?auto_507384 ?auto_507391 ) ) ( not ( = ?auto_507385 ?auto_507386 ) ) ( not ( = ?auto_507385 ?auto_507387 ) ) ( not ( = ?auto_507385 ?auto_507388 ) ) ( not ( = ?auto_507385 ?auto_507389 ) ) ( not ( = ?auto_507385 ?auto_507390 ) ) ( not ( = ?auto_507385 ?auto_507391 ) ) ( not ( = ?auto_507386 ?auto_507387 ) ) ( not ( = ?auto_507386 ?auto_507388 ) ) ( not ( = ?auto_507386 ?auto_507389 ) ) ( not ( = ?auto_507386 ?auto_507390 ) ) ( not ( = ?auto_507386 ?auto_507391 ) ) ( not ( = ?auto_507387 ?auto_507388 ) ) ( not ( = ?auto_507387 ?auto_507389 ) ) ( not ( = ?auto_507387 ?auto_507390 ) ) ( not ( = ?auto_507387 ?auto_507391 ) ) ( not ( = ?auto_507388 ?auto_507389 ) ) ( not ( = ?auto_507388 ?auto_507390 ) ) ( not ( = ?auto_507388 ?auto_507391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507389 ?auto_507390 ?auto_507391 )
      ( MAKE-11CRATE-VERIFY ?auto_507380 ?auto_507381 ?auto_507382 ?auto_507383 ?auto_507384 ?auto_507385 ?auto_507386 ?auto_507387 ?auto_507388 ?auto_507389 ?auto_507390 ?auto_507391 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507523 - SURFACE
      ?auto_507524 - SURFACE
      ?auto_507525 - SURFACE
      ?auto_507526 - SURFACE
      ?auto_507527 - SURFACE
      ?auto_507528 - SURFACE
      ?auto_507529 - SURFACE
      ?auto_507530 - SURFACE
      ?auto_507531 - SURFACE
      ?auto_507532 - SURFACE
      ?auto_507533 - SURFACE
      ?auto_507534 - SURFACE
    )
    :vars
    (
      ?auto_507540 - HOIST
      ?auto_507538 - PLACE
      ?auto_507536 - TRUCK
      ?auto_507539 - PLACE
      ?auto_507535 - HOIST
      ?auto_507537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507540 ?auto_507538 ) ( SURFACE-AT ?auto_507533 ?auto_507538 ) ( CLEAR ?auto_507533 ) ( IS-CRATE ?auto_507534 ) ( not ( = ?auto_507533 ?auto_507534 ) ) ( AVAILABLE ?auto_507540 ) ( ON ?auto_507533 ?auto_507532 ) ( not ( = ?auto_507532 ?auto_507533 ) ) ( not ( = ?auto_507532 ?auto_507534 ) ) ( TRUCK-AT ?auto_507536 ?auto_507539 ) ( not ( = ?auto_507539 ?auto_507538 ) ) ( HOIST-AT ?auto_507535 ?auto_507539 ) ( not ( = ?auto_507540 ?auto_507535 ) ) ( AVAILABLE ?auto_507535 ) ( SURFACE-AT ?auto_507534 ?auto_507539 ) ( ON ?auto_507534 ?auto_507537 ) ( CLEAR ?auto_507534 ) ( not ( = ?auto_507533 ?auto_507537 ) ) ( not ( = ?auto_507534 ?auto_507537 ) ) ( not ( = ?auto_507532 ?auto_507537 ) ) ( ON ?auto_507524 ?auto_507523 ) ( ON ?auto_507525 ?auto_507524 ) ( ON ?auto_507526 ?auto_507525 ) ( ON ?auto_507527 ?auto_507526 ) ( ON ?auto_507528 ?auto_507527 ) ( ON ?auto_507529 ?auto_507528 ) ( ON ?auto_507530 ?auto_507529 ) ( ON ?auto_507531 ?auto_507530 ) ( ON ?auto_507532 ?auto_507531 ) ( not ( = ?auto_507523 ?auto_507524 ) ) ( not ( = ?auto_507523 ?auto_507525 ) ) ( not ( = ?auto_507523 ?auto_507526 ) ) ( not ( = ?auto_507523 ?auto_507527 ) ) ( not ( = ?auto_507523 ?auto_507528 ) ) ( not ( = ?auto_507523 ?auto_507529 ) ) ( not ( = ?auto_507523 ?auto_507530 ) ) ( not ( = ?auto_507523 ?auto_507531 ) ) ( not ( = ?auto_507523 ?auto_507532 ) ) ( not ( = ?auto_507523 ?auto_507533 ) ) ( not ( = ?auto_507523 ?auto_507534 ) ) ( not ( = ?auto_507523 ?auto_507537 ) ) ( not ( = ?auto_507524 ?auto_507525 ) ) ( not ( = ?auto_507524 ?auto_507526 ) ) ( not ( = ?auto_507524 ?auto_507527 ) ) ( not ( = ?auto_507524 ?auto_507528 ) ) ( not ( = ?auto_507524 ?auto_507529 ) ) ( not ( = ?auto_507524 ?auto_507530 ) ) ( not ( = ?auto_507524 ?auto_507531 ) ) ( not ( = ?auto_507524 ?auto_507532 ) ) ( not ( = ?auto_507524 ?auto_507533 ) ) ( not ( = ?auto_507524 ?auto_507534 ) ) ( not ( = ?auto_507524 ?auto_507537 ) ) ( not ( = ?auto_507525 ?auto_507526 ) ) ( not ( = ?auto_507525 ?auto_507527 ) ) ( not ( = ?auto_507525 ?auto_507528 ) ) ( not ( = ?auto_507525 ?auto_507529 ) ) ( not ( = ?auto_507525 ?auto_507530 ) ) ( not ( = ?auto_507525 ?auto_507531 ) ) ( not ( = ?auto_507525 ?auto_507532 ) ) ( not ( = ?auto_507525 ?auto_507533 ) ) ( not ( = ?auto_507525 ?auto_507534 ) ) ( not ( = ?auto_507525 ?auto_507537 ) ) ( not ( = ?auto_507526 ?auto_507527 ) ) ( not ( = ?auto_507526 ?auto_507528 ) ) ( not ( = ?auto_507526 ?auto_507529 ) ) ( not ( = ?auto_507526 ?auto_507530 ) ) ( not ( = ?auto_507526 ?auto_507531 ) ) ( not ( = ?auto_507526 ?auto_507532 ) ) ( not ( = ?auto_507526 ?auto_507533 ) ) ( not ( = ?auto_507526 ?auto_507534 ) ) ( not ( = ?auto_507526 ?auto_507537 ) ) ( not ( = ?auto_507527 ?auto_507528 ) ) ( not ( = ?auto_507527 ?auto_507529 ) ) ( not ( = ?auto_507527 ?auto_507530 ) ) ( not ( = ?auto_507527 ?auto_507531 ) ) ( not ( = ?auto_507527 ?auto_507532 ) ) ( not ( = ?auto_507527 ?auto_507533 ) ) ( not ( = ?auto_507527 ?auto_507534 ) ) ( not ( = ?auto_507527 ?auto_507537 ) ) ( not ( = ?auto_507528 ?auto_507529 ) ) ( not ( = ?auto_507528 ?auto_507530 ) ) ( not ( = ?auto_507528 ?auto_507531 ) ) ( not ( = ?auto_507528 ?auto_507532 ) ) ( not ( = ?auto_507528 ?auto_507533 ) ) ( not ( = ?auto_507528 ?auto_507534 ) ) ( not ( = ?auto_507528 ?auto_507537 ) ) ( not ( = ?auto_507529 ?auto_507530 ) ) ( not ( = ?auto_507529 ?auto_507531 ) ) ( not ( = ?auto_507529 ?auto_507532 ) ) ( not ( = ?auto_507529 ?auto_507533 ) ) ( not ( = ?auto_507529 ?auto_507534 ) ) ( not ( = ?auto_507529 ?auto_507537 ) ) ( not ( = ?auto_507530 ?auto_507531 ) ) ( not ( = ?auto_507530 ?auto_507532 ) ) ( not ( = ?auto_507530 ?auto_507533 ) ) ( not ( = ?auto_507530 ?auto_507534 ) ) ( not ( = ?auto_507530 ?auto_507537 ) ) ( not ( = ?auto_507531 ?auto_507532 ) ) ( not ( = ?auto_507531 ?auto_507533 ) ) ( not ( = ?auto_507531 ?auto_507534 ) ) ( not ( = ?auto_507531 ?auto_507537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507532 ?auto_507533 ?auto_507534 )
      ( MAKE-11CRATE-VERIFY ?auto_507523 ?auto_507524 ?auto_507525 ?auto_507526 ?auto_507527 ?auto_507528 ?auto_507529 ?auto_507530 ?auto_507531 ?auto_507532 ?auto_507533 ?auto_507534 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507667 - SURFACE
      ?auto_507668 - SURFACE
      ?auto_507669 - SURFACE
      ?auto_507670 - SURFACE
      ?auto_507671 - SURFACE
      ?auto_507672 - SURFACE
      ?auto_507673 - SURFACE
      ?auto_507674 - SURFACE
      ?auto_507675 - SURFACE
      ?auto_507676 - SURFACE
      ?auto_507677 - SURFACE
      ?auto_507678 - SURFACE
    )
    :vars
    (
      ?auto_507683 - HOIST
      ?auto_507679 - PLACE
      ?auto_507682 - PLACE
      ?auto_507680 - HOIST
      ?auto_507681 - SURFACE
      ?auto_507684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507683 ?auto_507679 ) ( SURFACE-AT ?auto_507677 ?auto_507679 ) ( CLEAR ?auto_507677 ) ( IS-CRATE ?auto_507678 ) ( not ( = ?auto_507677 ?auto_507678 ) ) ( AVAILABLE ?auto_507683 ) ( ON ?auto_507677 ?auto_507676 ) ( not ( = ?auto_507676 ?auto_507677 ) ) ( not ( = ?auto_507676 ?auto_507678 ) ) ( not ( = ?auto_507682 ?auto_507679 ) ) ( HOIST-AT ?auto_507680 ?auto_507682 ) ( not ( = ?auto_507683 ?auto_507680 ) ) ( AVAILABLE ?auto_507680 ) ( SURFACE-AT ?auto_507678 ?auto_507682 ) ( ON ?auto_507678 ?auto_507681 ) ( CLEAR ?auto_507678 ) ( not ( = ?auto_507677 ?auto_507681 ) ) ( not ( = ?auto_507678 ?auto_507681 ) ) ( not ( = ?auto_507676 ?auto_507681 ) ) ( TRUCK-AT ?auto_507684 ?auto_507679 ) ( ON ?auto_507668 ?auto_507667 ) ( ON ?auto_507669 ?auto_507668 ) ( ON ?auto_507670 ?auto_507669 ) ( ON ?auto_507671 ?auto_507670 ) ( ON ?auto_507672 ?auto_507671 ) ( ON ?auto_507673 ?auto_507672 ) ( ON ?auto_507674 ?auto_507673 ) ( ON ?auto_507675 ?auto_507674 ) ( ON ?auto_507676 ?auto_507675 ) ( not ( = ?auto_507667 ?auto_507668 ) ) ( not ( = ?auto_507667 ?auto_507669 ) ) ( not ( = ?auto_507667 ?auto_507670 ) ) ( not ( = ?auto_507667 ?auto_507671 ) ) ( not ( = ?auto_507667 ?auto_507672 ) ) ( not ( = ?auto_507667 ?auto_507673 ) ) ( not ( = ?auto_507667 ?auto_507674 ) ) ( not ( = ?auto_507667 ?auto_507675 ) ) ( not ( = ?auto_507667 ?auto_507676 ) ) ( not ( = ?auto_507667 ?auto_507677 ) ) ( not ( = ?auto_507667 ?auto_507678 ) ) ( not ( = ?auto_507667 ?auto_507681 ) ) ( not ( = ?auto_507668 ?auto_507669 ) ) ( not ( = ?auto_507668 ?auto_507670 ) ) ( not ( = ?auto_507668 ?auto_507671 ) ) ( not ( = ?auto_507668 ?auto_507672 ) ) ( not ( = ?auto_507668 ?auto_507673 ) ) ( not ( = ?auto_507668 ?auto_507674 ) ) ( not ( = ?auto_507668 ?auto_507675 ) ) ( not ( = ?auto_507668 ?auto_507676 ) ) ( not ( = ?auto_507668 ?auto_507677 ) ) ( not ( = ?auto_507668 ?auto_507678 ) ) ( not ( = ?auto_507668 ?auto_507681 ) ) ( not ( = ?auto_507669 ?auto_507670 ) ) ( not ( = ?auto_507669 ?auto_507671 ) ) ( not ( = ?auto_507669 ?auto_507672 ) ) ( not ( = ?auto_507669 ?auto_507673 ) ) ( not ( = ?auto_507669 ?auto_507674 ) ) ( not ( = ?auto_507669 ?auto_507675 ) ) ( not ( = ?auto_507669 ?auto_507676 ) ) ( not ( = ?auto_507669 ?auto_507677 ) ) ( not ( = ?auto_507669 ?auto_507678 ) ) ( not ( = ?auto_507669 ?auto_507681 ) ) ( not ( = ?auto_507670 ?auto_507671 ) ) ( not ( = ?auto_507670 ?auto_507672 ) ) ( not ( = ?auto_507670 ?auto_507673 ) ) ( not ( = ?auto_507670 ?auto_507674 ) ) ( not ( = ?auto_507670 ?auto_507675 ) ) ( not ( = ?auto_507670 ?auto_507676 ) ) ( not ( = ?auto_507670 ?auto_507677 ) ) ( not ( = ?auto_507670 ?auto_507678 ) ) ( not ( = ?auto_507670 ?auto_507681 ) ) ( not ( = ?auto_507671 ?auto_507672 ) ) ( not ( = ?auto_507671 ?auto_507673 ) ) ( not ( = ?auto_507671 ?auto_507674 ) ) ( not ( = ?auto_507671 ?auto_507675 ) ) ( not ( = ?auto_507671 ?auto_507676 ) ) ( not ( = ?auto_507671 ?auto_507677 ) ) ( not ( = ?auto_507671 ?auto_507678 ) ) ( not ( = ?auto_507671 ?auto_507681 ) ) ( not ( = ?auto_507672 ?auto_507673 ) ) ( not ( = ?auto_507672 ?auto_507674 ) ) ( not ( = ?auto_507672 ?auto_507675 ) ) ( not ( = ?auto_507672 ?auto_507676 ) ) ( not ( = ?auto_507672 ?auto_507677 ) ) ( not ( = ?auto_507672 ?auto_507678 ) ) ( not ( = ?auto_507672 ?auto_507681 ) ) ( not ( = ?auto_507673 ?auto_507674 ) ) ( not ( = ?auto_507673 ?auto_507675 ) ) ( not ( = ?auto_507673 ?auto_507676 ) ) ( not ( = ?auto_507673 ?auto_507677 ) ) ( not ( = ?auto_507673 ?auto_507678 ) ) ( not ( = ?auto_507673 ?auto_507681 ) ) ( not ( = ?auto_507674 ?auto_507675 ) ) ( not ( = ?auto_507674 ?auto_507676 ) ) ( not ( = ?auto_507674 ?auto_507677 ) ) ( not ( = ?auto_507674 ?auto_507678 ) ) ( not ( = ?auto_507674 ?auto_507681 ) ) ( not ( = ?auto_507675 ?auto_507676 ) ) ( not ( = ?auto_507675 ?auto_507677 ) ) ( not ( = ?auto_507675 ?auto_507678 ) ) ( not ( = ?auto_507675 ?auto_507681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507676 ?auto_507677 ?auto_507678 )
      ( MAKE-11CRATE-VERIFY ?auto_507667 ?auto_507668 ?auto_507669 ?auto_507670 ?auto_507671 ?auto_507672 ?auto_507673 ?auto_507674 ?auto_507675 ?auto_507676 ?auto_507677 ?auto_507678 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507811 - SURFACE
      ?auto_507812 - SURFACE
      ?auto_507813 - SURFACE
      ?auto_507814 - SURFACE
      ?auto_507815 - SURFACE
      ?auto_507816 - SURFACE
      ?auto_507817 - SURFACE
      ?auto_507818 - SURFACE
      ?auto_507819 - SURFACE
      ?auto_507820 - SURFACE
      ?auto_507821 - SURFACE
      ?auto_507822 - SURFACE
    )
    :vars
    (
      ?auto_507823 - HOIST
      ?auto_507828 - PLACE
      ?auto_507824 - PLACE
      ?auto_507825 - HOIST
      ?auto_507827 - SURFACE
      ?auto_507826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507823 ?auto_507828 ) ( IS-CRATE ?auto_507822 ) ( not ( = ?auto_507821 ?auto_507822 ) ) ( not ( = ?auto_507820 ?auto_507821 ) ) ( not ( = ?auto_507820 ?auto_507822 ) ) ( not ( = ?auto_507824 ?auto_507828 ) ) ( HOIST-AT ?auto_507825 ?auto_507824 ) ( not ( = ?auto_507823 ?auto_507825 ) ) ( AVAILABLE ?auto_507825 ) ( SURFACE-AT ?auto_507822 ?auto_507824 ) ( ON ?auto_507822 ?auto_507827 ) ( CLEAR ?auto_507822 ) ( not ( = ?auto_507821 ?auto_507827 ) ) ( not ( = ?auto_507822 ?auto_507827 ) ) ( not ( = ?auto_507820 ?auto_507827 ) ) ( TRUCK-AT ?auto_507826 ?auto_507828 ) ( SURFACE-AT ?auto_507820 ?auto_507828 ) ( CLEAR ?auto_507820 ) ( LIFTING ?auto_507823 ?auto_507821 ) ( IS-CRATE ?auto_507821 ) ( ON ?auto_507812 ?auto_507811 ) ( ON ?auto_507813 ?auto_507812 ) ( ON ?auto_507814 ?auto_507813 ) ( ON ?auto_507815 ?auto_507814 ) ( ON ?auto_507816 ?auto_507815 ) ( ON ?auto_507817 ?auto_507816 ) ( ON ?auto_507818 ?auto_507817 ) ( ON ?auto_507819 ?auto_507818 ) ( ON ?auto_507820 ?auto_507819 ) ( not ( = ?auto_507811 ?auto_507812 ) ) ( not ( = ?auto_507811 ?auto_507813 ) ) ( not ( = ?auto_507811 ?auto_507814 ) ) ( not ( = ?auto_507811 ?auto_507815 ) ) ( not ( = ?auto_507811 ?auto_507816 ) ) ( not ( = ?auto_507811 ?auto_507817 ) ) ( not ( = ?auto_507811 ?auto_507818 ) ) ( not ( = ?auto_507811 ?auto_507819 ) ) ( not ( = ?auto_507811 ?auto_507820 ) ) ( not ( = ?auto_507811 ?auto_507821 ) ) ( not ( = ?auto_507811 ?auto_507822 ) ) ( not ( = ?auto_507811 ?auto_507827 ) ) ( not ( = ?auto_507812 ?auto_507813 ) ) ( not ( = ?auto_507812 ?auto_507814 ) ) ( not ( = ?auto_507812 ?auto_507815 ) ) ( not ( = ?auto_507812 ?auto_507816 ) ) ( not ( = ?auto_507812 ?auto_507817 ) ) ( not ( = ?auto_507812 ?auto_507818 ) ) ( not ( = ?auto_507812 ?auto_507819 ) ) ( not ( = ?auto_507812 ?auto_507820 ) ) ( not ( = ?auto_507812 ?auto_507821 ) ) ( not ( = ?auto_507812 ?auto_507822 ) ) ( not ( = ?auto_507812 ?auto_507827 ) ) ( not ( = ?auto_507813 ?auto_507814 ) ) ( not ( = ?auto_507813 ?auto_507815 ) ) ( not ( = ?auto_507813 ?auto_507816 ) ) ( not ( = ?auto_507813 ?auto_507817 ) ) ( not ( = ?auto_507813 ?auto_507818 ) ) ( not ( = ?auto_507813 ?auto_507819 ) ) ( not ( = ?auto_507813 ?auto_507820 ) ) ( not ( = ?auto_507813 ?auto_507821 ) ) ( not ( = ?auto_507813 ?auto_507822 ) ) ( not ( = ?auto_507813 ?auto_507827 ) ) ( not ( = ?auto_507814 ?auto_507815 ) ) ( not ( = ?auto_507814 ?auto_507816 ) ) ( not ( = ?auto_507814 ?auto_507817 ) ) ( not ( = ?auto_507814 ?auto_507818 ) ) ( not ( = ?auto_507814 ?auto_507819 ) ) ( not ( = ?auto_507814 ?auto_507820 ) ) ( not ( = ?auto_507814 ?auto_507821 ) ) ( not ( = ?auto_507814 ?auto_507822 ) ) ( not ( = ?auto_507814 ?auto_507827 ) ) ( not ( = ?auto_507815 ?auto_507816 ) ) ( not ( = ?auto_507815 ?auto_507817 ) ) ( not ( = ?auto_507815 ?auto_507818 ) ) ( not ( = ?auto_507815 ?auto_507819 ) ) ( not ( = ?auto_507815 ?auto_507820 ) ) ( not ( = ?auto_507815 ?auto_507821 ) ) ( not ( = ?auto_507815 ?auto_507822 ) ) ( not ( = ?auto_507815 ?auto_507827 ) ) ( not ( = ?auto_507816 ?auto_507817 ) ) ( not ( = ?auto_507816 ?auto_507818 ) ) ( not ( = ?auto_507816 ?auto_507819 ) ) ( not ( = ?auto_507816 ?auto_507820 ) ) ( not ( = ?auto_507816 ?auto_507821 ) ) ( not ( = ?auto_507816 ?auto_507822 ) ) ( not ( = ?auto_507816 ?auto_507827 ) ) ( not ( = ?auto_507817 ?auto_507818 ) ) ( not ( = ?auto_507817 ?auto_507819 ) ) ( not ( = ?auto_507817 ?auto_507820 ) ) ( not ( = ?auto_507817 ?auto_507821 ) ) ( not ( = ?auto_507817 ?auto_507822 ) ) ( not ( = ?auto_507817 ?auto_507827 ) ) ( not ( = ?auto_507818 ?auto_507819 ) ) ( not ( = ?auto_507818 ?auto_507820 ) ) ( not ( = ?auto_507818 ?auto_507821 ) ) ( not ( = ?auto_507818 ?auto_507822 ) ) ( not ( = ?auto_507818 ?auto_507827 ) ) ( not ( = ?auto_507819 ?auto_507820 ) ) ( not ( = ?auto_507819 ?auto_507821 ) ) ( not ( = ?auto_507819 ?auto_507822 ) ) ( not ( = ?auto_507819 ?auto_507827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507820 ?auto_507821 ?auto_507822 )
      ( MAKE-11CRATE-VERIFY ?auto_507811 ?auto_507812 ?auto_507813 ?auto_507814 ?auto_507815 ?auto_507816 ?auto_507817 ?auto_507818 ?auto_507819 ?auto_507820 ?auto_507821 ?auto_507822 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507955 - SURFACE
      ?auto_507956 - SURFACE
      ?auto_507957 - SURFACE
      ?auto_507958 - SURFACE
      ?auto_507959 - SURFACE
      ?auto_507960 - SURFACE
      ?auto_507961 - SURFACE
      ?auto_507962 - SURFACE
      ?auto_507963 - SURFACE
      ?auto_507964 - SURFACE
      ?auto_507965 - SURFACE
      ?auto_507966 - SURFACE
    )
    :vars
    (
      ?auto_507967 - HOIST
      ?auto_507972 - PLACE
      ?auto_507971 - PLACE
      ?auto_507969 - HOIST
      ?auto_507970 - SURFACE
      ?auto_507968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507967 ?auto_507972 ) ( IS-CRATE ?auto_507966 ) ( not ( = ?auto_507965 ?auto_507966 ) ) ( not ( = ?auto_507964 ?auto_507965 ) ) ( not ( = ?auto_507964 ?auto_507966 ) ) ( not ( = ?auto_507971 ?auto_507972 ) ) ( HOIST-AT ?auto_507969 ?auto_507971 ) ( not ( = ?auto_507967 ?auto_507969 ) ) ( AVAILABLE ?auto_507969 ) ( SURFACE-AT ?auto_507966 ?auto_507971 ) ( ON ?auto_507966 ?auto_507970 ) ( CLEAR ?auto_507966 ) ( not ( = ?auto_507965 ?auto_507970 ) ) ( not ( = ?auto_507966 ?auto_507970 ) ) ( not ( = ?auto_507964 ?auto_507970 ) ) ( TRUCK-AT ?auto_507968 ?auto_507972 ) ( SURFACE-AT ?auto_507964 ?auto_507972 ) ( CLEAR ?auto_507964 ) ( IS-CRATE ?auto_507965 ) ( AVAILABLE ?auto_507967 ) ( IN ?auto_507965 ?auto_507968 ) ( ON ?auto_507956 ?auto_507955 ) ( ON ?auto_507957 ?auto_507956 ) ( ON ?auto_507958 ?auto_507957 ) ( ON ?auto_507959 ?auto_507958 ) ( ON ?auto_507960 ?auto_507959 ) ( ON ?auto_507961 ?auto_507960 ) ( ON ?auto_507962 ?auto_507961 ) ( ON ?auto_507963 ?auto_507962 ) ( ON ?auto_507964 ?auto_507963 ) ( not ( = ?auto_507955 ?auto_507956 ) ) ( not ( = ?auto_507955 ?auto_507957 ) ) ( not ( = ?auto_507955 ?auto_507958 ) ) ( not ( = ?auto_507955 ?auto_507959 ) ) ( not ( = ?auto_507955 ?auto_507960 ) ) ( not ( = ?auto_507955 ?auto_507961 ) ) ( not ( = ?auto_507955 ?auto_507962 ) ) ( not ( = ?auto_507955 ?auto_507963 ) ) ( not ( = ?auto_507955 ?auto_507964 ) ) ( not ( = ?auto_507955 ?auto_507965 ) ) ( not ( = ?auto_507955 ?auto_507966 ) ) ( not ( = ?auto_507955 ?auto_507970 ) ) ( not ( = ?auto_507956 ?auto_507957 ) ) ( not ( = ?auto_507956 ?auto_507958 ) ) ( not ( = ?auto_507956 ?auto_507959 ) ) ( not ( = ?auto_507956 ?auto_507960 ) ) ( not ( = ?auto_507956 ?auto_507961 ) ) ( not ( = ?auto_507956 ?auto_507962 ) ) ( not ( = ?auto_507956 ?auto_507963 ) ) ( not ( = ?auto_507956 ?auto_507964 ) ) ( not ( = ?auto_507956 ?auto_507965 ) ) ( not ( = ?auto_507956 ?auto_507966 ) ) ( not ( = ?auto_507956 ?auto_507970 ) ) ( not ( = ?auto_507957 ?auto_507958 ) ) ( not ( = ?auto_507957 ?auto_507959 ) ) ( not ( = ?auto_507957 ?auto_507960 ) ) ( not ( = ?auto_507957 ?auto_507961 ) ) ( not ( = ?auto_507957 ?auto_507962 ) ) ( not ( = ?auto_507957 ?auto_507963 ) ) ( not ( = ?auto_507957 ?auto_507964 ) ) ( not ( = ?auto_507957 ?auto_507965 ) ) ( not ( = ?auto_507957 ?auto_507966 ) ) ( not ( = ?auto_507957 ?auto_507970 ) ) ( not ( = ?auto_507958 ?auto_507959 ) ) ( not ( = ?auto_507958 ?auto_507960 ) ) ( not ( = ?auto_507958 ?auto_507961 ) ) ( not ( = ?auto_507958 ?auto_507962 ) ) ( not ( = ?auto_507958 ?auto_507963 ) ) ( not ( = ?auto_507958 ?auto_507964 ) ) ( not ( = ?auto_507958 ?auto_507965 ) ) ( not ( = ?auto_507958 ?auto_507966 ) ) ( not ( = ?auto_507958 ?auto_507970 ) ) ( not ( = ?auto_507959 ?auto_507960 ) ) ( not ( = ?auto_507959 ?auto_507961 ) ) ( not ( = ?auto_507959 ?auto_507962 ) ) ( not ( = ?auto_507959 ?auto_507963 ) ) ( not ( = ?auto_507959 ?auto_507964 ) ) ( not ( = ?auto_507959 ?auto_507965 ) ) ( not ( = ?auto_507959 ?auto_507966 ) ) ( not ( = ?auto_507959 ?auto_507970 ) ) ( not ( = ?auto_507960 ?auto_507961 ) ) ( not ( = ?auto_507960 ?auto_507962 ) ) ( not ( = ?auto_507960 ?auto_507963 ) ) ( not ( = ?auto_507960 ?auto_507964 ) ) ( not ( = ?auto_507960 ?auto_507965 ) ) ( not ( = ?auto_507960 ?auto_507966 ) ) ( not ( = ?auto_507960 ?auto_507970 ) ) ( not ( = ?auto_507961 ?auto_507962 ) ) ( not ( = ?auto_507961 ?auto_507963 ) ) ( not ( = ?auto_507961 ?auto_507964 ) ) ( not ( = ?auto_507961 ?auto_507965 ) ) ( not ( = ?auto_507961 ?auto_507966 ) ) ( not ( = ?auto_507961 ?auto_507970 ) ) ( not ( = ?auto_507962 ?auto_507963 ) ) ( not ( = ?auto_507962 ?auto_507964 ) ) ( not ( = ?auto_507962 ?auto_507965 ) ) ( not ( = ?auto_507962 ?auto_507966 ) ) ( not ( = ?auto_507962 ?auto_507970 ) ) ( not ( = ?auto_507963 ?auto_507964 ) ) ( not ( = ?auto_507963 ?auto_507965 ) ) ( not ( = ?auto_507963 ?auto_507966 ) ) ( not ( = ?auto_507963 ?auto_507970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507964 ?auto_507965 ?auto_507966 )
      ( MAKE-11CRATE-VERIFY ?auto_507955 ?auto_507956 ?auto_507957 ?auto_507958 ?auto_507959 ?auto_507960 ?auto_507961 ?auto_507962 ?auto_507963 ?auto_507964 ?auto_507965 ?auto_507966 ) )
  )

)

