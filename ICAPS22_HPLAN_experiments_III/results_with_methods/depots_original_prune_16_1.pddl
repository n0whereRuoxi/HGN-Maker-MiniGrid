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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260158 - SURFACE
      ?auto_2260159 - SURFACE
    )
    :vars
    (
      ?auto_2260160 - HOIST
      ?auto_2260161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260160 ?auto_2260161 ) ( SURFACE-AT ?auto_2260158 ?auto_2260161 ) ( CLEAR ?auto_2260158 ) ( LIFTING ?auto_2260160 ?auto_2260159 ) ( IS-CRATE ?auto_2260159 ) ( not ( = ?auto_2260158 ?auto_2260159 ) ) )
    :subtasks
    ( ( !DROP ?auto_2260160 ?auto_2260159 ?auto_2260158 ?auto_2260161 )
      ( MAKE-1CRATE-VERIFY ?auto_2260158 ?auto_2260159 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260162 - SURFACE
      ?auto_2260163 - SURFACE
    )
    :vars
    (
      ?auto_2260165 - HOIST
      ?auto_2260164 - PLACE
      ?auto_2260166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260165 ?auto_2260164 ) ( SURFACE-AT ?auto_2260162 ?auto_2260164 ) ( CLEAR ?auto_2260162 ) ( IS-CRATE ?auto_2260163 ) ( not ( = ?auto_2260162 ?auto_2260163 ) ) ( TRUCK-AT ?auto_2260166 ?auto_2260164 ) ( AVAILABLE ?auto_2260165 ) ( IN ?auto_2260163 ?auto_2260166 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2260165 ?auto_2260163 ?auto_2260166 ?auto_2260164 )
      ( MAKE-1CRATE ?auto_2260162 ?auto_2260163 )
      ( MAKE-1CRATE-VERIFY ?auto_2260162 ?auto_2260163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260167 - SURFACE
      ?auto_2260168 - SURFACE
    )
    :vars
    (
      ?auto_2260170 - HOIST
      ?auto_2260171 - PLACE
      ?auto_2260169 - TRUCK
      ?auto_2260172 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260170 ?auto_2260171 ) ( SURFACE-AT ?auto_2260167 ?auto_2260171 ) ( CLEAR ?auto_2260167 ) ( IS-CRATE ?auto_2260168 ) ( not ( = ?auto_2260167 ?auto_2260168 ) ) ( AVAILABLE ?auto_2260170 ) ( IN ?auto_2260168 ?auto_2260169 ) ( TRUCK-AT ?auto_2260169 ?auto_2260172 ) ( not ( = ?auto_2260172 ?auto_2260171 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2260169 ?auto_2260172 ?auto_2260171 )
      ( MAKE-1CRATE ?auto_2260167 ?auto_2260168 )
      ( MAKE-1CRATE-VERIFY ?auto_2260167 ?auto_2260168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260173 - SURFACE
      ?auto_2260174 - SURFACE
    )
    :vars
    (
      ?auto_2260177 - HOIST
      ?auto_2260178 - PLACE
      ?auto_2260175 - TRUCK
      ?auto_2260176 - PLACE
      ?auto_2260179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260177 ?auto_2260178 ) ( SURFACE-AT ?auto_2260173 ?auto_2260178 ) ( CLEAR ?auto_2260173 ) ( IS-CRATE ?auto_2260174 ) ( not ( = ?auto_2260173 ?auto_2260174 ) ) ( AVAILABLE ?auto_2260177 ) ( TRUCK-AT ?auto_2260175 ?auto_2260176 ) ( not ( = ?auto_2260176 ?auto_2260178 ) ) ( HOIST-AT ?auto_2260179 ?auto_2260176 ) ( LIFTING ?auto_2260179 ?auto_2260174 ) ( not ( = ?auto_2260177 ?auto_2260179 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2260179 ?auto_2260174 ?auto_2260175 ?auto_2260176 )
      ( MAKE-1CRATE ?auto_2260173 ?auto_2260174 )
      ( MAKE-1CRATE-VERIFY ?auto_2260173 ?auto_2260174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260180 - SURFACE
      ?auto_2260181 - SURFACE
    )
    :vars
    (
      ?auto_2260182 - HOIST
      ?auto_2260186 - PLACE
      ?auto_2260184 - TRUCK
      ?auto_2260183 - PLACE
      ?auto_2260185 - HOIST
      ?auto_2260187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260182 ?auto_2260186 ) ( SURFACE-AT ?auto_2260180 ?auto_2260186 ) ( CLEAR ?auto_2260180 ) ( IS-CRATE ?auto_2260181 ) ( not ( = ?auto_2260180 ?auto_2260181 ) ) ( AVAILABLE ?auto_2260182 ) ( TRUCK-AT ?auto_2260184 ?auto_2260183 ) ( not ( = ?auto_2260183 ?auto_2260186 ) ) ( HOIST-AT ?auto_2260185 ?auto_2260183 ) ( not ( = ?auto_2260182 ?auto_2260185 ) ) ( AVAILABLE ?auto_2260185 ) ( SURFACE-AT ?auto_2260181 ?auto_2260183 ) ( ON ?auto_2260181 ?auto_2260187 ) ( CLEAR ?auto_2260181 ) ( not ( = ?auto_2260180 ?auto_2260187 ) ) ( not ( = ?auto_2260181 ?auto_2260187 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2260185 ?auto_2260181 ?auto_2260187 ?auto_2260183 )
      ( MAKE-1CRATE ?auto_2260180 ?auto_2260181 )
      ( MAKE-1CRATE-VERIFY ?auto_2260180 ?auto_2260181 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260188 - SURFACE
      ?auto_2260189 - SURFACE
    )
    :vars
    (
      ?auto_2260190 - HOIST
      ?auto_2260192 - PLACE
      ?auto_2260191 - PLACE
      ?auto_2260195 - HOIST
      ?auto_2260194 - SURFACE
      ?auto_2260193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260190 ?auto_2260192 ) ( SURFACE-AT ?auto_2260188 ?auto_2260192 ) ( CLEAR ?auto_2260188 ) ( IS-CRATE ?auto_2260189 ) ( not ( = ?auto_2260188 ?auto_2260189 ) ) ( AVAILABLE ?auto_2260190 ) ( not ( = ?auto_2260191 ?auto_2260192 ) ) ( HOIST-AT ?auto_2260195 ?auto_2260191 ) ( not ( = ?auto_2260190 ?auto_2260195 ) ) ( AVAILABLE ?auto_2260195 ) ( SURFACE-AT ?auto_2260189 ?auto_2260191 ) ( ON ?auto_2260189 ?auto_2260194 ) ( CLEAR ?auto_2260189 ) ( not ( = ?auto_2260188 ?auto_2260194 ) ) ( not ( = ?auto_2260189 ?auto_2260194 ) ) ( TRUCK-AT ?auto_2260193 ?auto_2260192 ) )
    :subtasks
    ( ( !DRIVE ?auto_2260193 ?auto_2260192 ?auto_2260191 )
      ( MAKE-1CRATE ?auto_2260188 ?auto_2260189 )
      ( MAKE-1CRATE-VERIFY ?auto_2260188 ?auto_2260189 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260205 - SURFACE
      ?auto_2260206 - SURFACE
      ?auto_2260207 - SURFACE
    )
    :vars
    (
      ?auto_2260208 - HOIST
      ?auto_2260209 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260208 ?auto_2260209 ) ( SURFACE-AT ?auto_2260206 ?auto_2260209 ) ( CLEAR ?auto_2260206 ) ( LIFTING ?auto_2260208 ?auto_2260207 ) ( IS-CRATE ?auto_2260207 ) ( not ( = ?auto_2260206 ?auto_2260207 ) ) ( ON ?auto_2260206 ?auto_2260205 ) ( not ( = ?auto_2260205 ?auto_2260206 ) ) ( not ( = ?auto_2260205 ?auto_2260207 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260206 ?auto_2260207 )
      ( MAKE-2CRATE-VERIFY ?auto_2260205 ?auto_2260206 ?auto_2260207 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260215 - SURFACE
      ?auto_2260216 - SURFACE
      ?auto_2260217 - SURFACE
    )
    :vars
    (
      ?auto_2260220 - HOIST
      ?auto_2260218 - PLACE
      ?auto_2260219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260220 ?auto_2260218 ) ( SURFACE-AT ?auto_2260216 ?auto_2260218 ) ( CLEAR ?auto_2260216 ) ( IS-CRATE ?auto_2260217 ) ( not ( = ?auto_2260216 ?auto_2260217 ) ) ( TRUCK-AT ?auto_2260219 ?auto_2260218 ) ( AVAILABLE ?auto_2260220 ) ( IN ?auto_2260217 ?auto_2260219 ) ( ON ?auto_2260216 ?auto_2260215 ) ( not ( = ?auto_2260215 ?auto_2260216 ) ) ( not ( = ?auto_2260215 ?auto_2260217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260216 ?auto_2260217 )
      ( MAKE-2CRATE-VERIFY ?auto_2260215 ?auto_2260216 ?auto_2260217 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260221 - SURFACE
      ?auto_2260222 - SURFACE
    )
    :vars
    (
      ?auto_2260225 - HOIST
      ?auto_2260223 - PLACE
      ?auto_2260224 - TRUCK
      ?auto_2260226 - SURFACE
      ?auto_2260227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260225 ?auto_2260223 ) ( SURFACE-AT ?auto_2260221 ?auto_2260223 ) ( CLEAR ?auto_2260221 ) ( IS-CRATE ?auto_2260222 ) ( not ( = ?auto_2260221 ?auto_2260222 ) ) ( AVAILABLE ?auto_2260225 ) ( IN ?auto_2260222 ?auto_2260224 ) ( ON ?auto_2260221 ?auto_2260226 ) ( not ( = ?auto_2260226 ?auto_2260221 ) ) ( not ( = ?auto_2260226 ?auto_2260222 ) ) ( TRUCK-AT ?auto_2260224 ?auto_2260227 ) ( not ( = ?auto_2260227 ?auto_2260223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2260224 ?auto_2260227 ?auto_2260223 )
      ( MAKE-2CRATE ?auto_2260226 ?auto_2260221 ?auto_2260222 )
      ( MAKE-1CRATE-VERIFY ?auto_2260221 ?auto_2260222 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260228 - SURFACE
      ?auto_2260229 - SURFACE
      ?auto_2260230 - SURFACE
    )
    :vars
    (
      ?auto_2260234 - HOIST
      ?auto_2260233 - PLACE
      ?auto_2260232 - TRUCK
      ?auto_2260231 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260234 ?auto_2260233 ) ( SURFACE-AT ?auto_2260229 ?auto_2260233 ) ( CLEAR ?auto_2260229 ) ( IS-CRATE ?auto_2260230 ) ( not ( = ?auto_2260229 ?auto_2260230 ) ) ( AVAILABLE ?auto_2260234 ) ( IN ?auto_2260230 ?auto_2260232 ) ( ON ?auto_2260229 ?auto_2260228 ) ( not ( = ?auto_2260228 ?auto_2260229 ) ) ( not ( = ?auto_2260228 ?auto_2260230 ) ) ( TRUCK-AT ?auto_2260232 ?auto_2260231 ) ( not ( = ?auto_2260231 ?auto_2260233 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260229 ?auto_2260230 )
      ( MAKE-2CRATE-VERIFY ?auto_2260228 ?auto_2260229 ?auto_2260230 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260235 - SURFACE
      ?auto_2260236 - SURFACE
    )
    :vars
    (
      ?auto_2260237 - HOIST
      ?auto_2260240 - PLACE
      ?auto_2260241 - SURFACE
      ?auto_2260239 - TRUCK
      ?auto_2260238 - PLACE
      ?auto_2260242 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260237 ?auto_2260240 ) ( SURFACE-AT ?auto_2260235 ?auto_2260240 ) ( CLEAR ?auto_2260235 ) ( IS-CRATE ?auto_2260236 ) ( not ( = ?auto_2260235 ?auto_2260236 ) ) ( AVAILABLE ?auto_2260237 ) ( ON ?auto_2260235 ?auto_2260241 ) ( not ( = ?auto_2260241 ?auto_2260235 ) ) ( not ( = ?auto_2260241 ?auto_2260236 ) ) ( TRUCK-AT ?auto_2260239 ?auto_2260238 ) ( not ( = ?auto_2260238 ?auto_2260240 ) ) ( HOIST-AT ?auto_2260242 ?auto_2260238 ) ( LIFTING ?auto_2260242 ?auto_2260236 ) ( not ( = ?auto_2260237 ?auto_2260242 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2260242 ?auto_2260236 ?auto_2260239 ?auto_2260238 )
      ( MAKE-2CRATE ?auto_2260241 ?auto_2260235 ?auto_2260236 )
      ( MAKE-1CRATE-VERIFY ?auto_2260235 ?auto_2260236 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260243 - SURFACE
      ?auto_2260244 - SURFACE
      ?auto_2260245 - SURFACE
    )
    :vars
    (
      ?auto_2260247 - HOIST
      ?auto_2260249 - PLACE
      ?auto_2260250 - TRUCK
      ?auto_2260248 - PLACE
      ?auto_2260246 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260247 ?auto_2260249 ) ( SURFACE-AT ?auto_2260244 ?auto_2260249 ) ( CLEAR ?auto_2260244 ) ( IS-CRATE ?auto_2260245 ) ( not ( = ?auto_2260244 ?auto_2260245 ) ) ( AVAILABLE ?auto_2260247 ) ( ON ?auto_2260244 ?auto_2260243 ) ( not ( = ?auto_2260243 ?auto_2260244 ) ) ( not ( = ?auto_2260243 ?auto_2260245 ) ) ( TRUCK-AT ?auto_2260250 ?auto_2260248 ) ( not ( = ?auto_2260248 ?auto_2260249 ) ) ( HOIST-AT ?auto_2260246 ?auto_2260248 ) ( LIFTING ?auto_2260246 ?auto_2260245 ) ( not ( = ?auto_2260247 ?auto_2260246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260244 ?auto_2260245 )
      ( MAKE-2CRATE-VERIFY ?auto_2260243 ?auto_2260244 ?auto_2260245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260251 - SURFACE
      ?auto_2260252 - SURFACE
    )
    :vars
    (
      ?auto_2260257 - HOIST
      ?auto_2260258 - PLACE
      ?auto_2260253 - SURFACE
      ?auto_2260254 - TRUCK
      ?auto_2260255 - PLACE
      ?auto_2260256 - HOIST
      ?auto_2260259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260257 ?auto_2260258 ) ( SURFACE-AT ?auto_2260251 ?auto_2260258 ) ( CLEAR ?auto_2260251 ) ( IS-CRATE ?auto_2260252 ) ( not ( = ?auto_2260251 ?auto_2260252 ) ) ( AVAILABLE ?auto_2260257 ) ( ON ?auto_2260251 ?auto_2260253 ) ( not ( = ?auto_2260253 ?auto_2260251 ) ) ( not ( = ?auto_2260253 ?auto_2260252 ) ) ( TRUCK-AT ?auto_2260254 ?auto_2260255 ) ( not ( = ?auto_2260255 ?auto_2260258 ) ) ( HOIST-AT ?auto_2260256 ?auto_2260255 ) ( not ( = ?auto_2260257 ?auto_2260256 ) ) ( AVAILABLE ?auto_2260256 ) ( SURFACE-AT ?auto_2260252 ?auto_2260255 ) ( ON ?auto_2260252 ?auto_2260259 ) ( CLEAR ?auto_2260252 ) ( not ( = ?auto_2260251 ?auto_2260259 ) ) ( not ( = ?auto_2260252 ?auto_2260259 ) ) ( not ( = ?auto_2260253 ?auto_2260259 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2260256 ?auto_2260252 ?auto_2260259 ?auto_2260255 )
      ( MAKE-2CRATE ?auto_2260253 ?auto_2260251 ?auto_2260252 )
      ( MAKE-1CRATE-VERIFY ?auto_2260251 ?auto_2260252 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260260 - SURFACE
      ?auto_2260261 - SURFACE
      ?auto_2260262 - SURFACE
    )
    :vars
    (
      ?auto_2260267 - HOIST
      ?auto_2260265 - PLACE
      ?auto_2260266 - TRUCK
      ?auto_2260268 - PLACE
      ?auto_2260263 - HOIST
      ?auto_2260264 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260267 ?auto_2260265 ) ( SURFACE-AT ?auto_2260261 ?auto_2260265 ) ( CLEAR ?auto_2260261 ) ( IS-CRATE ?auto_2260262 ) ( not ( = ?auto_2260261 ?auto_2260262 ) ) ( AVAILABLE ?auto_2260267 ) ( ON ?auto_2260261 ?auto_2260260 ) ( not ( = ?auto_2260260 ?auto_2260261 ) ) ( not ( = ?auto_2260260 ?auto_2260262 ) ) ( TRUCK-AT ?auto_2260266 ?auto_2260268 ) ( not ( = ?auto_2260268 ?auto_2260265 ) ) ( HOIST-AT ?auto_2260263 ?auto_2260268 ) ( not ( = ?auto_2260267 ?auto_2260263 ) ) ( AVAILABLE ?auto_2260263 ) ( SURFACE-AT ?auto_2260262 ?auto_2260268 ) ( ON ?auto_2260262 ?auto_2260264 ) ( CLEAR ?auto_2260262 ) ( not ( = ?auto_2260261 ?auto_2260264 ) ) ( not ( = ?auto_2260262 ?auto_2260264 ) ) ( not ( = ?auto_2260260 ?auto_2260264 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260261 ?auto_2260262 )
      ( MAKE-2CRATE-VERIFY ?auto_2260260 ?auto_2260261 ?auto_2260262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260269 - SURFACE
      ?auto_2260270 - SURFACE
    )
    :vars
    (
      ?auto_2260272 - HOIST
      ?auto_2260273 - PLACE
      ?auto_2260276 - SURFACE
      ?auto_2260271 - PLACE
      ?auto_2260274 - HOIST
      ?auto_2260277 - SURFACE
      ?auto_2260275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260272 ?auto_2260273 ) ( SURFACE-AT ?auto_2260269 ?auto_2260273 ) ( CLEAR ?auto_2260269 ) ( IS-CRATE ?auto_2260270 ) ( not ( = ?auto_2260269 ?auto_2260270 ) ) ( AVAILABLE ?auto_2260272 ) ( ON ?auto_2260269 ?auto_2260276 ) ( not ( = ?auto_2260276 ?auto_2260269 ) ) ( not ( = ?auto_2260276 ?auto_2260270 ) ) ( not ( = ?auto_2260271 ?auto_2260273 ) ) ( HOIST-AT ?auto_2260274 ?auto_2260271 ) ( not ( = ?auto_2260272 ?auto_2260274 ) ) ( AVAILABLE ?auto_2260274 ) ( SURFACE-AT ?auto_2260270 ?auto_2260271 ) ( ON ?auto_2260270 ?auto_2260277 ) ( CLEAR ?auto_2260270 ) ( not ( = ?auto_2260269 ?auto_2260277 ) ) ( not ( = ?auto_2260270 ?auto_2260277 ) ) ( not ( = ?auto_2260276 ?auto_2260277 ) ) ( TRUCK-AT ?auto_2260275 ?auto_2260273 ) )
    :subtasks
    ( ( !DRIVE ?auto_2260275 ?auto_2260273 ?auto_2260271 )
      ( MAKE-2CRATE ?auto_2260276 ?auto_2260269 ?auto_2260270 )
      ( MAKE-1CRATE-VERIFY ?auto_2260269 ?auto_2260270 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260278 - SURFACE
      ?auto_2260279 - SURFACE
      ?auto_2260280 - SURFACE
    )
    :vars
    (
      ?auto_2260282 - HOIST
      ?auto_2260281 - PLACE
      ?auto_2260286 - PLACE
      ?auto_2260284 - HOIST
      ?auto_2260283 - SURFACE
      ?auto_2260285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260282 ?auto_2260281 ) ( SURFACE-AT ?auto_2260279 ?auto_2260281 ) ( CLEAR ?auto_2260279 ) ( IS-CRATE ?auto_2260280 ) ( not ( = ?auto_2260279 ?auto_2260280 ) ) ( AVAILABLE ?auto_2260282 ) ( ON ?auto_2260279 ?auto_2260278 ) ( not ( = ?auto_2260278 ?auto_2260279 ) ) ( not ( = ?auto_2260278 ?auto_2260280 ) ) ( not ( = ?auto_2260286 ?auto_2260281 ) ) ( HOIST-AT ?auto_2260284 ?auto_2260286 ) ( not ( = ?auto_2260282 ?auto_2260284 ) ) ( AVAILABLE ?auto_2260284 ) ( SURFACE-AT ?auto_2260280 ?auto_2260286 ) ( ON ?auto_2260280 ?auto_2260283 ) ( CLEAR ?auto_2260280 ) ( not ( = ?auto_2260279 ?auto_2260283 ) ) ( not ( = ?auto_2260280 ?auto_2260283 ) ) ( not ( = ?auto_2260278 ?auto_2260283 ) ) ( TRUCK-AT ?auto_2260285 ?auto_2260281 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260279 ?auto_2260280 )
      ( MAKE-2CRATE-VERIFY ?auto_2260278 ?auto_2260279 ?auto_2260280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260287 - SURFACE
      ?auto_2260288 - SURFACE
    )
    :vars
    (
      ?auto_2260289 - HOIST
      ?auto_2260295 - PLACE
      ?auto_2260293 - SURFACE
      ?auto_2260292 - PLACE
      ?auto_2260290 - HOIST
      ?auto_2260291 - SURFACE
      ?auto_2260294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260289 ?auto_2260295 ) ( IS-CRATE ?auto_2260288 ) ( not ( = ?auto_2260287 ?auto_2260288 ) ) ( not ( = ?auto_2260293 ?auto_2260287 ) ) ( not ( = ?auto_2260293 ?auto_2260288 ) ) ( not ( = ?auto_2260292 ?auto_2260295 ) ) ( HOIST-AT ?auto_2260290 ?auto_2260292 ) ( not ( = ?auto_2260289 ?auto_2260290 ) ) ( AVAILABLE ?auto_2260290 ) ( SURFACE-AT ?auto_2260288 ?auto_2260292 ) ( ON ?auto_2260288 ?auto_2260291 ) ( CLEAR ?auto_2260288 ) ( not ( = ?auto_2260287 ?auto_2260291 ) ) ( not ( = ?auto_2260288 ?auto_2260291 ) ) ( not ( = ?auto_2260293 ?auto_2260291 ) ) ( TRUCK-AT ?auto_2260294 ?auto_2260295 ) ( SURFACE-AT ?auto_2260293 ?auto_2260295 ) ( CLEAR ?auto_2260293 ) ( LIFTING ?auto_2260289 ?auto_2260287 ) ( IS-CRATE ?auto_2260287 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260293 ?auto_2260287 )
      ( MAKE-2CRATE ?auto_2260293 ?auto_2260287 ?auto_2260288 )
      ( MAKE-1CRATE-VERIFY ?auto_2260287 ?auto_2260288 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260296 - SURFACE
      ?auto_2260297 - SURFACE
      ?auto_2260298 - SURFACE
    )
    :vars
    (
      ?auto_2260301 - HOIST
      ?auto_2260300 - PLACE
      ?auto_2260303 - PLACE
      ?auto_2260302 - HOIST
      ?auto_2260299 - SURFACE
      ?auto_2260304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260301 ?auto_2260300 ) ( IS-CRATE ?auto_2260298 ) ( not ( = ?auto_2260297 ?auto_2260298 ) ) ( not ( = ?auto_2260296 ?auto_2260297 ) ) ( not ( = ?auto_2260296 ?auto_2260298 ) ) ( not ( = ?auto_2260303 ?auto_2260300 ) ) ( HOIST-AT ?auto_2260302 ?auto_2260303 ) ( not ( = ?auto_2260301 ?auto_2260302 ) ) ( AVAILABLE ?auto_2260302 ) ( SURFACE-AT ?auto_2260298 ?auto_2260303 ) ( ON ?auto_2260298 ?auto_2260299 ) ( CLEAR ?auto_2260298 ) ( not ( = ?auto_2260297 ?auto_2260299 ) ) ( not ( = ?auto_2260298 ?auto_2260299 ) ) ( not ( = ?auto_2260296 ?auto_2260299 ) ) ( TRUCK-AT ?auto_2260304 ?auto_2260300 ) ( SURFACE-AT ?auto_2260296 ?auto_2260300 ) ( CLEAR ?auto_2260296 ) ( LIFTING ?auto_2260301 ?auto_2260297 ) ( IS-CRATE ?auto_2260297 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260297 ?auto_2260298 )
      ( MAKE-2CRATE-VERIFY ?auto_2260296 ?auto_2260297 ?auto_2260298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260305 - SURFACE
      ?auto_2260306 - SURFACE
    )
    :vars
    (
      ?auto_2260311 - HOIST
      ?auto_2260309 - PLACE
      ?auto_2260313 - SURFACE
      ?auto_2260308 - PLACE
      ?auto_2260310 - HOIST
      ?auto_2260307 - SURFACE
      ?auto_2260312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260311 ?auto_2260309 ) ( IS-CRATE ?auto_2260306 ) ( not ( = ?auto_2260305 ?auto_2260306 ) ) ( not ( = ?auto_2260313 ?auto_2260305 ) ) ( not ( = ?auto_2260313 ?auto_2260306 ) ) ( not ( = ?auto_2260308 ?auto_2260309 ) ) ( HOIST-AT ?auto_2260310 ?auto_2260308 ) ( not ( = ?auto_2260311 ?auto_2260310 ) ) ( AVAILABLE ?auto_2260310 ) ( SURFACE-AT ?auto_2260306 ?auto_2260308 ) ( ON ?auto_2260306 ?auto_2260307 ) ( CLEAR ?auto_2260306 ) ( not ( = ?auto_2260305 ?auto_2260307 ) ) ( not ( = ?auto_2260306 ?auto_2260307 ) ) ( not ( = ?auto_2260313 ?auto_2260307 ) ) ( TRUCK-AT ?auto_2260312 ?auto_2260309 ) ( SURFACE-AT ?auto_2260313 ?auto_2260309 ) ( CLEAR ?auto_2260313 ) ( IS-CRATE ?auto_2260305 ) ( AVAILABLE ?auto_2260311 ) ( IN ?auto_2260305 ?auto_2260312 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2260311 ?auto_2260305 ?auto_2260312 ?auto_2260309 )
      ( MAKE-2CRATE ?auto_2260313 ?auto_2260305 ?auto_2260306 )
      ( MAKE-1CRATE-VERIFY ?auto_2260305 ?auto_2260306 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260314 - SURFACE
      ?auto_2260315 - SURFACE
      ?auto_2260316 - SURFACE
    )
    :vars
    (
      ?auto_2260318 - HOIST
      ?auto_2260321 - PLACE
      ?auto_2260322 - PLACE
      ?auto_2260317 - HOIST
      ?auto_2260320 - SURFACE
      ?auto_2260319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260318 ?auto_2260321 ) ( IS-CRATE ?auto_2260316 ) ( not ( = ?auto_2260315 ?auto_2260316 ) ) ( not ( = ?auto_2260314 ?auto_2260315 ) ) ( not ( = ?auto_2260314 ?auto_2260316 ) ) ( not ( = ?auto_2260322 ?auto_2260321 ) ) ( HOIST-AT ?auto_2260317 ?auto_2260322 ) ( not ( = ?auto_2260318 ?auto_2260317 ) ) ( AVAILABLE ?auto_2260317 ) ( SURFACE-AT ?auto_2260316 ?auto_2260322 ) ( ON ?auto_2260316 ?auto_2260320 ) ( CLEAR ?auto_2260316 ) ( not ( = ?auto_2260315 ?auto_2260320 ) ) ( not ( = ?auto_2260316 ?auto_2260320 ) ) ( not ( = ?auto_2260314 ?auto_2260320 ) ) ( TRUCK-AT ?auto_2260319 ?auto_2260321 ) ( SURFACE-AT ?auto_2260314 ?auto_2260321 ) ( CLEAR ?auto_2260314 ) ( IS-CRATE ?auto_2260315 ) ( AVAILABLE ?auto_2260318 ) ( IN ?auto_2260315 ?auto_2260319 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260315 ?auto_2260316 )
      ( MAKE-2CRATE-VERIFY ?auto_2260314 ?auto_2260315 ?auto_2260316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260359 - SURFACE
      ?auto_2260360 - SURFACE
    )
    :vars
    (
      ?auto_2260367 - HOIST
      ?auto_2260365 - PLACE
      ?auto_2260364 - SURFACE
      ?auto_2260363 - PLACE
      ?auto_2260366 - HOIST
      ?auto_2260361 - SURFACE
      ?auto_2260362 - TRUCK
      ?auto_2260368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260367 ?auto_2260365 ) ( SURFACE-AT ?auto_2260359 ?auto_2260365 ) ( CLEAR ?auto_2260359 ) ( IS-CRATE ?auto_2260360 ) ( not ( = ?auto_2260359 ?auto_2260360 ) ) ( AVAILABLE ?auto_2260367 ) ( ON ?auto_2260359 ?auto_2260364 ) ( not ( = ?auto_2260364 ?auto_2260359 ) ) ( not ( = ?auto_2260364 ?auto_2260360 ) ) ( not ( = ?auto_2260363 ?auto_2260365 ) ) ( HOIST-AT ?auto_2260366 ?auto_2260363 ) ( not ( = ?auto_2260367 ?auto_2260366 ) ) ( AVAILABLE ?auto_2260366 ) ( SURFACE-AT ?auto_2260360 ?auto_2260363 ) ( ON ?auto_2260360 ?auto_2260361 ) ( CLEAR ?auto_2260360 ) ( not ( = ?auto_2260359 ?auto_2260361 ) ) ( not ( = ?auto_2260360 ?auto_2260361 ) ) ( not ( = ?auto_2260364 ?auto_2260361 ) ) ( TRUCK-AT ?auto_2260362 ?auto_2260368 ) ( not ( = ?auto_2260368 ?auto_2260365 ) ) ( not ( = ?auto_2260363 ?auto_2260368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2260362 ?auto_2260368 ?auto_2260365 )
      ( MAKE-1CRATE ?auto_2260359 ?auto_2260360 )
      ( MAKE-1CRATE-VERIFY ?auto_2260359 ?auto_2260360 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260398 - SURFACE
      ?auto_2260399 - SURFACE
      ?auto_2260400 - SURFACE
      ?auto_2260401 - SURFACE
    )
    :vars
    (
      ?auto_2260403 - HOIST
      ?auto_2260402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260403 ?auto_2260402 ) ( SURFACE-AT ?auto_2260400 ?auto_2260402 ) ( CLEAR ?auto_2260400 ) ( LIFTING ?auto_2260403 ?auto_2260401 ) ( IS-CRATE ?auto_2260401 ) ( not ( = ?auto_2260400 ?auto_2260401 ) ) ( ON ?auto_2260399 ?auto_2260398 ) ( ON ?auto_2260400 ?auto_2260399 ) ( not ( = ?auto_2260398 ?auto_2260399 ) ) ( not ( = ?auto_2260398 ?auto_2260400 ) ) ( not ( = ?auto_2260398 ?auto_2260401 ) ) ( not ( = ?auto_2260399 ?auto_2260400 ) ) ( not ( = ?auto_2260399 ?auto_2260401 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260400 ?auto_2260401 )
      ( MAKE-3CRATE-VERIFY ?auto_2260398 ?auto_2260399 ?auto_2260400 ?auto_2260401 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260415 - SURFACE
      ?auto_2260416 - SURFACE
      ?auto_2260417 - SURFACE
      ?auto_2260418 - SURFACE
    )
    :vars
    (
      ?auto_2260421 - HOIST
      ?auto_2260419 - PLACE
      ?auto_2260420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260421 ?auto_2260419 ) ( SURFACE-AT ?auto_2260417 ?auto_2260419 ) ( CLEAR ?auto_2260417 ) ( IS-CRATE ?auto_2260418 ) ( not ( = ?auto_2260417 ?auto_2260418 ) ) ( TRUCK-AT ?auto_2260420 ?auto_2260419 ) ( AVAILABLE ?auto_2260421 ) ( IN ?auto_2260418 ?auto_2260420 ) ( ON ?auto_2260417 ?auto_2260416 ) ( not ( = ?auto_2260416 ?auto_2260417 ) ) ( not ( = ?auto_2260416 ?auto_2260418 ) ) ( ON ?auto_2260416 ?auto_2260415 ) ( not ( = ?auto_2260415 ?auto_2260416 ) ) ( not ( = ?auto_2260415 ?auto_2260417 ) ) ( not ( = ?auto_2260415 ?auto_2260418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260416 ?auto_2260417 ?auto_2260418 )
      ( MAKE-3CRATE-VERIFY ?auto_2260415 ?auto_2260416 ?auto_2260417 ?auto_2260418 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260436 - SURFACE
      ?auto_2260437 - SURFACE
      ?auto_2260438 - SURFACE
      ?auto_2260439 - SURFACE
    )
    :vars
    (
      ?auto_2260441 - HOIST
      ?auto_2260443 - PLACE
      ?auto_2260442 - TRUCK
      ?auto_2260440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260441 ?auto_2260443 ) ( SURFACE-AT ?auto_2260438 ?auto_2260443 ) ( CLEAR ?auto_2260438 ) ( IS-CRATE ?auto_2260439 ) ( not ( = ?auto_2260438 ?auto_2260439 ) ) ( AVAILABLE ?auto_2260441 ) ( IN ?auto_2260439 ?auto_2260442 ) ( ON ?auto_2260438 ?auto_2260437 ) ( not ( = ?auto_2260437 ?auto_2260438 ) ) ( not ( = ?auto_2260437 ?auto_2260439 ) ) ( TRUCK-AT ?auto_2260442 ?auto_2260440 ) ( not ( = ?auto_2260440 ?auto_2260443 ) ) ( ON ?auto_2260437 ?auto_2260436 ) ( not ( = ?auto_2260436 ?auto_2260437 ) ) ( not ( = ?auto_2260436 ?auto_2260438 ) ) ( not ( = ?auto_2260436 ?auto_2260439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260437 ?auto_2260438 ?auto_2260439 )
      ( MAKE-3CRATE-VERIFY ?auto_2260436 ?auto_2260437 ?auto_2260438 ?auto_2260439 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260460 - SURFACE
      ?auto_2260461 - SURFACE
      ?auto_2260462 - SURFACE
      ?auto_2260463 - SURFACE
    )
    :vars
    (
      ?auto_2260466 - HOIST
      ?auto_2260465 - PLACE
      ?auto_2260464 - TRUCK
      ?auto_2260467 - PLACE
      ?auto_2260468 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260466 ?auto_2260465 ) ( SURFACE-AT ?auto_2260462 ?auto_2260465 ) ( CLEAR ?auto_2260462 ) ( IS-CRATE ?auto_2260463 ) ( not ( = ?auto_2260462 ?auto_2260463 ) ) ( AVAILABLE ?auto_2260466 ) ( ON ?auto_2260462 ?auto_2260461 ) ( not ( = ?auto_2260461 ?auto_2260462 ) ) ( not ( = ?auto_2260461 ?auto_2260463 ) ) ( TRUCK-AT ?auto_2260464 ?auto_2260467 ) ( not ( = ?auto_2260467 ?auto_2260465 ) ) ( HOIST-AT ?auto_2260468 ?auto_2260467 ) ( LIFTING ?auto_2260468 ?auto_2260463 ) ( not ( = ?auto_2260466 ?auto_2260468 ) ) ( ON ?auto_2260461 ?auto_2260460 ) ( not ( = ?auto_2260460 ?auto_2260461 ) ) ( not ( = ?auto_2260460 ?auto_2260462 ) ) ( not ( = ?auto_2260460 ?auto_2260463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260461 ?auto_2260462 ?auto_2260463 )
      ( MAKE-3CRATE-VERIFY ?auto_2260460 ?auto_2260461 ?auto_2260462 ?auto_2260463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260487 - SURFACE
      ?auto_2260488 - SURFACE
      ?auto_2260489 - SURFACE
      ?auto_2260490 - SURFACE
    )
    :vars
    (
      ?auto_2260491 - HOIST
      ?auto_2260496 - PLACE
      ?auto_2260493 - TRUCK
      ?auto_2260495 - PLACE
      ?auto_2260492 - HOIST
      ?auto_2260494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260491 ?auto_2260496 ) ( SURFACE-AT ?auto_2260489 ?auto_2260496 ) ( CLEAR ?auto_2260489 ) ( IS-CRATE ?auto_2260490 ) ( not ( = ?auto_2260489 ?auto_2260490 ) ) ( AVAILABLE ?auto_2260491 ) ( ON ?auto_2260489 ?auto_2260488 ) ( not ( = ?auto_2260488 ?auto_2260489 ) ) ( not ( = ?auto_2260488 ?auto_2260490 ) ) ( TRUCK-AT ?auto_2260493 ?auto_2260495 ) ( not ( = ?auto_2260495 ?auto_2260496 ) ) ( HOIST-AT ?auto_2260492 ?auto_2260495 ) ( not ( = ?auto_2260491 ?auto_2260492 ) ) ( AVAILABLE ?auto_2260492 ) ( SURFACE-AT ?auto_2260490 ?auto_2260495 ) ( ON ?auto_2260490 ?auto_2260494 ) ( CLEAR ?auto_2260490 ) ( not ( = ?auto_2260489 ?auto_2260494 ) ) ( not ( = ?auto_2260490 ?auto_2260494 ) ) ( not ( = ?auto_2260488 ?auto_2260494 ) ) ( ON ?auto_2260488 ?auto_2260487 ) ( not ( = ?auto_2260487 ?auto_2260488 ) ) ( not ( = ?auto_2260487 ?auto_2260489 ) ) ( not ( = ?auto_2260487 ?auto_2260490 ) ) ( not ( = ?auto_2260487 ?auto_2260494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260488 ?auto_2260489 ?auto_2260490 )
      ( MAKE-3CRATE-VERIFY ?auto_2260487 ?auto_2260488 ?auto_2260489 ?auto_2260490 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260515 - SURFACE
      ?auto_2260516 - SURFACE
      ?auto_2260517 - SURFACE
      ?auto_2260518 - SURFACE
    )
    :vars
    (
      ?auto_2260519 - HOIST
      ?auto_2260520 - PLACE
      ?auto_2260524 - PLACE
      ?auto_2260522 - HOIST
      ?auto_2260521 - SURFACE
      ?auto_2260523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260519 ?auto_2260520 ) ( SURFACE-AT ?auto_2260517 ?auto_2260520 ) ( CLEAR ?auto_2260517 ) ( IS-CRATE ?auto_2260518 ) ( not ( = ?auto_2260517 ?auto_2260518 ) ) ( AVAILABLE ?auto_2260519 ) ( ON ?auto_2260517 ?auto_2260516 ) ( not ( = ?auto_2260516 ?auto_2260517 ) ) ( not ( = ?auto_2260516 ?auto_2260518 ) ) ( not ( = ?auto_2260524 ?auto_2260520 ) ) ( HOIST-AT ?auto_2260522 ?auto_2260524 ) ( not ( = ?auto_2260519 ?auto_2260522 ) ) ( AVAILABLE ?auto_2260522 ) ( SURFACE-AT ?auto_2260518 ?auto_2260524 ) ( ON ?auto_2260518 ?auto_2260521 ) ( CLEAR ?auto_2260518 ) ( not ( = ?auto_2260517 ?auto_2260521 ) ) ( not ( = ?auto_2260518 ?auto_2260521 ) ) ( not ( = ?auto_2260516 ?auto_2260521 ) ) ( TRUCK-AT ?auto_2260523 ?auto_2260520 ) ( ON ?auto_2260516 ?auto_2260515 ) ( not ( = ?auto_2260515 ?auto_2260516 ) ) ( not ( = ?auto_2260515 ?auto_2260517 ) ) ( not ( = ?auto_2260515 ?auto_2260518 ) ) ( not ( = ?auto_2260515 ?auto_2260521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260516 ?auto_2260517 ?auto_2260518 )
      ( MAKE-3CRATE-VERIFY ?auto_2260515 ?auto_2260516 ?auto_2260517 ?auto_2260518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260543 - SURFACE
      ?auto_2260544 - SURFACE
      ?auto_2260545 - SURFACE
      ?auto_2260546 - SURFACE
    )
    :vars
    (
      ?auto_2260550 - HOIST
      ?auto_2260549 - PLACE
      ?auto_2260552 - PLACE
      ?auto_2260548 - HOIST
      ?auto_2260547 - SURFACE
      ?auto_2260551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260550 ?auto_2260549 ) ( IS-CRATE ?auto_2260546 ) ( not ( = ?auto_2260545 ?auto_2260546 ) ) ( not ( = ?auto_2260544 ?auto_2260545 ) ) ( not ( = ?auto_2260544 ?auto_2260546 ) ) ( not ( = ?auto_2260552 ?auto_2260549 ) ) ( HOIST-AT ?auto_2260548 ?auto_2260552 ) ( not ( = ?auto_2260550 ?auto_2260548 ) ) ( AVAILABLE ?auto_2260548 ) ( SURFACE-AT ?auto_2260546 ?auto_2260552 ) ( ON ?auto_2260546 ?auto_2260547 ) ( CLEAR ?auto_2260546 ) ( not ( = ?auto_2260545 ?auto_2260547 ) ) ( not ( = ?auto_2260546 ?auto_2260547 ) ) ( not ( = ?auto_2260544 ?auto_2260547 ) ) ( TRUCK-AT ?auto_2260551 ?auto_2260549 ) ( SURFACE-AT ?auto_2260544 ?auto_2260549 ) ( CLEAR ?auto_2260544 ) ( LIFTING ?auto_2260550 ?auto_2260545 ) ( IS-CRATE ?auto_2260545 ) ( ON ?auto_2260544 ?auto_2260543 ) ( not ( = ?auto_2260543 ?auto_2260544 ) ) ( not ( = ?auto_2260543 ?auto_2260545 ) ) ( not ( = ?auto_2260543 ?auto_2260546 ) ) ( not ( = ?auto_2260543 ?auto_2260547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260544 ?auto_2260545 ?auto_2260546 )
      ( MAKE-3CRATE-VERIFY ?auto_2260543 ?auto_2260544 ?auto_2260545 ?auto_2260546 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260571 - SURFACE
      ?auto_2260572 - SURFACE
      ?auto_2260573 - SURFACE
      ?auto_2260574 - SURFACE
    )
    :vars
    (
      ?auto_2260580 - HOIST
      ?auto_2260575 - PLACE
      ?auto_2260576 - PLACE
      ?auto_2260577 - HOIST
      ?auto_2260579 - SURFACE
      ?auto_2260578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260580 ?auto_2260575 ) ( IS-CRATE ?auto_2260574 ) ( not ( = ?auto_2260573 ?auto_2260574 ) ) ( not ( = ?auto_2260572 ?auto_2260573 ) ) ( not ( = ?auto_2260572 ?auto_2260574 ) ) ( not ( = ?auto_2260576 ?auto_2260575 ) ) ( HOIST-AT ?auto_2260577 ?auto_2260576 ) ( not ( = ?auto_2260580 ?auto_2260577 ) ) ( AVAILABLE ?auto_2260577 ) ( SURFACE-AT ?auto_2260574 ?auto_2260576 ) ( ON ?auto_2260574 ?auto_2260579 ) ( CLEAR ?auto_2260574 ) ( not ( = ?auto_2260573 ?auto_2260579 ) ) ( not ( = ?auto_2260574 ?auto_2260579 ) ) ( not ( = ?auto_2260572 ?auto_2260579 ) ) ( TRUCK-AT ?auto_2260578 ?auto_2260575 ) ( SURFACE-AT ?auto_2260572 ?auto_2260575 ) ( CLEAR ?auto_2260572 ) ( IS-CRATE ?auto_2260573 ) ( AVAILABLE ?auto_2260580 ) ( IN ?auto_2260573 ?auto_2260578 ) ( ON ?auto_2260572 ?auto_2260571 ) ( not ( = ?auto_2260571 ?auto_2260572 ) ) ( not ( = ?auto_2260571 ?auto_2260573 ) ) ( not ( = ?auto_2260571 ?auto_2260574 ) ) ( not ( = ?auto_2260571 ?auto_2260579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260572 ?auto_2260573 ?auto_2260574 )
      ( MAKE-3CRATE-VERIFY ?auto_2260571 ?auto_2260572 ?auto_2260573 ?auto_2260574 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2260862 - SURFACE
      ?auto_2260863 - SURFACE
      ?auto_2260864 - SURFACE
      ?auto_2260865 - SURFACE
      ?auto_2260866 - SURFACE
    )
    :vars
    (
      ?auto_2260868 - HOIST
      ?auto_2260867 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260868 ?auto_2260867 ) ( SURFACE-AT ?auto_2260865 ?auto_2260867 ) ( CLEAR ?auto_2260865 ) ( LIFTING ?auto_2260868 ?auto_2260866 ) ( IS-CRATE ?auto_2260866 ) ( not ( = ?auto_2260865 ?auto_2260866 ) ) ( ON ?auto_2260863 ?auto_2260862 ) ( ON ?auto_2260864 ?auto_2260863 ) ( ON ?auto_2260865 ?auto_2260864 ) ( not ( = ?auto_2260862 ?auto_2260863 ) ) ( not ( = ?auto_2260862 ?auto_2260864 ) ) ( not ( = ?auto_2260862 ?auto_2260865 ) ) ( not ( = ?auto_2260862 ?auto_2260866 ) ) ( not ( = ?auto_2260863 ?auto_2260864 ) ) ( not ( = ?auto_2260863 ?auto_2260865 ) ) ( not ( = ?auto_2260863 ?auto_2260866 ) ) ( not ( = ?auto_2260864 ?auto_2260865 ) ) ( not ( = ?auto_2260864 ?auto_2260866 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260865 ?auto_2260866 )
      ( MAKE-4CRATE-VERIFY ?auto_2260862 ?auto_2260863 ?auto_2260864 ?auto_2260865 ?auto_2260866 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2260887 - SURFACE
      ?auto_2260888 - SURFACE
      ?auto_2260889 - SURFACE
      ?auto_2260890 - SURFACE
      ?auto_2260891 - SURFACE
    )
    :vars
    (
      ?auto_2260893 - HOIST
      ?auto_2260894 - PLACE
      ?auto_2260892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260893 ?auto_2260894 ) ( SURFACE-AT ?auto_2260890 ?auto_2260894 ) ( CLEAR ?auto_2260890 ) ( IS-CRATE ?auto_2260891 ) ( not ( = ?auto_2260890 ?auto_2260891 ) ) ( TRUCK-AT ?auto_2260892 ?auto_2260894 ) ( AVAILABLE ?auto_2260893 ) ( IN ?auto_2260891 ?auto_2260892 ) ( ON ?auto_2260890 ?auto_2260889 ) ( not ( = ?auto_2260889 ?auto_2260890 ) ) ( not ( = ?auto_2260889 ?auto_2260891 ) ) ( ON ?auto_2260888 ?auto_2260887 ) ( ON ?auto_2260889 ?auto_2260888 ) ( not ( = ?auto_2260887 ?auto_2260888 ) ) ( not ( = ?auto_2260887 ?auto_2260889 ) ) ( not ( = ?auto_2260887 ?auto_2260890 ) ) ( not ( = ?auto_2260887 ?auto_2260891 ) ) ( not ( = ?auto_2260888 ?auto_2260889 ) ) ( not ( = ?auto_2260888 ?auto_2260890 ) ) ( not ( = ?auto_2260888 ?auto_2260891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260889 ?auto_2260890 ?auto_2260891 )
      ( MAKE-4CRATE-VERIFY ?auto_2260887 ?auto_2260888 ?auto_2260889 ?auto_2260890 ?auto_2260891 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2260917 - SURFACE
      ?auto_2260918 - SURFACE
      ?auto_2260919 - SURFACE
      ?auto_2260920 - SURFACE
      ?auto_2260921 - SURFACE
    )
    :vars
    (
      ?auto_2260922 - HOIST
      ?auto_2260923 - PLACE
      ?auto_2260924 - TRUCK
      ?auto_2260925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260922 ?auto_2260923 ) ( SURFACE-AT ?auto_2260920 ?auto_2260923 ) ( CLEAR ?auto_2260920 ) ( IS-CRATE ?auto_2260921 ) ( not ( = ?auto_2260920 ?auto_2260921 ) ) ( AVAILABLE ?auto_2260922 ) ( IN ?auto_2260921 ?auto_2260924 ) ( ON ?auto_2260920 ?auto_2260919 ) ( not ( = ?auto_2260919 ?auto_2260920 ) ) ( not ( = ?auto_2260919 ?auto_2260921 ) ) ( TRUCK-AT ?auto_2260924 ?auto_2260925 ) ( not ( = ?auto_2260925 ?auto_2260923 ) ) ( ON ?auto_2260918 ?auto_2260917 ) ( ON ?auto_2260919 ?auto_2260918 ) ( not ( = ?auto_2260917 ?auto_2260918 ) ) ( not ( = ?auto_2260917 ?auto_2260919 ) ) ( not ( = ?auto_2260917 ?auto_2260920 ) ) ( not ( = ?auto_2260917 ?auto_2260921 ) ) ( not ( = ?auto_2260918 ?auto_2260919 ) ) ( not ( = ?auto_2260918 ?auto_2260920 ) ) ( not ( = ?auto_2260918 ?auto_2260921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260919 ?auto_2260920 ?auto_2260921 )
      ( MAKE-4CRATE-VERIFY ?auto_2260917 ?auto_2260918 ?auto_2260919 ?auto_2260920 ?auto_2260921 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2260951 - SURFACE
      ?auto_2260952 - SURFACE
      ?auto_2260953 - SURFACE
      ?auto_2260954 - SURFACE
      ?auto_2260955 - SURFACE
    )
    :vars
    (
      ?auto_2260956 - HOIST
      ?auto_2260959 - PLACE
      ?auto_2260960 - TRUCK
      ?auto_2260957 - PLACE
      ?auto_2260958 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260956 ?auto_2260959 ) ( SURFACE-AT ?auto_2260954 ?auto_2260959 ) ( CLEAR ?auto_2260954 ) ( IS-CRATE ?auto_2260955 ) ( not ( = ?auto_2260954 ?auto_2260955 ) ) ( AVAILABLE ?auto_2260956 ) ( ON ?auto_2260954 ?auto_2260953 ) ( not ( = ?auto_2260953 ?auto_2260954 ) ) ( not ( = ?auto_2260953 ?auto_2260955 ) ) ( TRUCK-AT ?auto_2260960 ?auto_2260957 ) ( not ( = ?auto_2260957 ?auto_2260959 ) ) ( HOIST-AT ?auto_2260958 ?auto_2260957 ) ( LIFTING ?auto_2260958 ?auto_2260955 ) ( not ( = ?auto_2260956 ?auto_2260958 ) ) ( ON ?auto_2260952 ?auto_2260951 ) ( ON ?auto_2260953 ?auto_2260952 ) ( not ( = ?auto_2260951 ?auto_2260952 ) ) ( not ( = ?auto_2260951 ?auto_2260953 ) ) ( not ( = ?auto_2260951 ?auto_2260954 ) ) ( not ( = ?auto_2260951 ?auto_2260955 ) ) ( not ( = ?auto_2260952 ?auto_2260953 ) ) ( not ( = ?auto_2260952 ?auto_2260954 ) ) ( not ( = ?auto_2260952 ?auto_2260955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260953 ?auto_2260954 ?auto_2260955 )
      ( MAKE-4CRATE-VERIFY ?auto_2260951 ?auto_2260952 ?auto_2260953 ?auto_2260954 ?auto_2260955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2260989 - SURFACE
      ?auto_2260990 - SURFACE
      ?auto_2260991 - SURFACE
      ?auto_2260992 - SURFACE
      ?auto_2260993 - SURFACE
    )
    :vars
    (
      ?auto_2260996 - HOIST
      ?auto_2260994 - PLACE
      ?auto_2260999 - TRUCK
      ?auto_2260997 - PLACE
      ?auto_2260995 - HOIST
      ?auto_2260998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260996 ?auto_2260994 ) ( SURFACE-AT ?auto_2260992 ?auto_2260994 ) ( CLEAR ?auto_2260992 ) ( IS-CRATE ?auto_2260993 ) ( not ( = ?auto_2260992 ?auto_2260993 ) ) ( AVAILABLE ?auto_2260996 ) ( ON ?auto_2260992 ?auto_2260991 ) ( not ( = ?auto_2260991 ?auto_2260992 ) ) ( not ( = ?auto_2260991 ?auto_2260993 ) ) ( TRUCK-AT ?auto_2260999 ?auto_2260997 ) ( not ( = ?auto_2260997 ?auto_2260994 ) ) ( HOIST-AT ?auto_2260995 ?auto_2260997 ) ( not ( = ?auto_2260996 ?auto_2260995 ) ) ( AVAILABLE ?auto_2260995 ) ( SURFACE-AT ?auto_2260993 ?auto_2260997 ) ( ON ?auto_2260993 ?auto_2260998 ) ( CLEAR ?auto_2260993 ) ( not ( = ?auto_2260992 ?auto_2260998 ) ) ( not ( = ?auto_2260993 ?auto_2260998 ) ) ( not ( = ?auto_2260991 ?auto_2260998 ) ) ( ON ?auto_2260990 ?auto_2260989 ) ( ON ?auto_2260991 ?auto_2260990 ) ( not ( = ?auto_2260989 ?auto_2260990 ) ) ( not ( = ?auto_2260989 ?auto_2260991 ) ) ( not ( = ?auto_2260989 ?auto_2260992 ) ) ( not ( = ?auto_2260989 ?auto_2260993 ) ) ( not ( = ?auto_2260989 ?auto_2260998 ) ) ( not ( = ?auto_2260990 ?auto_2260991 ) ) ( not ( = ?auto_2260990 ?auto_2260992 ) ) ( not ( = ?auto_2260990 ?auto_2260993 ) ) ( not ( = ?auto_2260990 ?auto_2260998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260991 ?auto_2260992 ?auto_2260993 )
      ( MAKE-4CRATE-VERIFY ?auto_2260989 ?auto_2260990 ?auto_2260991 ?auto_2260992 ?auto_2260993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261028 - SURFACE
      ?auto_2261029 - SURFACE
      ?auto_2261030 - SURFACE
      ?auto_2261031 - SURFACE
      ?auto_2261032 - SURFACE
    )
    :vars
    (
      ?auto_2261036 - HOIST
      ?auto_2261035 - PLACE
      ?auto_2261034 - PLACE
      ?auto_2261037 - HOIST
      ?auto_2261038 - SURFACE
      ?auto_2261033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261036 ?auto_2261035 ) ( SURFACE-AT ?auto_2261031 ?auto_2261035 ) ( CLEAR ?auto_2261031 ) ( IS-CRATE ?auto_2261032 ) ( not ( = ?auto_2261031 ?auto_2261032 ) ) ( AVAILABLE ?auto_2261036 ) ( ON ?auto_2261031 ?auto_2261030 ) ( not ( = ?auto_2261030 ?auto_2261031 ) ) ( not ( = ?auto_2261030 ?auto_2261032 ) ) ( not ( = ?auto_2261034 ?auto_2261035 ) ) ( HOIST-AT ?auto_2261037 ?auto_2261034 ) ( not ( = ?auto_2261036 ?auto_2261037 ) ) ( AVAILABLE ?auto_2261037 ) ( SURFACE-AT ?auto_2261032 ?auto_2261034 ) ( ON ?auto_2261032 ?auto_2261038 ) ( CLEAR ?auto_2261032 ) ( not ( = ?auto_2261031 ?auto_2261038 ) ) ( not ( = ?auto_2261032 ?auto_2261038 ) ) ( not ( = ?auto_2261030 ?auto_2261038 ) ) ( TRUCK-AT ?auto_2261033 ?auto_2261035 ) ( ON ?auto_2261029 ?auto_2261028 ) ( ON ?auto_2261030 ?auto_2261029 ) ( not ( = ?auto_2261028 ?auto_2261029 ) ) ( not ( = ?auto_2261028 ?auto_2261030 ) ) ( not ( = ?auto_2261028 ?auto_2261031 ) ) ( not ( = ?auto_2261028 ?auto_2261032 ) ) ( not ( = ?auto_2261028 ?auto_2261038 ) ) ( not ( = ?auto_2261029 ?auto_2261030 ) ) ( not ( = ?auto_2261029 ?auto_2261031 ) ) ( not ( = ?auto_2261029 ?auto_2261032 ) ) ( not ( = ?auto_2261029 ?auto_2261038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261030 ?auto_2261031 ?auto_2261032 )
      ( MAKE-4CRATE-VERIFY ?auto_2261028 ?auto_2261029 ?auto_2261030 ?auto_2261031 ?auto_2261032 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261067 - SURFACE
      ?auto_2261068 - SURFACE
      ?auto_2261069 - SURFACE
      ?auto_2261070 - SURFACE
      ?auto_2261071 - SURFACE
    )
    :vars
    (
      ?auto_2261076 - HOIST
      ?auto_2261074 - PLACE
      ?auto_2261077 - PLACE
      ?auto_2261072 - HOIST
      ?auto_2261073 - SURFACE
      ?auto_2261075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261076 ?auto_2261074 ) ( IS-CRATE ?auto_2261071 ) ( not ( = ?auto_2261070 ?auto_2261071 ) ) ( not ( = ?auto_2261069 ?auto_2261070 ) ) ( not ( = ?auto_2261069 ?auto_2261071 ) ) ( not ( = ?auto_2261077 ?auto_2261074 ) ) ( HOIST-AT ?auto_2261072 ?auto_2261077 ) ( not ( = ?auto_2261076 ?auto_2261072 ) ) ( AVAILABLE ?auto_2261072 ) ( SURFACE-AT ?auto_2261071 ?auto_2261077 ) ( ON ?auto_2261071 ?auto_2261073 ) ( CLEAR ?auto_2261071 ) ( not ( = ?auto_2261070 ?auto_2261073 ) ) ( not ( = ?auto_2261071 ?auto_2261073 ) ) ( not ( = ?auto_2261069 ?auto_2261073 ) ) ( TRUCK-AT ?auto_2261075 ?auto_2261074 ) ( SURFACE-AT ?auto_2261069 ?auto_2261074 ) ( CLEAR ?auto_2261069 ) ( LIFTING ?auto_2261076 ?auto_2261070 ) ( IS-CRATE ?auto_2261070 ) ( ON ?auto_2261068 ?auto_2261067 ) ( ON ?auto_2261069 ?auto_2261068 ) ( not ( = ?auto_2261067 ?auto_2261068 ) ) ( not ( = ?auto_2261067 ?auto_2261069 ) ) ( not ( = ?auto_2261067 ?auto_2261070 ) ) ( not ( = ?auto_2261067 ?auto_2261071 ) ) ( not ( = ?auto_2261067 ?auto_2261073 ) ) ( not ( = ?auto_2261068 ?auto_2261069 ) ) ( not ( = ?auto_2261068 ?auto_2261070 ) ) ( not ( = ?auto_2261068 ?auto_2261071 ) ) ( not ( = ?auto_2261068 ?auto_2261073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261069 ?auto_2261070 ?auto_2261071 )
      ( MAKE-4CRATE-VERIFY ?auto_2261067 ?auto_2261068 ?auto_2261069 ?auto_2261070 ?auto_2261071 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261106 - SURFACE
      ?auto_2261107 - SURFACE
      ?auto_2261108 - SURFACE
      ?auto_2261109 - SURFACE
      ?auto_2261110 - SURFACE
    )
    :vars
    (
      ?auto_2261115 - HOIST
      ?auto_2261113 - PLACE
      ?auto_2261112 - PLACE
      ?auto_2261114 - HOIST
      ?auto_2261111 - SURFACE
      ?auto_2261116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261115 ?auto_2261113 ) ( IS-CRATE ?auto_2261110 ) ( not ( = ?auto_2261109 ?auto_2261110 ) ) ( not ( = ?auto_2261108 ?auto_2261109 ) ) ( not ( = ?auto_2261108 ?auto_2261110 ) ) ( not ( = ?auto_2261112 ?auto_2261113 ) ) ( HOIST-AT ?auto_2261114 ?auto_2261112 ) ( not ( = ?auto_2261115 ?auto_2261114 ) ) ( AVAILABLE ?auto_2261114 ) ( SURFACE-AT ?auto_2261110 ?auto_2261112 ) ( ON ?auto_2261110 ?auto_2261111 ) ( CLEAR ?auto_2261110 ) ( not ( = ?auto_2261109 ?auto_2261111 ) ) ( not ( = ?auto_2261110 ?auto_2261111 ) ) ( not ( = ?auto_2261108 ?auto_2261111 ) ) ( TRUCK-AT ?auto_2261116 ?auto_2261113 ) ( SURFACE-AT ?auto_2261108 ?auto_2261113 ) ( CLEAR ?auto_2261108 ) ( IS-CRATE ?auto_2261109 ) ( AVAILABLE ?auto_2261115 ) ( IN ?auto_2261109 ?auto_2261116 ) ( ON ?auto_2261107 ?auto_2261106 ) ( ON ?auto_2261108 ?auto_2261107 ) ( not ( = ?auto_2261106 ?auto_2261107 ) ) ( not ( = ?auto_2261106 ?auto_2261108 ) ) ( not ( = ?auto_2261106 ?auto_2261109 ) ) ( not ( = ?auto_2261106 ?auto_2261110 ) ) ( not ( = ?auto_2261106 ?auto_2261111 ) ) ( not ( = ?auto_2261107 ?auto_2261108 ) ) ( not ( = ?auto_2261107 ?auto_2261109 ) ) ( not ( = ?auto_2261107 ?auto_2261110 ) ) ( not ( = ?auto_2261107 ?auto_2261111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261108 ?auto_2261109 ?auto_2261110 )
      ( MAKE-4CRATE-VERIFY ?auto_2261106 ?auto_2261107 ?auto_2261108 ?auto_2261109 ?auto_2261110 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2261766 - SURFACE
      ?auto_2261767 - SURFACE
      ?auto_2261768 - SURFACE
      ?auto_2261769 - SURFACE
      ?auto_2261770 - SURFACE
      ?auto_2261771 - SURFACE
    )
    :vars
    (
      ?auto_2261772 - HOIST
      ?auto_2261773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261772 ?auto_2261773 ) ( SURFACE-AT ?auto_2261770 ?auto_2261773 ) ( CLEAR ?auto_2261770 ) ( LIFTING ?auto_2261772 ?auto_2261771 ) ( IS-CRATE ?auto_2261771 ) ( not ( = ?auto_2261770 ?auto_2261771 ) ) ( ON ?auto_2261767 ?auto_2261766 ) ( ON ?auto_2261768 ?auto_2261767 ) ( ON ?auto_2261769 ?auto_2261768 ) ( ON ?auto_2261770 ?auto_2261769 ) ( not ( = ?auto_2261766 ?auto_2261767 ) ) ( not ( = ?auto_2261766 ?auto_2261768 ) ) ( not ( = ?auto_2261766 ?auto_2261769 ) ) ( not ( = ?auto_2261766 ?auto_2261770 ) ) ( not ( = ?auto_2261766 ?auto_2261771 ) ) ( not ( = ?auto_2261767 ?auto_2261768 ) ) ( not ( = ?auto_2261767 ?auto_2261769 ) ) ( not ( = ?auto_2261767 ?auto_2261770 ) ) ( not ( = ?auto_2261767 ?auto_2261771 ) ) ( not ( = ?auto_2261768 ?auto_2261769 ) ) ( not ( = ?auto_2261768 ?auto_2261770 ) ) ( not ( = ?auto_2261768 ?auto_2261771 ) ) ( not ( = ?auto_2261769 ?auto_2261770 ) ) ( not ( = ?auto_2261769 ?auto_2261771 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2261770 ?auto_2261771 )
      ( MAKE-5CRATE-VERIFY ?auto_2261766 ?auto_2261767 ?auto_2261768 ?auto_2261769 ?auto_2261770 ?auto_2261771 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2261800 - SURFACE
      ?auto_2261801 - SURFACE
      ?auto_2261802 - SURFACE
      ?auto_2261803 - SURFACE
      ?auto_2261804 - SURFACE
      ?auto_2261805 - SURFACE
    )
    :vars
    (
      ?auto_2261806 - HOIST
      ?auto_2261808 - PLACE
      ?auto_2261807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261806 ?auto_2261808 ) ( SURFACE-AT ?auto_2261804 ?auto_2261808 ) ( CLEAR ?auto_2261804 ) ( IS-CRATE ?auto_2261805 ) ( not ( = ?auto_2261804 ?auto_2261805 ) ) ( TRUCK-AT ?auto_2261807 ?auto_2261808 ) ( AVAILABLE ?auto_2261806 ) ( IN ?auto_2261805 ?auto_2261807 ) ( ON ?auto_2261804 ?auto_2261803 ) ( not ( = ?auto_2261803 ?auto_2261804 ) ) ( not ( = ?auto_2261803 ?auto_2261805 ) ) ( ON ?auto_2261801 ?auto_2261800 ) ( ON ?auto_2261802 ?auto_2261801 ) ( ON ?auto_2261803 ?auto_2261802 ) ( not ( = ?auto_2261800 ?auto_2261801 ) ) ( not ( = ?auto_2261800 ?auto_2261802 ) ) ( not ( = ?auto_2261800 ?auto_2261803 ) ) ( not ( = ?auto_2261800 ?auto_2261804 ) ) ( not ( = ?auto_2261800 ?auto_2261805 ) ) ( not ( = ?auto_2261801 ?auto_2261802 ) ) ( not ( = ?auto_2261801 ?auto_2261803 ) ) ( not ( = ?auto_2261801 ?auto_2261804 ) ) ( not ( = ?auto_2261801 ?auto_2261805 ) ) ( not ( = ?auto_2261802 ?auto_2261803 ) ) ( not ( = ?auto_2261802 ?auto_2261804 ) ) ( not ( = ?auto_2261802 ?auto_2261805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261803 ?auto_2261804 ?auto_2261805 )
      ( MAKE-5CRATE-VERIFY ?auto_2261800 ?auto_2261801 ?auto_2261802 ?auto_2261803 ?auto_2261804 ?auto_2261805 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2261840 - SURFACE
      ?auto_2261841 - SURFACE
      ?auto_2261842 - SURFACE
      ?auto_2261843 - SURFACE
      ?auto_2261844 - SURFACE
      ?auto_2261845 - SURFACE
    )
    :vars
    (
      ?auto_2261846 - HOIST
      ?auto_2261848 - PLACE
      ?auto_2261849 - TRUCK
      ?auto_2261847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261846 ?auto_2261848 ) ( SURFACE-AT ?auto_2261844 ?auto_2261848 ) ( CLEAR ?auto_2261844 ) ( IS-CRATE ?auto_2261845 ) ( not ( = ?auto_2261844 ?auto_2261845 ) ) ( AVAILABLE ?auto_2261846 ) ( IN ?auto_2261845 ?auto_2261849 ) ( ON ?auto_2261844 ?auto_2261843 ) ( not ( = ?auto_2261843 ?auto_2261844 ) ) ( not ( = ?auto_2261843 ?auto_2261845 ) ) ( TRUCK-AT ?auto_2261849 ?auto_2261847 ) ( not ( = ?auto_2261847 ?auto_2261848 ) ) ( ON ?auto_2261841 ?auto_2261840 ) ( ON ?auto_2261842 ?auto_2261841 ) ( ON ?auto_2261843 ?auto_2261842 ) ( not ( = ?auto_2261840 ?auto_2261841 ) ) ( not ( = ?auto_2261840 ?auto_2261842 ) ) ( not ( = ?auto_2261840 ?auto_2261843 ) ) ( not ( = ?auto_2261840 ?auto_2261844 ) ) ( not ( = ?auto_2261840 ?auto_2261845 ) ) ( not ( = ?auto_2261841 ?auto_2261842 ) ) ( not ( = ?auto_2261841 ?auto_2261843 ) ) ( not ( = ?auto_2261841 ?auto_2261844 ) ) ( not ( = ?auto_2261841 ?auto_2261845 ) ) ( not ( = ?auto_2261842 ?auto_2261843 ) ) ( not ( = ?auto_2261842 ?auto_2261844 ) ) ( not ( = ?auto_2261842 ?auto_2261845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261843 ?auto_2261844 ?auto_2261845 )
      ( MAKE-5CRATE-VERIFY ?auto_2261840 ?auto_2261841 ?auto_2261842 ?auto_2261843 ?auto_2261844 ?auto_2261845 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2261885 - SURFACE
      ?auto_2261886 - SURFACE
      ?auto_2261887 - SURFACE
      ?auto_2261888 - SURFACE
      ?auto_2261889 - SURFACE
      ?auto_2261890 - SURFACE
    )
    :vars
    (
      ?auto_2261892 - HOIST
      ?auto_2261893 - PLACE
      ?auto_2261895 - TRUCK
      ?auto_2261891 - PLACE
      ?auto_2261894 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261892 ?auto_2261893 ) ( SURFACE-AT ?auto_2261889 ?auto_2261893 ) ( CLEAR ?auto_2261889 ) ( IS-CRATE ?auto_2261890 ) ( not ( = ?auto_2261889 ?auto_2261890 ) ) ( AVAILABLE ?auto_2261892 ) ( ON ?auto_2261889 ?auto_2261888 ) ( not ( = ?auto_2261888 ?auto_2261889 ) ) ( not ( = ?auto_2261888 ?auto_2261890 ) ) ( TRUCK-AT ?auto_2261895 ?auto_2261891 ) ( not ( = ?auto_2261891 ?auto_2261893 ) ) ( HOIST-AT ?auto_2261894 ?auto_2261891 ) ( LIFTING ?auto_2261894 ?auto_2261890 ) ( not ( = ?auto_2261892 ?auto_2261894 ) ) ( ON ?auto_2261886 ?auto_2261885 ) ( ON ?auto_2261887 ?auto_2261886 ) ( ON ?auto_2261888 ?auto_2261887 ) ( not ( = ?auto_2261885 ?auto_2261886 ) ) ( not ( = ?auto_2261885 ?auto_2261887 ) ) ( not ( = ?auto_2261885 ?auto_2261888 ) ) ( not ( = ?auto_2261885 ?auto_2261889 ) ) ( not ( = ?auto_2261885 ?auto_2261890 ) ) ( not ( = ?auto_2261886 ?auto_2261887 ) ) ( not ( = ?auto_2261886 ?auto_2261888 ) ) ( not ( = ?auto_2261886 ?auto_2261889 ) ) ( not ( = ?auto_2261886 ?auto_2261890 ) ) ( not ( = ?auto_2261887 ?auto_2261888 ) ) ( not ( = ?auto_2261887 ?auto_2261889 ) ) ( not ( = ?auto_2261887 ?auto_2261890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261888 ?auto_2261889 ?auto_2261890 )
      ( MAKE-5CRATE-VERIFY ?auto_2261885 ?auto_2261886 ?auto_2261887 ?auto_2261888 ?auto_2261889 ?auto_2261890 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2261935 - SURFACE
      ?auto_2261936 - SURFACE
      ?auto_2261937 - SURFACE
      ?auto_2261938 - SURFACE
      ?auto_2261939 - SURFACE
      ?auto_2261940 - SURFACE
    )
    :vars
    (
      ?auto_2261943 - HOIST
      ?auto_2261945 - PLACE
      ?auto_2261944 - TRUCK
      ?auto_2261946 - PLACE
      ?auto_2261941 - HOIST
      ?auto_2261942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261943 ?auto_2261945 ) ( SURFACE-AT ?auto_2261939 ?auto_2261945 ) ( CLEAR ?auto_2261939 ) ( IS-CRATE ?auto_2261940 ) ( not ( = ?auto_2261939 ?auto_2261940 ) ) ( AVAILABLE ?auto_2261943 ) ( ON ?auto_2261939 ?auto_2261938 ) ( not ( = ?auto_2261938 ?auto_2261939 ) ) ( not ( = ?auto_2261938 ?auto_2261940 ) ) ( TRUCK-AT ?auto_2261944 ?auto_2261946 ) ( not ( = ?auto_2261946 ?auto_2261945 ) ) ( HOIST-AT ?auto_2261941 ?auto_2261946 ) ( not ( = ?auto_2261943 ?auto_2261941 ) ) ( AVAILABLE ?auto_2261941 ) ( SURFACE-AT ?auto_2261940 ?auto_2261946 ) ( ON ?auto_2261940 ?auto_2261942 ) ( CLEAR ?auto_2261940 ) ( not ( = ?auto_2261939 ?auto_2261942 ) ) ( not ( = ?auto_2261940 ?auto_2261942 ) ) ( not ( = ?auto_2261938 ?auto_2261942 ) ) ( ON ?auto_2261936 ?auto_2261935 ) ( ON ?auto_2261937 ?auto_2261936 ) ( ON ?auto_2261938 ?auto_2261937 ) ( not ( = ?auto_2261935 ?auto_2261936 ) ) ( not ( = ?auto_2261935 ?auto_2261937 ) ) ( not ( = ?auto_2261935 ?auto_2261938 ) ) ( not ( = ?auto_2261935 ?auto_2261939 ) ) ( not ( = ?auto_2261935 ?auto_2261940 ) ) ( not ( = ?auto_2261935 ?auto_2261942 ) ) ( not ( = ?auto_2261936 ?auto_2261937 ) ) ( not ( = ?auto_2261936 ?auto_2261938 ) ) ( not ( = ?auto_2261936 ?auto_2261939 ) ) ( not ( = ?auto_2261936 ?auto_2261940 ) ) ( not ( = ?auto_2261936 ?auto_2261942 ) ) ( not ( = ?auto_2261937 ?auto_2261938 ) ) ( not ( = ?auto_2261937 ?auto_2261939 ) ) ( not ( = ?auto_2261937 ?auto_2261940 ) ) ( not ( = ?auto_2261937 ?auto_2261942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261938 ?auto_2261939 ?auto_2261940 )
      ( MAKE-5CRATE-VERIFY ?auto_2261935 ?auto_2261936 ?auto_2261937 ?auto_2261938 ?auto_2261939 ?auto_2261940 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2261986 - SURFACE
      ?auto_2261987 - SURFACE
      ?auto_2261988 - SURFACE
      ?auto_2261989 - SURFACE
      ?auto_2261990 - SURFACE
      ?auto_2261991 - SURFACE
    )
    :vars
    (
      ?auto_2261993 - HOIST
      ?auto_2261995 - PLACE
      ?auto_2261996 - PLACE
      ?auto_2261997 - HOIST
      ?auto_2261994 - SURFACE
      ?auto_2261992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261993 ?auto_2261995 ) ( SURFACE-AT ?auto_2261990 ?auto_2261995 ) ( CLEAR ?auto_2261990 ) ( IS-CRATE ?auto_2261991 ) ( not ( = ?auto_2261990 ?auto_2261991 ) ) ( AVAILABLE ?auto_2261993 ) ( ON ?auto_2261990 ?auto_2261989 ) ( not ( = ?auto_2261989 ?auto_2261990 ) ) ( not ( = ?auto_2261989 ?auto_2261991 ) ) ( not ( = ?auto_2261996 ?auto_2261995 ) ) ( HOIST-AT ?auto_2261997 ?auto_2261996 ) ( not ( = ?auto_2261993 ?auto_2261997 ) ) ( AVAILABLE ?auto_2261997 ) ( SURFACE-AT ?auto_2261991 ?auto_2261996 ) ( ON ?auto_2261991 ?auto_2261994 ) ( CLEAR ?auto_2261991 ) ( not ( = ?auto_2261990 ?auto_2261994 ) ) ( not ( = ?auto_2261991 ?auto_2261994 ) ) ( not ( = ?auto_2261989 ?auto_2261994 ) ) ( TRUCK-AT ?auto_2261992 ?auto_2261995 ) ( ON ?auto_2261987 ?auto_2261986 ) ( ON ?auto_2261988 ?auto_2261987 ) ( ON ?auto_2261989 ?auto_2261988 ) ( not ( = ?auto_2261986 ?auto_2261987 ) ) ( not ( = ?auto_2261986 ?auto_2261988 ) ) ( not ( = ?auto_2261986 ?auto_2261989 ) ) ( not ( = ?auto_2261986 ?auto_2261990 ) ) ( not ( = ?auto_2261986 ?auto_2261991 ) ) ( not ( = ?auto_2261986 ?auto_2261994 ) ) ( not ( = ?auto_2261987 ?auto_2261988 ) ) ( not ( = ?auto_2261987 ?auto_2261989 ) ) ( not ( = ?auto_2261987 ?auto_2261990 ) ) ( not ( = ?auto_2261987 ?auto_2261991 ) ) ( not ( = ?auto_2261987 ?auto_2261994 ) ) ( not ( = ?auto_2261988 ?auto_2261989 ) ) ( not ( = ?auto_2261988 ?auto_2261990 ) ) ( not ( = ?auto_2261988 ?auto_2261991 ) ) ( not ( = ?auto_2261988 ?auto_2261994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261989 ?auto_2261990 ?auto_2261991 )
      ( MAKE-5CRATE-VERIFY ?auto_2261986 ?auto_2261987 ?auto_2261988 ?auto_2261989 ?auto_2261990 ?auto_2261991 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262037 - SURFACE
      ?auto_2262038 - SURFACE
      ?auto_2262039 - SURFACE
      ?auto_2262040 - SURFACE
      ?auto_2262041 - SURFACE
      ?auto_2262042 - SURFACE
    )
    :vars
    (
      ?auto_2262043 - HOIST
      ?auto_2262045 - PLACE
      ?auto_2262047 - PLACE
      ?auto_2262044 - HOIST
      ?auto_2262046 - SURFACE
      ?auto_2262048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262043 ?auto_2262045 ) ( IS-CRATE ?auto_2262042 ) ( not ( = ?auto_2262041 ?auto_2262042 ) ) ( not ( = ?auto_2262040 ?auto_2262041 ) ) ( not ( = ?auto_2262040 ?auto_2262042 ) ) ( not ( = ?auto_2262047 ?auto_2262045 ) ) ( HOIST-AT ?auto_2262044 ?auto_2262047 ) ( not ( = ?auto_2262043 ?auto_2262044 ) ) ( AVAILABLE ?auto_2262044 ) ( SURFACE-AT ?auto_2262042 ?auto_2262047 ) ( ON ?auto_2262042 ?auto_2262046 ) ( CLEAR ?auto_2262042 ) ( not ( = ?auto_2262041 ?auto_2262046 ) ) ( not ( = ?auto_2262042 ?auto_2262046 ) ) ( not ( = ?auto_2262040 ?auto_2262046 ) ) ( TRUCK-AT ?auto_2262048 ?auto_2262045 ) ( SURFACE-AT ?auto_2262040 ?auto_2262045 ) ( CLEAR ?auto_2262040 ) ( LIFTING ?auto_2262043 ?auto_2262041 ) ( IS-CRATE ?auto_2262041 ) ( ON ?auto_2262038 ?auto_2262037 ) ( ON ?auto_2262039 ?auto_2262038 ) ( ON ?auto_2262040 ?auto_2262039 ) ( not ( = ?auto_2262037 ?auto_2262038 ) ) ( not ( = ?auto_2262037 ?auto_2262039 ) ) ( not ( = ?auto_2262037 ?auto_2262040 ) ) ( not ( = ?auto_2262037 ?auto_2262041 ) ) ( not ( = ?auto_2262037 ?auto_2262042 ) ) ( not ( = ?auto_2262037 ?auto_2262046 ) ) ( not ( = ?auto_2262038 ?auto_2262039 ) ) ( not ( = ?auto_2262038 ?auto_2262040 ) ) ( not ( = ?auto_2262038 ?auto_2262041 ) ) ( not ( = ?auto_2262038 ?auto_2262042 ) ) ( not ( = ?auto_2262038 ?auto_2262046 ) ) ( not ( = ?auto_2262039 ?auto_2262040 ) ) ( not ( = ?auto_2262039 ?auto_2262041 ) ) ( not ( = ?auto_2262039 ?auto_2262042 ) ) ( not ( = ?auto_2262039 ?auto_2262046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262040 ?auto_2262041 ?auto_2262042 )
      ( MAKE-5CRATE-VERIFY ?auto_2262037 ?auto_2262038 ?auto_2262039 ?auto_2262040 ?auto_2262041 ?auto_2262042 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262088 - SURFACE
      ?auto_2262089 - SURFACE
      ?auto_2262090 - SURFACE
      ?auto_2262091 - SURFACE
      ?auto_2262092 - SURFACE
      ?auto_2262093 - SURFACE
    )
    :vars
    (
      ?auto_2262094 - HOIST
      ?auto_2262098 - PLACE
      ?auto_2262096 - PLACE
      ?auto_2262099 - HOIST
      ?auto_2262095 - SURFACE
      ?auto_2262097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262094 ?auto_2262098 ) ( IS-CRATE ?auto_2262093 ) ( not ( = ?auto_2262092 ?auto_2262093 ) ) ( not ( = ?auto_2262091 ?auto_2262092 ) ) ( not ( = ?auto_2262091 ?auto_2262093 ) ) ( not ( = ?auto_2262096 ?auto_2262098 ) ) ( HOIST-AT ?auto_2262099 ?auto_2262096 ) ( not ( = ?auto_2262094 ?auto_2262099 ) ) ( AVAILABLE ?auto_2262099 ) ( SURFACE-AT ?auto_2262093 ?auto_2262096 ) ( ON ?auto_2262093 ?auto_2262095 ) ( CLEAR ?auto_2262093 ) ( not ( = ?auto_2262092 ?auto_2262095 ) ) ( not ( = ?auto_2262093 ?auto_2262095 ) ) ( not ( = ?auto_2262091 ?auto_2262095 ) ) ( TRUCK-AT ?auto_2262097 ?auto_2262098 ) ( SURFACE-AT ?auto_2262091 ?auto_2262098 ) ( CLEAR ?auto_2262091 ) ( IS-CRATE ?auto_2262092 ) ( AVAILABLE ?auto_2262094 ) ( IN ?auto_2262092 ?auto_2262097 ) ( ON ?auto_2262089 ?auto_2262088 ) ( ON ?auto_2262090 ?auto_2262089 ) ( ON ?auto_2262091 ?auto_2262090 ) ( not ( = ?auto_2262088 ?auto_2262089 ) ) ( not ( = ?auto_2262088 ?auto_2262090 ) ) ( not ( = ?auto_2262088 ?auto_2262091 ) ) ( not ( = ?auto_2262088 ?auto_2262092 ) ) ( not ( = ?auto_2262088 ?auto_2262093 ) ) ( not ( = ?auto_2262088 ?auto_2262095 ) ) ( not ( = ?auto_2262089 ?auto_2262090 ) ) ( not ( = ?auto_2262089 ?auto_2262091 ) ) ( not ( = ?auto_2262089 ?auto_2262092 ) ) ( not ( = ?auto_2262089 ?auto_2262093 ) ) ( not ( = ?auto_2262089 ?auto_2262095 ) ) ( not ( = ?auto_2262090 ?auto_2262091 ) ) ( not ( = ?auto_2262090 ?auto_2262092 ) ) ( not ( = ?auto_2262090 ?auto_2262093 ) ) ( not ( = ?auto_2262090 ?auto_2262095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262091 ?auto_2262092 ?auto_2262093 )
      ( MAKE-5CRATE-VERIFY ?auto_2262088 ?auto_2262089 ?auto_2262090 ?auto_2262091 ?auto_2262092 ?auto_2262093 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263297 - SURFACE
      ?auto_2263298 - SURFACE
      ?auto_2263299 - SURFACE
      ?auto_2263300 - SURFACE
      ?auto_2263301 - SURFACE
      ?auto_2263302 - SURFACE
      ?auto_2263303 - SURFACE
    )
    :vars
    (
      ?auto_2263305 - HOIST
      ?auto_2263304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263305 ?auto_2263304 ) ( SURFACE-AT ?auto_2263302 ?auto_2263304 ) ( CLEAR ?auto_2263302 ) ( LIFTING ?auto_2263305 ?auto_2263303 ) ( IS-CRATE ?auto_2263303 ) ( not ( = ?auto_2263302 ?auto_2263303 ) ) ( ON ?auto_2263298 ?auto_2263297 ) ( ON ?auto_2263299 ?auto_2263298 ) ( ON ?auto_2263300 ?auto_2263299 ) ( ON ?auto_2263301 ?auto_2263300 ) ( ON ?auto_2263302 ?auto_2263301 ) ( not ( = ?auto_2263297 ?auto_2263298 ) ) ( not ( = ?auto_2263297 ?auto_2263299 ) ) ( not ( = ?auto_2263297 ?auto_2263300 ) ) ( not ( = ?auto_2263297 ?auto_2263301 ) ) ( not ( = ?auto_2263297 ?auto_2263302 ) ) ( not ( = ?auto_2263297 ?auto_2263303 ) ) ( not ( = ?auto_2263298 ?auto_2263299 ) ) ( not ( = ?auto_2263298 ?auto_2263300 ) ) ( not ( = ?auto_2263298 ?auto_2263301 ) ) ( not ( = ?auto_2263298 ?auto_2263302 ) ) ( not ( = ?auto_2263298 ?auto_2263303 ) ) ( not ( = ?auto_2263299 ?auto_2263300 ) ) ( not ( = ?auto_2263299 ?auto_2263301 ) ) ( not ( = ?auto_2263299 ?auto_2263302 ) ) ( not ( = ?auto_2263299 ?auto_2263303 ) ) ( not ( = ?auto_2263300 ?auto_2263301 ) ) ( not ( = ?auto_2263300 ?auto_2263302 ) ) ( not ( = ?auto_2263300 ?auto_2263303 ) ) ( not ( = ?auto_2263301 ?auto_2263302 ) ) ( not ( = ?auto_2263301 ?auto_2263303 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2263302 ?auto_2263303 )
      ( MAKE-6CRATE-VERIFY ?auto_2263297 ?auto_2263298 ?auto_2263299 ?auto_2263300 ?auto_2263301 ?auto_2263302 ?auto_2263303 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263341 - SURFACE
      ?auto_2263342 - SURFACE
      ?auto_2263343 - SURFACE
      ?auto_2263344 - SURFACE
      ?auto_2263345 - SURFACE
      ?auto_2263346 - SURFACE
      ?auto_2263347 - SURFACE
    )
    :vars
    (
      ?auto_2263349 - HOIST
      ?auto_2263348 - PLACE
      ?auto_2263350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263349 ?auto_2263348 ) ( SURFACE-AT ?auto_2263346 ?auto_2263348 ) ( CLEAR ?auto_2263346 ) ( IS-CRATE ?auto_2263347 ) ( not ( = ?auto_2263346 ?auto_2263347 ) ) ( TRUCK-AT ?auto_2263350 ?auto_2263348 ) ( AVAILABLE ?auto_2263349 ) ( IN ?auto_2263347 ?auto_2263350 ) ( ON ?auto_2263346 ?auto_2263345 ) ( not ( = ?auto_2263345 ?auto_2263346 ) ) ( not ( = ?auto_2263345 ?auto_2263347 ) ) ( ON ?auto_2263342 ?auto_2263341 ) ( ON ?auto_2263343 ?auto_2263342 ) ( ON ?auto_2263344 ?auto_2263343 ) ( ON ?auto_2263345 ?auto_2263344 ) ( not ( = ?auto_2263341 ?auto_2263342 ) ) ( not ( = ?auto_2263341 ?auto_2263343 ) ) ( not ( = ?auto_2263341 ?auto_2263344 ) ) ( not ( = ?auto_2263341 ?auto_2263345 ) ) ( not ( = ?auto_2263341 ?auto_2263346 ) ) ( not ( = ?auto_2263341 ?auto_2263347 ) ) ( not ( = ?auto_2263342 ?auto_2263343 ) ) ( not ( = ?auto_2263342 ?auto_2263344 ) ) ( not ( = ?auto_2263342 ?auto_2263345 ) ) ( not ( = ?auto_2263342 ?auto_2263346 ) ) ( not ( = ?auto_2263342 ?auto_2263347 ) ) ( not ( = ?auto_2263343 ?auto_2263344 ) ) ( not ( = ?auto_2263343 ?auto_2263345 ) ) ( not ( = ?auto_2263343 ?auto_2263346 ) ) ( not ( = ?auto_2263343 ?auto_2263347 ) ) ( not ( = ?auto_2263344 ?auto_2263345 ) ) ( not ( = ?auto_2263344 ?auto_2263346 ) ) ( not ( = ?auto_2263344 ?auto_2263347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263345 ?auto_2263346 ?auto_2263347 )
      ( MAKE-6CRATE-VERIFY ?auto_2263341 ?auto_2263342 ?auto_2263343 ?auto_2263344 ?auto_2263345 ?auto_2263346 ?auto_2263347 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263392 - SURFACE
      ?auto_2263393 - SURFACE
      ?auto_2263394 - SURFACE
      ?auto_2263395 - SURFACE
      ?auto_2263396 - SURFACE
      ?auto_2263397 - SURFACE
      ?auto_2263398 - SURFACE
    )
    :vars
    (
      ?auto_2263401 - HOIST
      ?auto_2263399 - PLACE
      ?auto_2263402 - TRUCK
      ?auto_2263400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263401 ?auto_2263399 ) ( SURFACE-AT ?auto_2263397 ?auto_2263399 ) ( CLEAR ?auto_2263397 ) ( IS-CRATE ?auto_2263398 ) ( not ( = ?auto_2263397 ?auto_2263398 ) ) ( AVAILABLE ?auto_2263401 ) ( IN ?auto_2263398 ?auto_2263402 ) ( ON ?auto_2263397 ?auto_2263396 ) ( not ( = ?auto_2263396 ?auto_2263397 ) ) ( not ( = ?auto_2263396 ?auto_2263398 ) ) ( TRUCK-AT ?auto_2263402 ?auto_2263400 ) ( not ( = ?auto_2263400 ?auto_2263399 ) ) ( ON ?auto_2263393 ?auto_2263392 ) ( ON ?auto_2263394 ?auto_2263393 ) ( ON ?auto_2263395 ?auto_2263394 ) ( ON ?auto_2263396 ?auto_2263395 ) ( not ( = ?auto_2263392 ?auto_2263393 ) ) ( not ( = ?auto_2263392 ?auto_2263394 ) ) ( not ( = ?auto_2263392 ?auto_2263395 ) ) ( not ( = ?auto_2263392 ?auto_2263396 ) ) ( not ( = ?auto_2263392 ?auto_2263397 ) ) ( not ( = ?auto_2263392 ?auto_2263398 ) ) ( not ( = ?auto_2263393 ?auto_2263394 ) ) ( not ( = ?auto_2263393 ?auto_2263395 ) ) ( not ( = ?auto_2263393 ?auto_2263396 ) ) ( not ( = ?auto_2263393 ?auto_2263397 ) ) ( not ( = ?auto_2263393 ?auto_2263398 ) ) ( not ( = ?auto_2263394 ?auto_2263395 ) ) ( not ( = ?auto_2263394 ?auto_2263396 ) ) ( not ( = ?auto_2263394 ?auto_2263397 ) ) ( not ( = ?auto_2263394 ?auto_2263398 ) ) ( not ( = ?auto_2263395 ?auto_2263396 ) ) ( not ( = ?auto_2263395 ?auto_2263397 ) ) ( not ( = ?auto_2263395 ?auto_2263398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263396 ?auto_2263397 ?auto_2263398 )
      ( MAKE-6CRATE-VERIFY ?auto_2263392 ?auto_2263393 ?auto_2263394 ?auto_2263395 ?auto_2263396 ?auto_2263397 ?auto_2263398 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263449 - SURFACE
      ?auto_2263450 - SURFACE
      ?auto_2263451 - SURFACE
      ?auto_2263452 - SURFACE
      ?auto_2263453 - SURFACE
      ?auto_2263454 - SURFACE
      ?auto_2263455 - SURFACE
    )
    :vars
    (
      ?auto_2263459 - HOIST
      ?auto_2263460 - PLACE
      ?auto_2263458 - TRUCK
      ?auto_2263457 - PLACE
      ?auto_2263456 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263459 ?auto_2263460 ) ( SURFACE-AT ?auto_2263454 ?auto_2263460 ) ( CLEAR ?auto_2263454 ) ( IS-CRATE ?auto_2263455 ) ( not ( = ?auto_2263454 ?auto_2263455 ) ) ( AVAILABLE ?auto_2263459 ) ( ON ?auto_2263454 ?auto_2263453 ) ( not ( = ?auto_2263453 ?auto_2263454 ) ) ( not ( = ?auto_2263453 ?auto_2263455 ) ) ( TRUCK-AT ?auto_2263458 ?auto_2263457 ) ( not ( = ?auto_2263457 ?auto_2263460 ) ) ( HOIST-AT ?auto_2263456 ?auto_2263457 ) ( LIFTING ?auto_2263456 ?auto_2263455 ) ( not ( = ?auto_2263459 ?auto_2263456 ) ) ( ON ?auto_2263450 ?auto_2263449 ) ( ON ?auto_2263451 ?auto_2263450 ) ( ON ?auto_2263452 ?auto_2263451 ) ( ON ?auto_2263453 ?auto_2263452 ) ( not ( = ?auto_2263449 ?auto_2263450 ) ) ( not ( = ?auto_2263449 ?auto_2263451 ) ) ( not ( = ?auto_2263449 ?auto_2263452 ) ) ( not ( = ?auto_2263449 ?auto_2263453 ) ) ( not ( = ?auto_2263449 ?auto_2263454 ) ) ( not ( = ?auto_2263449 ?auto_2263455 ) ) ( not ( = ?auto_2263450 ?auto_2263451 ) ) ( not ( = ?auto_2263450 ?auto_2263452 ) ) ( not ( = ?auto_2263450 ?auto_2263453 ) ) ( not ( = ?auto_2263450 ?auto_2263454 ) ) ( not ( = ?auto_2263450 ?auto_2263455 ) ) ( not ( = ?auto_2263451 ?auto_2263452 ) ) ( not ( = ?auto_2263451 ?auto_2263453 ) ) ( not ( = ?auto_2263451 ?auto_2263454 ) ) ( not ( = ?auto_2263451 ?auto_2263455 ) ) ( not ( = ?auto_2263452 ?auto_2263453 ) ) ( not ( = ?auto_2263452 ?auto_2263454 ) ) ( not ( = ?auto_2263452 ?auto_2263455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263453 ?auto_2263454 ?auto_2263455 )
      ( MAKE-6CRATE-VERIFY ?auto_2263449 ?auto_2263450 ?auto_2263451 ?auto_2263452 ?auto_2263453 ?auto_2263454 ?auto_2263455 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263512 - SURFACE
      ?auto_2263513 - SURFACE
      ?auto_2263514 - SURFACE
      ?auto_2263515 - SURFACE
      ?auto_2263516 - SURFACE
      ?auto_2263517 - SURFACE
      ?auto_2263518 - SURFACE
    )
    :vars
    (
      ?auto_2263521 - HOIST
      ?auto_2263524 - PLACE
      ?auto_2263520 - TRUCK
      ?auto_2263522 - PLACE
      ?auto_2263519 - HOIST
      ?auto_2263523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263521 ?auto_2263524 ) ( SURFACE-AT ?auto_2263517 ?auto_2263524 ) ( CLEAR ?auto_2263517 ) ( IS-CRATE ?auto_2263518 ) ( not ( = ?auto_2263517 ?auto_2263518 ) ) ( AVAILABLE ?auto_2263521 ) ( ON ?auto_2263517 ?auto_2263516 ) ( not ( = ?auto_2263516 ?auto_2263517 ) ) ( not ( = ?auto_2263516 ?auto_2263518 ) ) ( TRUCK-AT ?auto_2263520 ?auto_2263522 ) ( not ( = ?auto_2263522 ?auto_2263524 ) ) ( HOIST-AT ?auto_2263519 ?auto_2263522 ) ( not ( = ?auto_2263521 ?auto_2263519 ) ) ( AVAILABLE ?auto_2263519 ) ( SURFACE-AT ?auto_2263518 ?auto_2263522 ) ( ON ?auto_2263518 ?auto_2263523 ) ( CLEAR ?auto_2263518 ) ( not ( = ?auto_2263517 ?auto_2263523 ) ) ( not ( = ?auto_2263518 ?auto_2263523 ) ) ( not ( = ?auto_2263516 ?auto_2263523 ) ) ( ON ?auto_2263513 ?auto_2263512 ) ( ON ?auto_2263514 ?auto_2263513 ) ( ON ?auto_2263515 ?auto_2263514 ) ( ON ?auto_2263516 ?auto_2263515 ) ( not ( = ?auto_2263512 ?auto_2263513 ) ) ( not ( = ?auto_2263512 ?auto_2263514 ) ) ( not ( = ?auto_2263512 ?auto_2263515 ) ) ( not ( = ?auto_2263512 ?auto_2263516 ) ) ( not ( = ?auto_2263512 ?auto_2263517 ) ) ( not ( = ?auto_2263512 ?auto_2263518 ) ) ( not ( = ?auto_2263512 ?auto_2263523 ) ) ( not ( = ?auto_2263513 ?auto_2263514 ) ) ( not ( = ?auto_2263513 ?auto_2263515 ) ) ( not ( = ?auto_2263513 ?auto_2263516 ) ) ( not ( = ?auto_2263513 ?auto_2263517 ) ) ( not ( = ?auto_2263513 ?auto_2263518 ) ) ( not ( = ?auto_2263513 ?auto_2263523 ) ) ( not ( = ?auto_2263514 ?auto_2263515 ) ) ( not ( = ?auto_2263514 ?auto_2263516 ) ) ( not ( = ?auto_2263514 ?auto_2263517 ) ) ( not ( = ?auto_2263514 ?auto_2263518 ) ) ( not ( = ?auto_2263514 ?auto_2263523 ) ) ( not ( = ?auto_2263515 ?auto_2263516 ) ) ( not ( = ?auto_2263515 ?auto_2263517 ) ) ( not ( = ?auto_2263515 ?auto_2263518 ) ) ( not ( = ?auto_2263515 ?auto_2263523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263516 ?auto_2263517 ?auto_2263518 )
      ( MAKE-6CRATE-VERIFY ?auto_2263512 ?auto_2263513 ?auto_2263514 ?auto_2263515 ?auto_2263516 ?auto_2263517 ?auto_2263518 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263576 - SURFACE
      ?auto_2263577 - SURFACE
      ?auto_2263578 - SURFACE
      ?auto_2263579 - SURFACE
      ?auto_2263580 - SURFACE
      ?auto_2263581 - SURFACE
      ?auto_2263582 - SURFACE
    )
    :vars
    (
      ?auto_2263587 - HOIST
      ?auto_2263583 - PLACE
      ?auto_2263586 - PLACE
      ?auto_2263584 - HOIST
      ?auto_2263585 - SURFACE
      ?auto_2263588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263587 ?auto_2263583 ) ( SURFACE-AT ?auto_2263581 ?auto_2263583 ) ( CLEAR ?auto_2263581 ) ( IS-CRATE ?auto_2263582 ) ( not ( = ?auto_2263581 ?auto_2263582 ) ) ( AVAILABLE ?auto_2263587 ) ( ON ?auto_2263581 ?auto_2263580 ) ( not ( = ?auto_2263580 ?auto_2263581 ) ) ( not ( = ?auto_2263580 ?auto_2263582 ) ) ( not ( = ?auto_2263586 ?auto_2263583 ) ) ( HOIST-AT ?auto_2263584 ?auto_2263586 ) ( not ( = ?auto_2263587 ?auto_2263584 ) ) ( AVAILABLE ?auto_2263584 ) ( SURFACE-AT ?auto_2263582 ?auto_2263586 ) ( ON ?auto_2263582 ?auto_2263585 ) ( CLEAR ?auto_2263582 ) ( not ( = ?auto_2263581 ?auto_2263585 ) ) ( not ( = ?auto_2263582 ?auto_2263585 ) ) ( not ( = ?auto_2263580 ?auto_2263585 ) ) ( TRUCK-AT ?auto_2263588 ?auto_2263583 ) ( ON ?auto_2263577 ?auto_2263576 ) ( ON ?auto_2263578 ?auto_2263577 ) ( ON ?auto_2263579 ?auto_2263578 ) ( ON ?auto_2263580 ?auto_2263579 ) ( not ( = ?auto_2263576 ?auto_2263577 ) ) ( not ( = ?auto_2263576 ?auto_2263578 ) ) ( not ( = ?auto_2263576 ?auto_2263579 ) ) ( not ( = ?auto_2263576 ?auto_2263580 ) ) ( not ( = ?auto_2263576 ?auto_2263581 ) ) ( not ( = ?auto_2263576 ?auto_2263582 ) ) ( not ( = ?auto_2263576 ?auto_2263585 ) ) ( not ( = ?auto_2263577 ?auto_2263578 ) ) ( not ( = ?auto_2263577 ?auto_2263579 ) ) ( not ( = ?auto_2263577 ?auto_2263580 ) ) ( not ( = ?auto_2263577 ?auto_2263581 ) ) ( not ( = ?auto_2263577 ?auto_2263582 ) ) ( not ( = ?auto_2263577 ?auto_2263585 ) ) ( not ( = ?auto_2263578 ?auto_2263579 ) ) ( not ( = ?auto_2263578 ?auto_2263580 ) ) ( not ( = ?auto_2263578 ?auto_2263581 ) ) ( not ( = ?auto_2263578 ?auto_2263582 ) ) ( not ( = ?auto_2263578 ?auto_2263585 ) ) ( not ( = ?auto_2263579 ?auto_2263580 ) ) ( not ( = ?auto_2263579 ?auto_2263581 ) ) ( not ( = ?auto_2263579 ?auto_2263582 ) ) ( not ( = ?auto_2263579 ?auto_2263585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263580 ?auto_2263581 ?auto_2263582 )
      ( MAKE-6CRATE-VERIFY ?auto_2263576 ?auto_2263577 ?auto_2263578 ?auto_2263579 ?auto_2263580 ?auto_2263581 ?auto_2263582 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263640 - SURFACE
      ?auto_2263641 - SURFACE
      ?auto_2263642 - SURFACE
      ?auto_2263643 - SURFACE
      ?auto_2263644 - SURFACE
      ?auto_2263645 - SURFACE
      ?auto_2263646 - SURFACE
    )
    :vars
    (
      ?auto_2263647 - HOIST
      ?auto_2263651 - PLACE
      ?auto_2263648 - PLACE
      ?auto_2263649 - HOIST
      ?auto_2263650 - SURFACE
      ?auto_2263652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263647 ?auto_2263651 ) ( IS-CRATE ?auto_2263646 ) ( not ( = ?auto_2263645 ?auto_2263646 ) ) ( not ( = ?auto_2263644 ?auto_2263645 ) ) ( not ( = ?auto_2263644 ?auto_2263646 ) ) ( not ( = ?auto_2263648 ?auto_2263651 ) ) ( HOIST-AT ?auto_2263649 ?auto_2263648 ) ( not ( = ?auto_2263647 ?auto_2263649 ) ) ( AVAILABLE ?auto_2263649 ) ( SURFACE-AT ?auto_2263646 ?auto_2263648 ) ( ON ?auto_2263646 ?auto_2263650 ) ( CLEAR ?auto_2263646 ) ( not ( = ?auto_2263645 ?auto_2263650 ) ) ( not ( = ?auto_2263646 ?auto_2263650 ) ) ( not ( = ?auto_2263644 ?auto_2263650 ) ) ( TRUCK-AT ?auto_2263652 ?auto_2263651 ) ( SURFACE-AT ?auto_2263644 ?auto_2263651 ) ( CLEAR ?auto_2263644 ) ( LIFTING ?auto_2263647 ?auto_2263645 ) ( IS-CRATE ?auto_2263645 ) ( ON ?auto_2263641 ?auto_2263640 ) ( ON ?auto_2263642 ?auto_2263641 ) ( ON ?auto_2263643 ?auto_2263642 ) ( ON ?auto_2263644 ?auto_2263643 ) ( not ( = ?auto_2263640 ?auto_2263641 ) ) ( not ( = ?auto_2263640 ?auto_2263642 ) ) ( not ( = ?auto_2263640 ?auto_2263643 ) ) ( not ( = ?auto_2263640 ?auto_2263644 ) ) ( not ( = ?auto_2263640 ?auto_2263645 ) ) ( not ( = ?auto_2263640 ?auto_2263646 ) ) ( not ( = ?auto_2263640 ?auto_2263650 ) ) ( not ( = ?auto_2263641 ?auto_2263642 ) ) ( not ( = ?auto_2263641 ?auto_2263643 ) ) ( not ( = ?auto_2263641 ?auto_2263644 ) ) ( not ( = ?auto_2263641 ?auto_2263645 ) ) ( not ( = ?auto_2263641 ?auto_2263646 ) ) ( not ( = ?auto_2263641 ?auto_2263650 ) ) ( not ( = ?auto_2263642 ?auto_2263643 ) ) ( not ( = ?auto_2263642 ?auto_2263644 ) ) ( not ( = ?auto_2263642 ?auto_2263645 ) ) ( not ( = ?auto_2263642 ?auto_2263646 ) ) ( not ( = ?auto_2263642 ?auto_2263650 ) ) ( not ( = ?auto_2263643 ?auto_2263644 ) ) ( not ( = ?auto_2263643 ?auto_2263645 ) ) ( not ( = ?auto_2263643 ?auto_2263646 ) ) ( not ( = ?auto_2263643 ?auto_2263650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263644 ?auto_2263645 ?auto_2263646 )
      ( MAKE-6CRATE-VERIFY ?auto_2263640 ?auto_2263641 ?auto_2263642 ?auto_2263643 ?auto_2263644 ?auto_2263645 ?auto_2263646 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263704 - SURFACE
      ?auto_2263705 - SURFACE
      ?auto_2263706 - SURFACE
      ?auto_2263707 - SURFACE
      ?auto_2263708 - SURFACE
      ?auto_2263709 - SURFACE
      ?auto_2263710 - SURFACE
    )
    :vars
    (
      ?auto_2263715 - HOIST
      ?auto_2263713 - PLACE
      ?auto_2263714 - PLACE
      ?auto_2263716 - HOIST
      ?auto_2263712 - SURFACE
      ?auto_2263711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263715 ?auto_2263713 ) ( IS-CRATE ?auto_2263710 ) ( not ( = ?auto_2263709 ?auto_2263710 ) ) ( not ( = ?auto_2263708 ?auto_2263709 ) ) ( not ( = ?auto_2263708 ?auto_2263710 ) ) ( not ( = ?auto_2263714 ?auto_2263713 ) ) ( HOIST-AT ?auto_2263716 ?auto_2263714 ) ( not ( = ?auto_2263715 ?auto_2263716 ) ) ( AVAILABLE ?auto_2263716 ) ( SURFACE-AT ?auto_2263710 ?auto_2263714 ) ( ON ?auto_2263710 ?auto_2263712 ) ( CLEAR ?auto_2263710 ) ( not ( = ?auto_2263709 ?auto_2263712 ) ) ( not ( = ?auto_2263710 ?auto_2263712 ) ) ( not ( = ?auto_2263708 ?auto_2263712 ) ) ( TRUCK-AT ?auto_2263711 ?auto_2263713 ) ( SURFACE-AT ?auto_2263708 ?auto_2263713 ) ( CLEAR ?auto_2263708 ) ( IS-CRATE ?auto_2263709 ) ( AVAILABLE ?auto_2263715 ) ( IN ?auto_2263709 ?auto_2263711 ) ( ON ?auto_2263705 ?auto_2263704 ) ( ON ?auto_2263706 ?auto_2263705 ) ( ON ?auto_2263707 ?auto_2263706 ) ( ON ?auto_2263708 ?auto_2263707 ) ( not ( = ?auto_2263704 ?auto_2263705 ) ) ( not ( = ?auto_2263704 ?auto_2263706 ) ) ( not ( = ?auto_2263704 ?auto_2263707 ) ) ( not ( = ?auto_2263704 ?auto_2263708 ) ) ( not ( = ?auto_2263704 ?auto_2263709 ) ) ( not ( = ?auto_2263704 ?auto_2263710 ) ) ( not ( = ?auto_2263704 ?auto_2263712 ) ) ( not ( = ?auto_2263705 ?auto_2263706 ) ) ( not ( = ?auto_2263705 ?auto_2263707 ) ) ( not ( = ?auto_2263705 ?auto_2263708 ) ) ( not ( = ?auto_2263705 ?auto_2263709 ) ) ( not ( = ?auto_2263705 ?auto_2263710 ) ) ( not ( = ?auto_2263705 ?auto_2263712 ) ) ( not ( = ?auto_2263706 ?auto_2263707 ) ) ( not ( = ?auto_2263706 ?auto_2263708 ) ) ( not ( = ?auto_2263706 ?auto_2263709 ) ) ( not ( = ?auto_2263706 ?auto_2263710 ) ) ( not ( = ?auto_2263706 ?auto_2263712 ) ) ( not ( = ?auto_2263707 ?auto_2263708 ) ) ( not ( = ?auto_2263707 ?auto_2263709 ) ) ( not ( = ?auto_2263707 ?auto_2263710 ) ) ( not ( = ?auto_2263707 ?auto_2263712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263708 ?auto_2263709 ?auto_2263710 )
      ( MAKE-6CRATE-VERIFY ?auto_2263704 ?auto_2263705 ?auto_2263706 ?auto_2263707 ?auto_2263708 ?auto_2263709 ?auto_2263710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2264576 - SURFACE
      ?auto_2264577 - SURFACE
    )
    :vars
    (
      ?auto_2264584 - HOIST
      ?auto_2264579 - PLACE
      ?auto_2264578 - SURFACE
      ?auto_2264582 - TRUCK
      ?auto_2264583 - PLACE
      ?auto_2264580 - HOIST
      ?auto_2264581 - SURFACE
      ?auto_2264585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264584 ?auto_2264579 ) ( SURFACE-AT ?auto_2264576 ?auto_2264579 ) ( CLEAR ?auto_2264576 ) ( IS-CRATE ?auto_2264577 ) ( not ( = ?auto_2264576 ?auto_2264577 ) ) ( AVAILABLE ?auto_2264584 ) ( ON ?auto_2264576 ?auto_2264578 ) ( not ( = ?auto_2264578 ?auto_2264576 ) ) ( not ( = ?auto_2264578 ?auto_2264577 ) ) ( TRUCK-AT ?auto_2264582 ?auto_2264583 ) ( not ( = ?auto_2264583 ?auto_2264579 ) ) ( HOIST-AT ?auto_2264580 ?auto_2264583 ) ( not ( = ?auto_2264584 ?auto_2264580 ) ) ( SURFACE-AT ?auto_2264577 ?auto_2264583 ) ( ON ?auto_2264577 ?auto_2264581 ) ( CLEAR ?auto_2264577 ) ( not ( = ?auto_2264576 ?auto_2264581 ) ) ( not ( = ?auto_2264577 ?auto_2264581 ) ) ( not ( = ?auto_2264578 ?auto_2264581 ) ) ( LIFTING ?auto_2264580 ?auto_2264585 ) ( IS-CRATE ?auto_2264585 ) ( not ( = ?auto_2264576 ?auto_2264585 ) ) ( not ( = ?auto_2264577 ?auto_2264585 ) ) ( not ( = ?auto_2264578 ?auto_2264585 ) ) ( not ( = ?auto_2264581 ?auto_2264585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2264580 ?auto_2264585 ?auto_2264582 ?auto_2264583 )
      ( MAKE-1CRATE ?auto_2264576 ?auto_2264577 )
      ( MAKE-1CRATE-VERIFY ?auto_2264576 ?auto_2264577 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2265654 - SURFACE
      ?auto_2265655 - SURFACE
      ?auto_2265656 - SURFACE
      ?auto_2265657 - SURFACE
      ?auto_2265658 - SURFACE
      ?auto_2265659 - SURFACE
      ?auto_2265660 - SURFACE
      ?auto_2265661 - SURFACE
    )
    :vars
    (
      ?auto_2265662 - HOIST
      ?auto_2265663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265662 ?auto_2265663 ) ( SURFACE-AT ?auto_2265660 ?auto_2265663 ) ( CLEAR ?auto_2265660 ) ( LIFTING ?auto_2265662 ?auto_2265661 ) ( IS-CRATE ?auto_2265661 ) ( not ( = ?auto_2265660 ?auto_2265661 ) ) ( ON ?auto_2265655 ?auto_2265654 ) ( ON ?auto_2265656 ?auto_2265655 ) ( ON ?auto_2265657 ?auto_2265656 ) ( ON ?auto_2265658 ?auto_2265657 ) ( ON ?auto_2265659 ?auto_2265658 ) ( ON ?auto_2265660 ?auto_2265659 ) ( not ( = ?auto_2265654 ?auto_2265655 ) ) ( not ( = ?auto_2265654 ?auto_2265656 ) ) ( not ( = ?auto_2265654 ?auto_2265657 ) ) ( not ( = ?auto_2265654 ?auto_2265658 ) ) ( not ( = ?auto_2265654 ?auto_2265659 ) ) ( not ( = ?auto_2265654 ?auto_2265660 ) ) ( not ( = ?auto_2265654 ?auto_2265661 ) ) ( not ( = ?auto_2265655 ?auto_2265656 ) ) ( not ( = ?auto_2265655 ?auto_2265657 ) ) ( not ( = ?auto_2265655 ?auto_2265658 ) ) ( not ( = ?auto_2265655 ?auto_2265659 ) ) ( not ( = ?auto_2265655 ?auto_2265660 ) ) ( not ( = ?auto_2265655 ?auto_2265661 ) ) ( not ( = ?auto_2265656 ?auto_2265657 ) ) ( not ( = ?auto_2265656 ?auto_2265658 ) ) ( not ( = ?auto_2265656 ?auto_2265659 ) ) ( not ( = ?auto_2265656 ?auto_2265660 ) ) ( not ( = ?auto_2265656 ?auto_2265661 ) ) ( not ( = ?auto_2265657 ?auto_2265658 ) ) ( not ( = ?auto_2265657 ?auto_2265659 ) ) ( not ( = ?auto_2265657 ?auto_2265660 ) ) ( not ( = ?auto_2265657 ?auto_2265661 ) ) ( not ( = ?auto_2265658 ?auto_2265659 ) ) ( not ( = ?auto_2265658 ?auto_2265660 ) ) ( not ( = ?auto_2265658 ?auto_2265661 ) ) ( not ( = ?auto_2265659 ?auto_2265660 ) ) ( not ( = ?auto_2265659 ?auto_2265661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2265660 ?auto_2265661 )
      ( MAKE-7CRATE-VERIFY ?auto_2265654 ?auto_2265655 ?auto_2265656 ?auto_2265657 ?auto_2265658 ?auto_2265659 ?auto_2265660 ?auto_2265661 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2265709 - SURFACE
      ?auto_2265710 - SURFACE
      ?auto_2265711 - SURFACE
      ?auto_2265712 - SURFACE
      ?auto_2265713 - SURFACE
      ?auto_2265714 - SURFACE
      ?auto_2265715 - SURFACE
      ?auto_2265716 - SURFACE
    )
    :vars
    (
      ?auto_2265717 - HOIST
      ?auto_2265719 - PLACE
      ?auto_2265718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265717 ?auto_2265719 ) ( SURFACE-AT ?auto_2265715 ?auto_2265719 ) ( CLEAR ?auto_2265715 ) ( IS-CRATE ?auto_2265716 ) ( not ( = ?auto_2265715 ?auto_2265716 ) ) ( TRUCK-AT ?auto_2265718 ?auto_2265719 ) ( AVAILABLE ?auto_2265717 ) ( IN ?auto_2265716 ?auto_2265718 ) ( ON ?auto_2265715 ?auto_2265714 ) ( not ( = ?auto_2265714 ?auto_2265715 ) ) ( not ( = ?auto_2265714 ?auto_2265716 ) ) ( ON ?auto_2265710 ?auto_2265709 ) ( ON ?auto_2265711 ?auto_2265710 ) ( ON ?auto_2265712 ?auto_2265711 ) ( ON ?auto_2265713 ?auto_2265712 ) ( ON ?auto_2265714 ?auto_2265713 ) ( not ( = ?auto_2265709 ?auto_2265710 ) ) ( not ( = ?auto_2265709 ?auto_2265711 ) ) ( not ( = ?auto_2265709 ?auto_2265712 ) ) ( not ( = ?auto_2265709 ?auto_2265713 ) ) ( not ( = ?auto_2265709 ?auto_2265714 ) ) ( not ( = ?auto_2265709 ?auto_2265715 ) ) ( not ( = ?auto_2265709 ?auto_2265716 ) ) ( not ( = ?auto_2265710 ?auto_2265711 ) ) ( not ( = ?auto_2265710 ?auto_2265712 ) ) ( not ( = ?auto_2265710 ?auto_2265713 ) ) ( not ( = ?auto_2265710 ?auto_2265714 ) ) ( not ( = ?auto_2265710 ?auto_2265715 ) ) ( not ( = ?auto_2265710 ?auto_2265716 ) ) ( not ( = ?auto_2265711 ?auto_2265712 ) ) ( not ( = ?auto_2265711 ?auto_2265713 ) ) ( not ( = ?auto_2265711 ?auto_2265714 ) ) ( not ( = ?auto_2265711 ?auto_2265715 ) ) ( not ( = ?auto_2265711 ?auto_2265716 ) ) ( not ( = ?auto_2265712 ?auto_2265713 ) ) ( not ( = ?auto_2265712 ?auto_2265714 ) ) ( not ( = ?auto_2265712 ?auto_2265715 ) ) ( not ( = ?auto_2265712 ?auto_2265716 ) ) ( not ( = ?auto_2265713 ?auto_2265714 ) ) ( not ( = ?auto_2265713 ?auto_2265715 ) ) ( not ( = ?auto_2265713 ?auto_2265716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2265714 ?auto_2265715 ?auto_2265716 )
      ( MAKE-7CRATE-VERIFY ?auto_2265709 ?auto_2265710 ?auto_2265711 ?auto_2265712 ?auto_2265713 ?auto_2265714 ?auto_2265715 ?auto_2265716 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2265772 - SURFACE
      ?auto_2265773 - SURFACE
      ?auto_2265774 - SURFACE
      ?auto_2265775 - SURFACE
      ?auto_2265776 - SURFACE
      ?auto_2265777 - SURFACE
      ?auto_2265778 - SURFACE
      ?auto_2265779 - SURFACE
    )
    :vars
    (
      ?auto_2265783 - HOIST
      ?auto_2265782 - PLACE
      ?auto_2265781 - TRUCK
      ?auto_2265780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265783 ?auto_2265782 ) ( SURFACE-AT ?auto_2265778 ?auto_2265782 ) ( CLEAR ?auto_2265778 ) ( IS-CRATE ?auto_2265779 ) ( not ( = ?auto_2265778 ?auto_2265779 ) ) ( AVAILABLE ?auto_2265783 ) ( IN ?auto_2265779 ?auto_2265781 ) ( ON ?auto_2265778 ?auto_2265777 ) ( not ( = ?auto_2265777 ?auto_2265778 ) ) ( not ( = ?auto_2265777 ?auto_2265779 ) ) ( TRUCK-AT ?auto_2265781 ?auto_2265780 ) ( not ( = ?auto_2265780 ?auto_2265782 ) ) ( ON ?auto_2265773 ?auto_2265772 ) ( ON ?auto_2265774 ?auto_2265773 ) ( ON ?auto_2265775 ?auto_2265774 ) ( ON ?auto_2265776 ?auto_2265775 ) ( ON ?auto_2265777 ?auto_2265776 ) ( not ( = ?auto_2265772 ?auto_2265773 ) ) ( not ( = ?auto_2265772 ?auto_2265774 ) ) ( not ( = ?auto_2265772 ?auto_2265775 ) ) ( not ( = ?auto_2265772 ?auto_2265776 ) ) ( not ( = ?auto_2265772 ?auto_2265777 ) ) ( not ( = ?auto_2265772 ?auto_2265778 ) ) ( not ( = ?auto_2265772 ?auto_2265779 ) ) ( not ( = ?auto_2265773 ?auto_2265774 ) ) ( not ( = ?auto_2265773 ?auto_2265775 ) ) ( not ( = ?auto_2265773 ?auto_2265776 ) ) ( not ( = ?auto_2265773 ?auto_2265777 ) ) ( not ( = ?auto_2265773 ?auto_2265778 ) ) ( not ( = ?auto_2265773 ?auto_2265779 ) ) ( not ( = ?auto_2265774 ?auto_2265775 ) ) ( not ( = ?auto_2265774 ?auto_2265776 ) ) ( not ( = ?auto_2265774 ?auto_2265777 ) ) ( not ( = ?auto_2265774 ?auto_2265778 ) ) ( not ( = ?auto_2265774 ?auto_2265779 ) ) ( not ( = ?auto_2265775 ?auto_2265776 ) ) ( not ( = ?auto_2265775 ?auto_2265777 ) ) ( not ( = ?auto_2265775 ?auto_2265778 ) ) ( not ( = ?auto_2265775 ?auto_2265779 ) ) ( not ( = ?auto_2265776 ?auto_2265777 ) ) ( not ( = ?auto_2265776 ?auto_2265778 ) ) ( not ( = ?auto_2265776 ?auto_2265779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2265777 ?auto_2265778 ?auto_2265779 )
      ( MAKE-7CRATE-VERIFY ?auto_2265772 ?auto_2265773 ?auto_2265774 ?auto_2265775 ?auto_2265776 ?auto_2265777 ?auto_2265778 ?auto_2265779 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2265842 - SURFACE
      ?auto_2265843 - SURFACE
      ?auto_2265844 - SURFACE
      ?auto_2265845 - SURFACE
      ?auto_2265846 - SURFACE
      ?auto_2265847 - SURFACE
      ?auto_2265848 - SURFACE
      ?auto_2265849 - SURFACE
    )
    :vars
    (
      ?auto_2265853 - HOIST
      ?auto_2265850 - PLACE
      ?auto_2265854 - TRUCK
      ?auto_2265851 - PLACE
      ?auto_2265852 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265853 ?auto_2265850 ) ( SURFACE-AT ?auto_2265848 ?auto_2265850 ) ( CLEAR ?auto_2265848 ) ( IS-CRATE ?auto_2265849 ) ( not ( = ?auto_2265848 ?auto_2265849 ) ) ( AVAILABLE ?auto_2265853 ) ( ON ?auto_2265848 ?auto_2265847 ) ( not ( = ?auto_2265847 ?auto_2265848 ) ) ( not ( = ?auto_2265847 ?auto_2265849 ) ) ( TRUCK-AT ?auto_2265854 ?auto_2265851 ) ( not ( = ?auto_2265851 ?auto_2265850 ) ) ( HOIST-AT ?auto_2265852 ?auto_2265851 ) ( LIFTING ?auto_2265852 ?auto_2265849 ) ( not ( = ?auto_2265853 ?auto_2265852 ) ) ( ON ?auto_2265843 ?auto_2265842 ) ( ON ?auto_2265844 ?auto_2265843 ) ( ON ?auto_2265845 ?auto_2265844 ) ( ON ?auto_2265846 ?auto_2265845 ) ( ON ?auto_2265847 ?auto_2265846 ) ( not ( = ?auto_2265842 ?auto_2265843 ) ) ( not ( = ?auto_2265842 ?auto_2265844 ) ) ( not ( = ?auto_2265842 ?auto_2265845 ) ) ( not ( = ?auto_2265842 ?auto_2265846 ) ) ( not ( = ?auto_2265842 ?auto_2265847 ) ) ( not ( = ?auto_2265842 ?auto_2265848 ) ) ( not ( = ?auto_2265842 ?auto_2265849 ) ) ( not ( = ?auto_2265843 ?auto_2265844 ) ) ( not ( = ?auto_2265843 ?auto_2265845 ) ) ( not ( = ?auto_2265843 ?auto_2265846 ) ) ( not ( = ?auto_2265843 ?auto_2265847 ) ) ( not ( = ?auto_2265843 ?auto_2265848 ) ) ( not ( = ?auto_2265843 ?auto_2265849 ) ) ( not ( = ?auto_2265844 ?auto_2265845 ) ) ( not ( = ?auto_2265844 ?auto_2265846 ) ) ( not ( = ?auto_2265844 ?auto_2265847 ) ) ( not ( = ?auto_2265844 ?auto_2265848 ) ) ( not ( = ?auto_2265844 ?auto_2265849 ) ) ( not ( = ?auto_2265845 ?auto_2265846 ) ) ( not ( = ?auto_2265845 ?auto_2265847 ) ) ( not ( = ?auto_2265845 ?auto_2265848 ) ) ( not ( = ?auto_2265845 ?auto_2265849 ) ) ( not ( = ?auto_2265846 ?auto_2265847 ) ) ( not ( = ?auto_2265846 ?auto_2265848 ) ) ( not ( = ?auto_2265846 ?auto_2265849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2265847 ?auto_2265848 ?auto_2265849 )
      ( MAKE-7CRATE-VERIFY ?auto_2265842 ?auto_2265843 ?auto_2265844 ?auto_2265845 ?auto_2265846 ?auto_2265847 ?auto_2265848 ?auto_2265849 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2265919 - SURFACE
      ?auto_2265920 - SURFACE
      ?auto_2265921 - SURFACE
      ?auto_2265922 - SURFACE
      ?auto_2265923 - SURFACE
      ?auto_2265924 - SURFACE
      ?auto_2265925 - SURFACE
      ?auto_2265926 - SURFACE
    )
    :vars
    (
      ?auto_2265932 - HOIST
      ?auto_2265931 - PLACE
      ?auto_2265928 - TRUCK
      ?auto_2265930 - PLACE
      ?auto_2265929 - HOIST
      ?auto_2265927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265932 ?auto_2265931 ) ( SURFACE-AT ?auto_2265925 ?auto_2265931 ) ( CLEAR ?auto_2265925 ) ( IS-CRATE ?auto_2265926 ) ( not ( = ?auto_2265925 ?auto_2265926 ) ) ( AVAILABLE ?auto_2265932 ) ( ON ?auto_2265925 ?auto_2265924 ) ( not ( = ?auto_2265924 ?auto_2265925 ) ) ( not ( = ?auto_2265924 ?auto_2265926 ) ) ( TRUCK-AT ?auto_2265928 ?auto_2265930 ) ( not ( = ?auto_2265930 ?auto_2265931 ) ) ( HOIST-AT ?auto_2265929 ?auto_2265930 ) ( not ( = ?auto_2265932 ?auto_2265929 ) ) ( AVAILABLE ?auto_2265929 ) ( SURFACE-AT ?auto_2265926 ?auto_2265930 ) ( ON ?auto_2265926 ?auto_2265927 ) ( CLEAR ?auto_2265926 ) ( not ( = ?auto_2265925 ?auto_2265927 ) ) ( not ( = ?auto_2265926 ?auto_2265927 ) ) ( not ( = ?auto_2265924 ?auto_2265927 ) ) ( ON ?auto_2265920 ?auto_2265919 ) ( ON ?auto_2265921 ?auto_2265920 ) ( ON ?auto_2265922 ?auto_2265921 ) ( ON ?auto_2265923 ?auto_2265922 ) ( ON ?auto_2265924 ?auto_2265923 ) ( not ( = ?auto_2265919 ?auto_2265920 ) ) ( not ( = ?auto_2265919 ?auto_2265921 ) ) ( not ( = ?auto_2265919 ?auto_2265922 ) ) ( not ( = ?auto_2265919 ?auto_2265923 ) ) ( not ( = ?auto_2265919 ?auto_2265924 ) ) ( not ( = ?auto_2265919 ?auto_2265925 ) ) ( not ( = ?auto_2265919 ?auto_2265926 ) ) ( not ( = ?auto_2265919 ?auto_2265927 ) ) ( not ( = ?auto_2265920 ?auto_2265921 ) ) ( not ( = ?auto_2265920 ?auto_2265922 ) ) ( not ( = ?auto_2265920 ?auto_2265923 ) ) ( not ( = ?auto_2265920 ?auto_2265924 ) ) ( not ( = ?auto_2265920 ?auto_2265925 ) ) ( not ( = ?auto_2265920 ?auto_2265926 ) ) ( not ( = ?auto_2265920 ?auto_2265927 ) ) ( not ( = ?auto_2265921 ?auto_2265922 ) ) ( not ( = ?auto_2265921 ?auto_2265923 ) ) ( not ( = ?auto_2265921 ?auto_2265924 ) ) ( not ( = ?auto_2265921 ?auto_2265925 ) ) ( not ( = ?auto_2265921 ?auto_2265926 ) ) ( not ( = ?auto_2265921 ?auto_2265927 ) ) ( not ( = ?auto_2265922 ?auto_2265923 ) ) ( not ( = ?auto_2265922 ?auto_2265924 ) ) ( not ( = ?auto_2265922 ?auto_2265925 ) ) ( not ( = ?auto_2265922 ?auto_2265926 ) ) ( not ( = ?auto_2265922 ?auto_2265927 ) ) ( not ( = ?auto_2265923 ?auto_2265924 ) ) ( not ( = ?auto_2265923 ?auto_2265925 ) ) ( not ( = ?auto_2265923 ?auto_2265926 ) ) ( not ( = ?auto_2265923 ?auto_2265927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2265924 ?auto_2265925 ?auto_2265926 )
      ( MAKE-7CRATE-VERIFY ?auto_2265919 ?auto_2265920 ?auto_2265921 ?auto_2265922 ?auto_2265923 ?auto_2265924 ?auto_2265925 ?auto_2265926 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2265997 - SURFACE
      ?auto_2265998 - SURFACE
      ?auto_2265999 - SURFACE
      ?auto_2266000 - SURFACE
      ?auto_2266001 - SURFACE
      ?auto_2266002 - SURFACE
      ?auto_2266003 - SURFACE
      ?auto_2266004 - SURFACE
    )
    :vars
    (
      ?auto_2266009 - HOIST
      ?auto_2266007 - PLACE
      ?auto_2266005 - PLACE
      ?auto_2266008 - HOIST
      ?auto_2266006 - SURFACE
      ?auto_2266010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266009 ?auto_2266007 ) ( SURFACE-AT ?auto_2266003 ?auto_2266007 ) ( CLEAR ?auto_2266003 ) ( IS-CRATE ?auto_2266004 ) ( not ( = ?auto_2266003 ?auto_2266004 ) ) ( AVAILABLE ?auto_2266009 ) ( ON ?auto_2266003 ?auto_2266002 ) ( not ( = ?auto_2266002 ?auto_2266003 ) ) ( not ( = ?auto_2266002 ?auto_2266004 ) ) ( not ( = ?auto_2266005 ?auto_2266007 ) ) ( HOIST-AT ?auto_2266008 ?auto_2266005 ) ( not ( = ?auto_2266009 ?auto_2266008 ) ) ( AVAILABLE ?auto_2266008 ) ( SURFACE-AT ?auto_2266004 ?auto_2266005 ) ( ON ?auto_2266004 ?auto_2266006 ) ( CLEAR ?auto_2266004 ) ( not ( = ?auto_2266003 ?auto_2266006 ) ) ( not ( = ?auto_2266004 ?auto_2266006 ) ) ( not ( = ?auto_2266002 ?auto_2266006 ) ) ( TRUCK-AT ?auto_2266010 ?auto_2266007 ) ( ON ?auto_2265998 ?auto_2265997 ) ( ON ?auto_2265999 ?auto_2265998 ) ( ON ?auto_2266000 ?auto_2265999 ) ( ON ?auto_2266001 ?auto_2266000 ) ( ON ?auto_2266002 ?auto_2266001 ) ( not ( = ?auto_2265997 ?auto_2265998 ) ) ( not ( = ?auto_2265997 ?auto_2265999 ) ) ( not ( = ?auto_2265997 ?auto_2266000 ) ) ( not ( = ?auto_2265997 ?auto_2266001 ) ) ( not ( = ?auto_2265997 ?auto_2266002 ) ) ( not ( = ?auto_2265997 ?auto_2266003 ) ) ( not ( = ?auto_2265997 ?auto_2266004 ) ) ( not ( = ?auto_2265997 ?auto_2266006 ) ) ( not ( = ?auto_2265998 ?auto_2265999 ) ) ( not ( = ?auto_2265998 ?auto_2266000 ) ) ( not ( = ?auto_2265998 ?auto_2266001 ) ) ( not ( = ?auto_2265998 ?auto_2266002 ) ) ( not ( = ?auto_2265998 ?auto_2266003 ) ) ( not ( = ?auto_2265998 ?auto_2266004 ) ) ( not ( = ?auto_2265998 ?auto_2266006 ) ) ( not ( = ?auto_2265999 ?auto_2266000 ) ) ( not ( = ?auto_2265999 ?auto_2266001 ) ) ( not ( = ?auto_2265999 ?auto_2266002 ) ) ( not ( = ?auto_2265999 ?auto_2266003 ) ) ( not ( = ?auto_2265999 ?auto_2266004 ) ) ( not ( = ?auto_2265999 ?auto_2266006 ) ) ( not ( = ?auto_2266000 ?auto_2266001 ) ) ( not ( = ?auto_2266000 ?auto_2266002 ) ) ( not ( = ?auto_2266000 ?auto_2266003 ) ) ( not ( = ?auto_2266000 ?auto_2266004 ) ) ( not ( = ?auto_2266000 ?auto_2266006 ) ) ( not ( = ?auto_2266001 ?auto_2266002 ) ) ( not ( = ?auto_2266001 ?auto_2266003 ) ) ( not ( = ?auto_2266001 ?auto_2266004 ) ) ( not ( = ?auto_2266001 ?auto_2266006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266002 ?auto_2266003 ?auto_2266004 )
      ( MAKE-7CRATE-VERIFY ?auto_2265997 ?auto_2265998 ?auto_2265999 ?auto_2266000 ?auto_2266001 ?auto_2266002 ?auto_2266003 ?auto_2266004 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266075 - SURFACE
      ?auto_2266076 - SURFACE
      ?auto_2266077 - SURFACE
      ?auto_2266078 - SURFACE
      ?auto_2266079 - SURFACE
      ?auto_2266080 - SURFACE
      ?auto_2266081 - SURFACE
      ?auto_2266082 - SURFACE
    )
    :vars
    (
      ?auto_2266083 - HOIST
      ?auto_2266087 - PLACE
      ?auto_2266088 - PLACE
      ?auto_2266086 - HOIST
      ?auto_2266084 - SURFACE
      ?auto_2266085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266083 ?auto_2266087 ) ( IS-CRATE ?auto_2266082 ) ( not ( = ?auto_2266081 ?auto_2266082 ) ) ( not ( = ?auto_2266080 ?auto_2266081 ) ) ( not ( = ?auto_2266080 ?auto_2266082 ) ) ( not ( = ?auto_2266088 ?auto_2266087 ) ) ( HOIST-AT ?auto_2266086 ?auto_2266088 ) ( not ( = ?auto_2266083 ?auto_2266086 ) ) ( AVAILABLE ?auto_2266086 ) ( SURFACE-AT ?auto_2266082 ?auto_2266088 ) ( ON ?auto_2266082 ?auto_2266084 ) ( CLEAR ?auto_2266082 ) ( not ( = ?auto_2266081 ?auto_2266084 ) ) ( not ( = ?auto_2266082 ?auto_2266084 ) ) ( not ( = ?auto_2266080 ?auto_2266084 ) ) ( TRUCK-AT ?auto_2266085 ?auto_2266087 ) ( SURFACE-AT ?auto_2266080 ?auto_2266087 ) ( CLEAR ?auto_2266080 ) ( LIFTING ?auto_2266083 ?auto_2266081 ) ( IS-CRATE ?auto_2266081 ) ( ON ?auto_2266076 ?auto_2266075 ) ( ON ?auto_2266077 ?auto_2266076 ) ( ON ?auto_2266078 ?auto_2266077 ) ( ON ?auto_2266079 ?auto_2266078 ) ( ON ?auto_2266080 ?auto_2266079 ) ( not ( = ?auto_2266075 ?auto_2266076 ) ) ( not ( = ?auto_2266075 ?auto_2266077 ) ) ( not ( = ?auto_2266075 ?auto_2266078 ) ) ( not ( = ?auto_2266075 ?auto_2266079 ) ) ( not ( = ?auto_2266075 ?auto_2266080 ) ) ( not ( = ?auto_2266075 ?auto_2266081 ) ) ( not ( = ?auto_2266075 ?auto_2266082 ) ) ( not ( = ?auto_2266075 ?auto_2266084 ) ) ( not ( = ?auto_2266076 ?auto_2266077 ) ) ( not ( = ?auto_2266076 ?auto_2266078 ) ) ( not ( = ?auto_2266076 ?auto_2266079 ) ) ( not ( = ?auto_2266076 ?auto_2266080 ) ) ( not ( = ?auto_2266076 ?auto_2266081 ) ) ( not ( = ?auto_2266076 ?auto_2266082 ) ) ( not ( = ?auto_2266076 ?auto_2266084 ) ) ( not ( = ?auto_2266077 ?auto_2266078 ) ) ( not ( = ?auto_2266077 ?auto_2266079 ) ) ( not ( = ?auto_2266077 ?auto_2266080 ) ) ( not ( = ?auto_2266077 ?auto_2266081 ) ) ( not ( = ?auto_2266077 ?auto_2266082 ) ) ( not ( = ?auto_2266077 ?auto_2266084 ) ) ( not ( = ?auto_2266078 ?auto_2266079 ) ) ( not ( = ?auto_2266078 ?auto_2266080 ) ) ( not ( = ?auto_2266078 ?auto_2266081 ) ) ( not ( = ?auto_2266078 ?auto_2266082 ) ) ( not ( = ?auto_2266078 ?auto_2266084 ) ) ( not ( = ?auto_2266079 ?auto_2266080 ) ) ( not ( = ?auto_2266079 ?auto_2266081 ) ) ( not ( = ?auto_2266079 ?auto_2266082 ) ) ( not ( = ?auto_2266079 ?auto_2266084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266080 ?auto_2266081 ?auto_2266082 )
      ( MAKE-7CRATE-VERIFY ?auto_2266075 ?auto_2266076 ?auto_2266077 ?auto_2266078 ?auto_2266079 ?auto_2266080 ?auto_2266081 ?auto_2266082 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266153 - SURFACE
      ?auto_2266154 - SURFACE
      ?auto_2266155 - SURFACE
      ?auto_2266156 - SURFACE
      ?auto_2266157 - SURFACE
      ?auto_2266158 - SURFACE
      ?auto_2266159 - SURFACE
      ?auto_2266160 - SURFACE
    )
    :vars
    (
      ?auto_2266165 - HOIST
      ?auto_2266166 - PLACE
      ?auto_2266162 - PLACE
      ?auto_2266164 - HOIST
      ?auto_2266161 - SURFACE
      ?auto_2266163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266165 ?auto_2266166 ) ( IS-CRATE ?auto_2266160 ) ( not ( = ?auto_2266159 ?auto_2266160 ) ) ( not ( = ?auto_2266158 ?auto_2266159 ) ) ( not ( = ?auto_2266158 ?auto_2266160 ) ) ( not ( = ?auto_2266162 ?auto_2266166 ) ) ( HOIST-AT ?auto_2266164 ?auto_2266162 ) ( not ( = ?auto_2266165 ?auto_2266164 ) ) ( AVAILABLE ?auto_2266164 ) ( SURFACE-AT ?auto_2266160 ?auto_2266162 ) ( ON ?auto_2266160 ?auto_2266161 ) ( CLEAR ?auto_2266160 ) ( not ( = ?auto_2266159 ?auto_2266161 ) ) ( not ( = ?auto_2266160 ?auto_2266161 ) ) ( not ( = ?auto_2266158 ?auto_2266161 ) ) ( TRUCK-AT ?auto_2266163 ?auto_2266166 ) ( SURFACE-AT ?auto_2266158 ?auto_2266166 ) ( CLEAR ?auto_2266158 ) ( IS-CRATE ?auto_2266159 ) ( AVAILABLE ?auto_2266165 ) ( IN ?auto_2266159 ?auto_2266163 ) ( ON ?auto_2266154 ?auto_2266153 ) ( ON ?auto_2266155 ?auto_2266154 ) ( ON ?auto_2266156 ?auto_2266155 ) ( ON ?auto_2266157 ?auto_2266156 ) ( ON ?auto_2266158 ?auto_2266157 ) ( not ( = ?auto_2266153 ?auto_2266154 ) ) ( not ( = ?auto_2266153 ?auto_2266155 ) ) ( not ( = ?auto_2266153 ?auto_2266156 ) ) ( not ( = ?auto_2266153 ?auto_2266157 ) ) ( not ( = ?auto_2266153 ?auto_2266158 ) ) ( not ( = ?auto_2266153 ?auto_2266159 ) ) ( not ( = ?auto_2266153 ?auto_2266160 ) ) ( not ( = ?auto_2266153 ?auto_2266161 ) ) ( not ( = ?auto_2266154 ?auto_2266155 ) ) ( not ( = ?auto_2266154 ?auto_2266156 ) ) ( not ( = ?auto_2266154 ?auto_2266157 ) ) ( not ( = ?auto_2266154 ?auto_2266158 ) ) ( not ( = ?auto_2266154 ?auto_2266159 ) ) ( not ( = ?auto_2266154 ?auto_2266160 ) ) ( not ( = ?auto_2266154 ?auto_2266161 ) ) ( not ( = ?auto_2266155 ?auto_2266156 ) ) ( not ( = ?auto_2266155 ?auto_2266157 ) ) ( not ( = ?auto_2266155 ?auto_2266158 ) ) ( not ( = ?auto_2266155 ?auto_2266159 ) ) ( not ( = ?auto_2266155 ?auto_2266160 ) ) ( not ( = ?auto_2266155 ?auto_2266161 ) ) ( not ( = ?auto_2266156 ?auto_2266157 ) ) ( not ( = ?auto_2266156 ?auto_2266158 ) ) ( not ( = ?auto_2266156 ?auto_2266159 ) ) ( not ( = ?auto_2266156 ?auto_2266160 ) ) ( not ( = ?auto_2266156 ?auto_2266161 ) ) ( not ( = ?auto_2266157 ?auto_2266158 ) ) ( not ( = ?auto_2266157 ?auto_2266159 ) ) ( not ( = ?auto_2266157 ?auto_2266160 ) ) ( not ( = ?auto_2266157 ?auto_2266161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266158 ?auto_2266159 ?auto_2266160 )
      ( MAKE-7CRATE-VERIFY ?auto_2266153 ?auto_2266154 ?auto_2266155 ?auto_2266156 ?auto_2266157 ?auto_2266158 ?auto_2266159 ?auto_2266160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2267728 - SURFACE
      ?auto_2267729 - SURFACE
    )
    :vars
    (
      ?auto_2267734 - HOIST
      ?auto_2267736 - PLACE
      ?auto_2267732 - SURFACE
      ?auto_2267730 - PLACE
      ?auto_2267733 - HOIST
      ?auto_2267731 - SURFACE
      ?auto_2267735 - TRUCK
      ?auto_2267737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267734 ?auto_2267736 ) ( SURFACE-AT ?auto_2267728 ?auto_2267736 ) ( CLEAR ?auto_2267728 ) ( IS-CRATE ?auto_2267729 ) ( not ( = ?auto_2267728 ?auto_2267729 ) ) ( ON ?auto_2267728 ?auto_2267732 ) ( not ( = ?auto_2267732 ?auto_2267728 ) ) ( not ( = ?auto_2267732 ?auto_2267729 ) ) ( not ( = ?auto_2267730 ?auto_2267736 ) ) ( HOIST-AT ?auto_2267733 ?auto_2267730 ) ( not ( = ?auto_2267734 ?auto_2267733 ) ) ( AVAILABLE ?auto_2267733 ) ( SURFACE-AT ?auto_2267729 ?auto_2267730 ) ( ON ?auto_2267729 ?auto_2267731 ) ( CLEAR ?auto_2267729 ) ( not ( = ?auto_2267728 ?auto_2267731 ) ) ( not ( = ?auto_2267729 ?auto_2267731 ) ) ( not ( = ?auto_2267732 ?auto_2267731 ) ) ( TRUCK-AT ?auto_2267735 ?auto_2267736 ) ( LIFTING ?auto_2267734 ?auto_2267737 ) ( IS-CRATE ?auto_2267737 ) ( not ( = ?auto_2267728 ?auto_2267737 ) ) ( not ( = ?auto_2267729 ?auto_2267737 ) ) ( not ( = ?auto_2267732 ?auto_2267737 ) ) ( not ( = ?auto_2267731 ?auto_2267737 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2267734 ?auto_2267737 ?auto_2267735 ?auto_2267736 )
      ( MAKE-1CRATE ?auto_2267728 ?auto_2267729 )
      ( MAKE-1CRATE-VERIFY ?auto_2267728 ?auto_2267729 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269064 - SURFACE
      ?auto_2269065 - SURFACE
      ?auto_2269066 - SURFACE
      ?auto_2269067 - SURFACE
      ?auto_2269068 - SURFACE
      ?auto_2269069 - SURFACE
      ?auto_2269070 - SURFACE
      ?auto_2269071 - SURFACE
      ?auto_2269072 - SURFACE
    )
    :vars
    (
      ?auto_2269074 - HOIST
      ?auto_2269073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269074 ?auto_2269073 ) ( SURFACE-AT ?auto_2269071 ?auto_2269073 ) ( CLEAR ?auto_2269071 ) ( LIFTING ?auto_2269074 ?auto_2269072 ) ( IS-CRATE ?auto_2269072 ) ( not ( = ?auto_2269071 ?auto_2269072 ) ) ( ON ?auto_2269065 ?auto_2269064 ) ( ON ?auto_2269066 ?auto_2269065 ) ( ON ?auto_2269067 ?auto_2269066 ) ( ON ?auto_2269068 ?auto_2269067 ) ( ON ?auto_2269069 ?auto_2269068 ) ( ON ?auto_2269070 ?auto_2269069 ) ( ON ?auto_2269071 ?auto_2269070 ) ( not ( = ?auto_2269064 ?auto_2269065 ) ) ( not ( = ?auto_2269064 ?auto_2269066 ) ) ( not ( = ?auto_2269064 ?auto_2269067 ) ) ( not ( = ?auto_2269064 ?auto_2269068 ) ) ( not ( = ?auto_2269064 ?auto_2269069 ) ) ( not ( = ?auto_2269064 ?auto_2269070 ) ) ( not ( = ?auto_2269064 ?auto_2269071 ) ) ( not ( = ?auto_2269064 ?auto_2269072 ) ) ( not ( = ?auto_2269065 ?auto_2269066 ) ) ( not ( = ?auto_2269065 ?auto_2269067 ) ) ( not ( = ?auto_2269065 ?auto_2269068 ) ) ( not ( = ?auto_2269065 ?auto_2269069 ) ) ( not ( = ?auto_2269065 ?auto_2269070 ) ) ( not ( = ?auto_2269065 ?auto_2269071 ) ) ( not ( = ?auto_2269065 ?auto_2269072 ) ) ( not ( = ?auto_2269066 ?auto_2269067 ) ) ( not ( = ?auto_2269066 ?auto_2269068 ) ) ( not ( = ?auto_2269066 ?auto_2269069 ) ) ( not ( = ?auto_2269066 ?auto_2269070 ) ) ( not ( = ?auto_2269066 ?auto_2269071 ) ) ( not ( = ?auto_2269066 ?auto_2269072 ) ) ( not ( = ?auto_2269067 ?auto_2269068 ) ) ( not ( = ?auto_2269067 ?auto_2269069 ) ) ( not ( = ?auto_2269067 ?auto_2269070 ) ) ( not ( = ?auto_2269067 ?auto_2269071 ) ) ( not ( = ?auto_2269067 ?auto_2269072 ) ) ( not ( = ?auto_2269068 ?auto_2269069 ) ) ( not ( = ?auto_2269068 ?auto_2269070 ) ) ( not ( = ?auto_2269068 ?auto_2269071 ) ) ( not ( = ?auto_2269068 ?auto_2269072 ) ) ( not ( = ?auto_2269069 ?auto_2269070 ) ) ( not ( = ?auto_2269069 ?auto_2269071 ) ) ( not ( = ?auto_2269069 ?auto_2269072 ) ) ( not ( = ?auto_2269070 ?auto_2269071 ) ) ( not ( = ?auto_2269070 ?auto_2269072 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2269071 ?auto_2269072 )
      ( MAKE-8CRATE-VERIFY ?auto_2269064 ?auto_2269065 ?auto_2269066 ?auto_2269067 ?auto_2269068 ?auto_2269069 ?auto_2269070 ?auto_2269071 ?auto_2269072 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269131 - SURFACE
      ?auto_2269132 - SURFACE
      ?auto_2269133 - SURFACE
      ?auto_2269134 - SURFACE
      ?auto_2269135 - SURFACE
      ?auto_2269136 - SURFACE
      ?auto_2269137 - SURFACE
      ?auto_2269138 - SURFACE
      ?auto_2269139 - SURFACE
    )
    :vars
    (
      ?auto_2269141 - HOIST
      ?auto_2269142 - PLACE
      ?auto_2269140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269141 ?auto_2269142 ) ( SURFACE-AT ?auto_2269138 ?auto_2269142 ) ( CLEAR ?auto_2269138 ) ( IS-CRATE ?auto_2269139 ) ( not ( = ?auto_2269138 ?auto_2269139 ) ) ( TRUCK-AT ?auto_2269140 ?auto_2269142 ) ( AVAILABLE ?auto_2269141 ) ( IN ?auto_2269139 ?auto_2269140 ) ( ON ?auto_2269138 ?auto_2269137 ) ( not ( = ?auto_2269137 ?auto_2269138 ) ) ( not ( = ?auto_2269137 ?auto_2269139 ) ) ( ON ?auto_2269132 ?auto_2269131 ) ( ON ?auto_2269133 ?auto_2269132 ) ( ON ?auto_2269134 ?auto_2269133 ) ( ON ?auto_2269135 ?auto_2269134 ) ( ON ?auto_2269136 ?auto_2269135 ) ( ON ?auto_2269137 ?auto_2269136 ) ( not ( = ?auto_2269131 ?auto_2269132 ) ) ( not ( = ?auto_2269131 ?auto_2269133 ) ) ( not ( = ?auto_2269131 ?auto_2269134 ) ) ( not ( = ?auto_2269131 ?auto_2269135 ) ) ( not ( = ?auto_2269131 ?auto_2269136 ) ) ( not ( = ?auto_2269131 ?auto_2269137 ) ) ( not ( = ?auto_2269131 ?auto_2269138 ) ) ( not ( = ?auto_2269131 ?auto_2269139 ) ) ( not ( = ?auto_2269132 ?auto_2269133 ) ) ( not ( = ?auto_2269132 ?auto_2269134 ) ) ( not ( = ?auto_2269132 ?auto_2269135 ) ) ( not ( = ?auto_2269132 ?auto_2269136 ) ) ( not ( = ?auto_2269132 ?auto_2269137 ) ) ( not ( = ?auto_2269132 ?auto_2269138 ) ) ( not ( = ?auto_2269132 ?auto_2269139 ) ) ( not ( = ?auto_2269133 ?auto_2269134 ) ) ( not ( = ?auto_2269133 ?auto_2269135 ) ) ( not ( = ?auto_2269133 ?auto_2269136 ) ) ( not ( = ?auto_2269133 ?auto_2269137 ) ) ( not ( = ?auto_2269133 ?auto_2269138 ) ) ( not ( = ?auto_2269133 ?auto_2269139 ) ) ( not ( = ?auto_2269134 ?auto_2269135 ) ) ( not ( = ?auto_2269134 ?auto_2269136 ) ) ( not ( = ?auto_2269134 ?auto_2269137 ) ) ( not ( = ?auto_2269134 ?auto_2269138 ) ) ( not ( = ?auto_2269134 ?auto_2269139 ) ) ( not ( = ?auto_2269135 ?auto_2269136 ) ) ( not ( = ?auto_2269135 ?auto_2269137 ) ) ( not ( = ?auto_2269135 ?auto_2269138 ) ) ( not ( = ?auto_2269135 ?auto_2269139 ) ) ( not ( = ?auto_2269136 ?auto_2269137 ) ) ( not ( = ?auto_2269136 ?auto_2269138 ) ) ( not ( = ?auto_2269136 ?auto_2269139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269137 ?auto_2269138 ?auto_2269139 )
      ( MAKE-8CRATE-VERIFY ?auto_2269131 ?auto_2269132 ?auto_2269133 ?auto_2269134 ?auto_2269135 ?auto_2269136 ?auto_2269137 ?auto_2269138 ?auto_2269139 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269207 - SURFACE
      ?auto_2269208 - SURFACE
      ?auto_2269209 - SURFACE
      ?auto_2269210 - SURFACE
      ?auto_2269211 - SURFACE
      ?auto_2269212 - SURFACE
      ?auto_2269213 - SURFACE
      ?auto_2269214 - SURFACE
      ?auto_2269215 - SURFACE
    )
    :vars
    (
      ?auto_2269217 - HOIST
      ?auto_2269216 - PLACE
      ?auto_2269218 - TRUCK
      ?auto_2269219 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269217 ?auto_2269216 ) ( SURFACE-AT ?auto_2269214 ?auto_2269216 ) ( CLEAR ?auto_2269214 ) ( IS-CRATE ?auto_2269215 ) ( not ( = ?auto_2269214 ?auto_2269215 ) ) ( AVAILABLE ?auto_2269217 ) ( IN ?auto_2269215 ?auto_2269218 ) ( ON ?auto_2269214 ?auto_2269213 ) ( not ( = ?auto_2269213 ?auto_2269214 ) ) ( not ( = ?auto_2269213 ?auto_2269215 ) ) ( TRUCK-AT ?auto_2269218 ?auto_2269219 ) ( not ( = ?auto_2269219 ?auto_2269216 ) ) ( ON ?auto_2269208 ?auto_2269207 ) ( ON ?auto_2269209 ?auto_2269208 ) ( ON ?auto_2269210 ?auto_2269209 ) ( ON ?auto_2269211 ?auto_2269210 ) ( ON ?auto_2269212 ?auto_2269211 ) ( ON ?auto_2269213 ?auto_2269212 ) ( not ( = ?auto_2269207 ?auto_2269208 ) ) ( not ( = ?auto_2269207 ?auto_2269209 ) ) ( not ( = ?auto_2269207 ?auto_2269210 ) ) ( not ( = ?auto_2269207 ?auto_2269211 ) ) ( not ( = ?auto_2269207 ?auto_2269212 ) ) ( not ( = ?auto_2269207 ?auto_2269213 ) ) ( not ( = ?auto_2269207 ?auto_2269214 ) ) ( not ( = ?auto_2269207 ?auto_2269215 ) ) ( not ( = ?auto_2269208 ?auto_2269209 ) ) ( not ( = ?auto_2269208 ?auto_2269210 ) ) ( not ( = ?auto_2269208 ?auto_2269211 ) ) ( not ( = ?auto_2269208 ?auto_2269212 ) ) ( not ( = ?auto_2269208 ?auto_2269213 ) ) ( not ( = ?auto_2269208 ?auto_2269214 ) ) ( not ( = ?auto_2269208 ?auto_2269215 ) ) ( not ( = ?auto_2269209 ?auto_2269210 ) ) ( not ( = ?auto_2269209 ?auto_2269211 ) ) ( not ( = ?auto_2269209 ?auto_2269212 ) ) ( not ( = ?auto_2269209 ?auto_2269213 ) ) ( not ( = ?auto_2269209 ?auto_2269214 ) ) ( not ( = ?auto_2269209 ?auto_2269215 ) ) ( not ( = ?auto_2269210 ?auto_2269211 ) ) ( not ( = ?auto_2269210 ?auto_2269212 ) ) ( not ( = ?auto_2269210 ?auto_2269213 ) ) ( not ( = ?auto_2269210 ?auto_2269214 ) ) ( not ( = ?auto_2269210 ?auto_2269215 ) ) ( not ( = ?auto_2269211 ?auto_2269212 ) ) ( not ( = ?auto_2269211 ?auto_2269213 ) ) ( not ( = ?auto_2269211 ?auto_2269214 ) ) ( not ( = ?auto_2269211 ?auto_2269215 ) ) ( not ( = ?auto_2269212 ?auto_2269213 ) ) ( not ( = ?auto_2269212 ?auto_2269214 ) ) ( not ( = ?auto_2269212 ?auto_2269215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269213 ?auto_2269214 ?auto_2269215 )
      ( MAKE-8CRATE-VERIFY ?auto_2269207 ?auto_2269208 ?auto_2269209 ?auto_2269210 ?auto_2269211 ?auto_2269212 ?auto_2269213 ?auto_2269214 ?auto_2269215 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269291 - SURFACE
      ?auto_2269292 - SURFACE
      ?auto_2269293 - SURFACE
      ?auto_2269294 - SURFACE
      ?auto_2269295 - SURFACE
      ?auto_2269296 - SURFACE
      ?auto_2269297 - SURFACE
      ?auto_2269298 - SURFACE
      ?auto_2269299 - SURFACE
    )
    :vars
    (
      ?auto_2269304 - HOIST
      ?auto_2269301 - PLACE
      ?auto_2269302 - TRUCK
      ?auto_2269300 - PLACE
      ?auto_2269303 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269304 ?auto_2269301 ) ( SURFACE-AT ?auto_2269298 ?auto_2269301 ) ( CLEAR ?auto_2269298 ) ( IS-CRATE ?auto_2269299 ) ( not ( = ?auto_2269298 ?auto_2269299 ) ) ( AVAILABLE ?auto_2269304 ) ( ON ?auto_2269298 ?auto_2269297 ) ( not ( = ?auto_2269297 ?auto_2269298 ) ) ( not ( = ?auto_2269297 ?auto_2269299 ) ) ( TRUCK-AT ?auto_2269302 ?auto_2269300 ) ( not ( = ?auto_2269300 ?auto_2269301 ) ) ( HOIST-AT ?auto_2269303 ?auto_2269300 ) ( LIFTING ?auto_2269303 ?auto_2269299 ) ( not ( = ?auto_2269304 ?auto_2269303 ) ) ( ON ?auto_2269292 ?auto_2269291 ) ( ON ?auto_2269293 ?auto_2269292 ) ( ON ?auto_2269294 ?auto_2269293 ) ( ON ?auto_2269295 ?auto_2269294 ) ( ON ?auto_2269296 ?auto_2269295 ) ( ON ?auto_2269297 ?auto_2269296 ) ( not ( = ?auto_2269291 ?auto_2269292 ) ) ( not ( = ?auto_2269291 ?auto_2269293 ) ) ( not ( = ?auto_2269291 ?auto_2269294 ) ) ( not ( = ?auto_2269291 ?auto_2269295 ) ) ( not ( = ?auto_2269291 ?auto_2269296 ) ) ( not ( = ?auto_2269291 ?auto_2269297 ) ) ( not ( = ?auto_2269291 ?auto_2269298 ) ) ( not ( = ?auto_2269291 ?auto_2269299 ) ) ( not ( = ?auto_2269292 ?auto_2269293 ) ) ( not ( = ?auto_2269292 ?auto_2269294 ) ) ( not ( = ?auto_2269292 ?auto_2269295 ) ) ( not ( = ?auto_2269292 ?auto_2269296 ) ) ( not ( = ?auto_2269292 ?auto_2269297 ) ) ( not ( = ?auto_2269292 ?auto_2269298 ) ) ( not ( = ?auto_2269292 ?auto_2269299 ) ) ( not ( = ?auto_2269293 ?auto_2269294 ) ) ( not ( = ?auto_2269293 ?auto_2269295 ) ) ( not ( = ?auto_2269293 ?auto_2269296 ) ) ( not ( = ?auto_2269293 ?auto_2269297 ) ) ( not ( = ?auto_2269293 ?auto_2269298 ) ) ( not ( = ?auto_2269293 ?auto_2269299 ) ) ( not ( = ?auto_2269294 ?auto_2269295 ) ) ( not ( = ?auto_2269294 ?auto_2269296 ) ) ( not ( = ?auto_2269294 ?auto_2269297 ) ) ( not ( = ?auto_2269294 ?auto_2269298 ) ) ( not ( = ?auto_2269294 ?auto_2269299 ) ) ( not ( = ?auto_2269295 ?auto_2269296 ) ) ( not ( = ?auto_2269295 ?auto_2269297 ) ) ( not ( = ?auto_2269295 ?auto_2269298 ) ) ( not ( = ?auto_2269295 ?auto_2269299 ) ) ( not ( = ?auto_2269296 ?auto_2269297 ) ) ( not ( = ?auto_2269296 ?auto_2269298 ) ) ( not ( = ?auto_2269296 ?auto_2269299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269297 ?auto_2269298 ?auto_2269299 )
      ( MAKE-8CRATE-VERIFY ?auto_2269291 ?auto_2269292 ?auto_2269293 ?auto_2269294 ?auto_2269295 ?auto_2269296 ?auto_2269297 ?auto_2269298 ?auto_2269299 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269383 - SURFACE
      ?auto_2269384 - SURFACE
      ?auto_2269385 - SURFACE
      ?auto_2269386 - SURFACE
      ?auto_2269387 - SURFACE
      ?auto_2269388 - SURFACE
      ?auto_2269389 - SURFACE
      ?auto_2269390 - SURFACE
      ?auto_2269391 - SURFACE
    )
    :vars
    (
      ?auto_2269394 - HOIST
      ?auto_2269396 - PLACE
      ?auto_2269392 - TRUCK
      ?auto_2269395 - PLACE
      ?auto_2269397 - HOIST
      ?auto_2269393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269394 ?auto_2269396 ) ( SURFACE-AT ?auto_2269390 ?auto_2269396 ) ( CLEAR ?auto_2269390 ) ( IS-CRATE ?auto_2269391 ) ( not ( = ?auto_2269390 ?auto_2269391 ) ) ( AVAILABLE ?auto_2269394 ) ( ON ?auto_2269390 ?auto_2269389 ) ( not ( = ?auto_2269389 ?auto_2269390 ) ) ( not ( = ?auto_2269389 ?auto_2269391 ) ) ( TRUCK-AT ?auto_2269392 ?auto_2269395 ) ( not ( = ?auto_2269395 ?auto_2269396 ) ) ( HOIST-AT ?auto_2269397 ?auto_2269395 ) ( not ( = ?auto_2269394 ?auto_2269397 ) ) ( AVAILABLE ?auto_2269397 ) ( SURFACE-AT ?auto_2269391 ?auto_2269395 ) ( ON ?auto_2269391 ?auto_2269393 ) ( CLEAR ?auto_2269391 ) ( not ( = ?auto_2269390 ?auto_2269393 ) ) ( not ( = ?auto_2269391 ?auto_2269393 ) ) ( not ( = ?auto_2269389 ?auto_2269393 ) ) ( ON ?auto_2269384 ?auto_2269383 ) ( ON ?auto_2269385 ?auto_2269384 ) ( ON ?auto_2269386 ?auto_2269385 ) ( ON ?auto_2269387 ?auto_2269386 ) ( ON ?auto_2269388 ?auto_2269387 ) ( ON ?auto_2269389 ?auto_2269388 ) ( not ( = ?auto_2269383 ?auto_2269384 ) ) ( not ( = ?auto_2269383 ?auto_2269385 ) ) ( not ( = ?auto_2269383 ?auto_2269386 ) ) ( not ( = ?auto_2269383 ?auto_2269387 ) ) ( not ( = ?auto_2269383 ?auto_2269388 ) ) ( not ( = ?auto_2269383 ?auto_2269389 ) ) ( not ( = ?auto_2269383 ?auto_2269390 ) ) ( not ( = ?auto_2269383 ?auto_2269391 ) ) ( not ( = ?auto_2269383 ?auto_2269393 ) ) ( not ( = ?auto_2269384 ?auto_2269385 ) ) ( not ( = ?auto_2269384 ?auto_2269386 ) ) ( not ( = ?auto_2269384 ?auto_2269387 ) ) ( not ( = ?auto_2269384 ?auto_2269388 ) ) ( not ( = ?auto_2269384 ?auto_2269389 ) ) ( not ( = ?auto_2269384 ?auto_2269390 ) ) ( not ( = ?auto_2269384 ?auto_2269391 ) ) ( not ( = ?auto_2269384 ?auto_2269393 ) ) ( not ( = ?auto_2269385 ?auto_2269386 ) ) ( not ( = ?auto_2269385 ?auto_2269387 ) ) ( not ( = ?auto_2269385 ?auto_2269388 ) ) ( not ( = ?auto_2269385 ?auto_2269389 ) ) ( not ( = ?auto_2269385 ?auto_2269390 ) ) ( not ( = ?auto_2269385 ?auto_2269391 ) ) ( not ( = ?auto_2269385 ?auto_2269393 ) ) ( not ( = ?auto_2269386 ?auto_2269387 ) ) ( not ( = ?auto_2269386 ?auto_2269388 ) ) ( not ( = ?auto_2269386 ?auto_2269389 ) ) ( not ( = ?auto_2269386 ?auto_2269390 ) ) ( not ( = ?auto_2269386 ?auto_2269391 ) ) ( not ( = ?auto_2269386 ?auto_2269393 ) ) ( not ( = ?auto_2269387 ?auto_2269388 ) ) ( not ( = ?auto_2269387 ?auto_2269389 ) ) ( not ( = ?auto_2269387 ?auto_2269390 ) ) ( not ( = ?auto_2269387 ?auto_2269391 ) ) ( not ( = ?auto_2269387 ?auto_2269393 ) ) ( not ( = ?auto_2269388 ?auto_2269389 ) ) ( not ( = ?auto_2269388 ?auto_2269390 ) ) ( not ( = ?auto_2269388 ?auto_2269391 ) ) ( not ( = ?auto_2269388 ?auto_2269393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269389 ?auto_2269390 ?auto_2269391 )
      ( MAKE-8CRATE-VERIFY ?auto_2269383 ?auto_2269384 ?auto_2269385 ?auto_2269386 ?auto_2269387 ?auto_2269388 ?auto_2269389 ?auto_2269390 ?auto_2269391 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269476 - SURFACE
      ?auto_2269477 - SURFACE
      ?auto_2269478 - SURFACE
      ?auto_2269479 - SURFACE
      ?auto_2269480 - SURFACE
      ?auto_2269481 - SURFACE
      ?auto_2269482 - SURFACE
      ?auto_2269483 - SURFACE
      ?auto_2269484 - SURFACE
    )
    :vars
    (
      ?auto_2269487 - HOIST
      ?auto_2269489 - PLACE
      ?auto_2269486 - PLACE
      ?auto_2269488 - HOIST
      ?auto_2269485 - SURFACE
      ?auto_2269490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269487 ?auto_2269489 ) ( SURFACE-AT ?auto_2269483 ?auto_2269489 ) ( CLEAR ?auto_2269483 ) ( IS-CRATE ?auto_2269484 ) ( not ( = ?auto_2269483 ?auto_2269484 ) ) ( AVAILABLE ?auto_2269487 ) ( ON ?auto_2269483 ?auto_2269482 ) ( not ( = ?auto_2269482 ?auto_2269483 ) ) ( not ( = ?auto_2269482 ?auto_2269484 ) ) ( not ( = ?auto_2269486 ?auto_2269489 ) ) ( HOIST-AT ?auto_2269488 ?auto_2269486 ) ( not ( = ?auto_2269487 ?auto_2269488 ) ) ( AVAILABLE ?auto_2269488 ) ( SURFACE-AT ?auto_2269484 ?auto_2269486 ) ( ON ?auto_2269484 ?auto_2269485 ) ( CLEAR ?auto_2269484 ) ( not ( = ?auto_2269483 ?auto_2269485 ) ) ( not ( = ?auto_2269484 ?auto_2269485 ) ) ( not ( = ?auto_2269482 ?auto_2269485 ) ) ( TRUCK-AT ?auto_2269490 ?auto_2269489 ) ( ON ?auto_2269477 ?auto_2269476 ) ( ON ?auto_2269478 ?auto_2269477 ) ( ON ?auto_2269479 ?auto_2269478 ) ( ON ?auto_2269480 ?auto_2269479 ) ( ON ?auto_2269481 ?auto_2269480 ) ( ON ?auto_2269482 ?auto_2269481 ) ( not ( = ?auto_2269476 ?auto_2269477 ) ) ( not ( = ?auto_2269476 ?auto_2269478 ) ) ( not ( = ?auto_2269476 ?auto_2269479 ) ) ( not ( = ?auto_2269476 ?auto_2269480 ) ) ( not ( = ?auto_2269476 ?auto_2269481 ) ) ( not ( = ?auto_2269476 ?auto_2269482 ) ) ( not ( = ?auto_2269476 ?auto_2269483 ) ) ( not ( = ?auto_2269476 ?auto_2269484 ) ) ( not ( = ?auto_2269476 ?auto_2269485 ) ) ( not ( = ?auto_2269477 ?auto_2269478 ) ) ( not ( = ?auto_2269477 ?auto_2269479 ) ) ( not ( = ?auto_2269477 ?auto_2269480 ) ) ( not ( = ?auto_2269477 ?auto_2269481 ) ) ( not ( = ?auto_2269477 ?auto_2269482 ) ) ( not ( = ?auto_2269477 ?auto_2269483 ) ) ( not ( = ?auto_2269477 ?auto_2269484 ) ) ( not ( = ?auto_2269477 ?auto_2269485 ) ) ( not ( = ?auto_2269478 ?auto_2269479 ) ) ( not ( = ?auto_2269478 ?auto_2269480 ) ) ( not ( = ?auto_2269478 ?auto_2269481 ) ) ( not ( = ?auto_2269478 ?auto_2269482 ) ) ( not ( = ?auto_2269478 ?auto_2269483 ) ) ( not ( = ?auto_2269478 ?auto_2269484 ) ) ( not ( = ?auto_2269478 ?auto_2269485 ) ) ( not ( = ?auto_2269479 ?auto_2269480 ) ) ( not ( = ?auto_2269479 ?auto_2269481 ) ) ( not ( = ?auto_2269479 ?auto_2269482 ) ) ( not ( = ?auto_2269479 ?auto_2269483 ) ) ( not ( = ?auto_2269479 ?auto_2269484 ) ) ( not ( = ?auto_2269479 ?auto_2269485 ) ) ( not ( = ?auto_2269480 ?auto_2269481 ) ) ( not ( = ?auto_2269480 ?auto_2269482 ) ) ( not ( = ?auto_2269480 ?auto_2269483 ) ) ( not ( = ?auto_2269480 ?auto_2269484 ) ) ( not ( = ?auto_2269480 ?auto_2269485 ) ) ( not ( = ?auto_2269481 ?auto_2269482 ) ) ( not ( = ?auto_2269481 ?auto_2269483 ) ) ( not ( = ?auto_2269481 ?auto_2269484 ) ) ( not ( = ?auto_2269481 ?auto_2269485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269482 ?auto_2269483 ?auto_2269484 )
      ( MAKE-8CRATE-VERIFY ?auto_2269476 ?auto_2269477 ?auto_2269478 ?auto_2269479 ?auto_2269480 ?auto_2269481 ?auto_2269482 ?auto_2269483 ?auto_2269484 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269569 - SURFACE
      ?auto_2269570 - SURFACE
      ?auto_2269571 - SURFACE
      ?auto_2269572 - SURFACE
      ?auto_2269573 - SURFACE
      ?auto_2269574 - SURFACE
      ?auto_2269575 - SURFACE
      ?auto_2269576 - SURFACE
      ?auto_2269577 - SURFACE
    )
    :vars
    (
      ?auto_2269579 - HOIST
      ?auto_2269582 - PLACE
      ?auto_2269578 - PLACE
      ?auto_2269583 - HOIST
      ?auto_2269580 - SURFACE
      ?auto_2269581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269579 ?auto_2269582 ) ( IS-CRATE ?auto_2269577 ) ( not ( = ?auto_2269576 ?auto_2269577 ) ) ( not ( = ?auto_2269575 ?auto_2269576 ) ) ( not ( = ?auto_2269575 ?auto_2269577 ) ) ( not ( = ?auto_2269578 ?auto_2269582 ) ) ( HOIST-AT ?auto_2269583 ?auto_2269578 ) ( not ( = ?auto_2269579 ?auto_2269583 ) ) ( AVAILABLE ?auto_2269583 ) ( SURFACE-AT ?auto_2269577 ?auto_2269578 ) ( ON ?auto_2269577 ?auto_2269580 ) ( CLEAR ?auto_2269577 ) ( not ( = ?auto_2269576 ?auto_2269580 ) ) ( not ( = ?auto_2269577 ?auto_2269580 ) ) ( not ( = ?auto_2269575 ?auto_2269580 ) ) ( TRUCK-AT ?auto_2269581 ?auto_2269582 ) ( SURFACE-AT ?auto_2269575 ?auto_2269582 ) ( CLEAR ?auto_2269575 ) ( LIFTING ?auto_2269579 ?auto_2269576 ) ( IS-CRATE ?auto_2269576 ) ( ON ?auto_2269570 ?auto_2269569 ) ( ON ?auto_2269571 ?auto_2269570 ) ( ON ?auto_2269572 ?auto_2269571 ) ( ON ?auto_2269573 ?auto_2269572 ) ( ON ?auto_2269574 ?auto_2269573 ) ( ON ?auto_2269575 ?auto_2269574 ) ( not ( = ?auto_2269569 ?auto_2269570 ) ) ( not ( = ?auto_2269569 ?auto_2269571 ) ) ( not ( = ?auto_2269569 ?auto_2269572 ) ) ( not ( = ?auto_2269569 ?auto_2269573 ) ) ( not ( = ?auto_2269569 ?auto_2269574 ) ) ( not ( = ?auto_2269569 ?auto_2269575 ) ) ( not ( = ?auto_2269569 ?auto_2269576 ) ) ( not ( = ?auto_2269569 ?auto_2269577 ) ) ( not ( = ?auto_2269569 ?auto_2269580 ) ) ( not ( = ?auto_2269570 ?auto_2269571 ) ) ( not ( = ?auto_2269570 ?auto_2269572 ) ) ( not ( = ?auto_2269570 ?auto_2269573 ) ) ( not ( = ?auto_2269570 ?auto_2269574 ) ) ( not ( = ?auto_2269570 ?auto_2269575 ) ) ( not ( = ?auto_2269570 ?auto_2269576 ) ) ( not ( = ?auto_2269570 ?auto_2269577 ) ) ( not ( = ?auto_2269570 ?auto_2269580 ) ) ( not ( = ?auto_2269571 ?auto_2269572 ) ) ( not ( = ?auto_2269571 ?auto_2269573 ) ) ( not ( = ?auto_2269571 ?auto_2269574 ) ) ( not ( = ?auto_2269571 ?auto_2269575 ) ) ( not ( = ?auto_2269571 ?auto_2269576 ) ) ( not ( = ?auto_2269571 ?auto_2269577 ) ) ( not ( = ?auto_2269571 ?auto_2269580 ) ) ( not ( = ?auto_2269572 ?auto_2269573 ) ) ( not ( = ?auto_2269572 ?auto_2269574 ) ) ( not ( = ?auto_2269572 ?auto_2269575 ) ) ( not ( = ?auto_2269572 ?auto_2269576 ) ) ( not ( = ?auto_2269572 ?auto_2269577 ) ) ( not ( = ?auto_2269572 ?auto_2269580 ) ) ( not ( = ?auto_2269573 ?auto_2269574 ) ) ( not ( = ?auto_2269573 ?auto_2269575 ) ) ( not ( = ?auto_2269573 ?auto_2269576 ) ) ( not ( = ?auto_2269573 ?auto_2269577 ) ) ( not ( = ?auto_2269573 ?auto_2269580 ) ) ( not ( = ?auto_2269574 ?auto_2269575 ) ) ( not ( = ?auto_2269574 ?auto_2269576 ) ) ( not ( = ?auto_2269574 ?auto_2269577 ) ) ( not ( = ?auto_2269574 ?auto_2269580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269575 ?auto_2269576 ?auto_2269577 )
      ( MAKE-8CRATE-VERIFY ?auto_2269569 ?auto_2269570 ?auto_2269571 ?auto_2269572 ?auto_2269573 ?auto_2269574 ?auto_2269575 ?auto_2269576 ?auto_2269577 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269662 - SURFACE
      ?auto_2269663 - SURFACE
      ?auto_2269664 - SURFACE
      ?auto_2269665 - SURFACE
      ?auto_2269666 - SURFACE
      ?auto_2269667 - SURFACE
      ?auto_2269668 - SURFACE
      ?auto_2269669 - SURFACE
      ?auto_2269670 - SURFACE
    )
    :vars
    (
      ?auto_2269674 - HOIST
      ?auto_2269673 - PLACE
      ?auto_2269672 - PLACE
      ?auto_2269671 - HOIST
      ?auto_2269675 - SURFACE
      ?auto_2269676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269674 ?auto_2269673 ) ( IS-CRATE ?auto_2269670 ) ( not ( = ?auto_2269669 ?auto_2269670 ) ) ( not ( = ?auto_2269668 ?auto_2269669 ) ) ( not ( = ?auto_2269668 ?auto_2269670 ) ) ( not ( = ?auto_2269672 ?auto_2269673 ) ) ( HOIST-AT ?auto_2269671 ?auto_2269672 ) ( not ( = ?auto_2269674 ?auto_2269671 ) ) ( AVAILABLE ?auto_2269671 ) ( SURFACE-AT ?auto_2269670 ?auto_2269672 ) ( ON ?auto_2269670 ?auto_2269675 ) ( CLEAR ?auto_2269670 ) ( not ( = ?auto_2269669 ?auto_2269675 ) ) ( not ( = ?auto_2269670 ?auto_2269675 ) ) ( not ( = ?auto_2269668 ?auto_2269675 ) ) ( TRUCK-AT ?auto_2269676 ?auto_2269673 ) ( SURFACE-AT ?auto_2269668 ?auto_2269673 ) ( CLEAR ?auto_2269668 ) ( IS-CRATE ?auto_2269669 ) ( AVAILABLE ?auto_2269674 ) ( IN ?auto_2269669 ?auto_2269676 ) ( ON ?auto_2269663 ?auto_2269662 ) ( ON ?auto_2269664 ?auto_2269663 ) ( ON ?auto_2269665 ?auto_2269664 ) ( ON ?auto_2269666 ?auto_2269665 ) ( ON ?auto_2269667 ?auto_2269666 ) ( ON ?auto_2269668 ?auto_2269667 ) ( not ( = ?auto_2269662 ?auto_2269663 ) ) ( not ( = ?auto_2269662 ?auto_2269664 ) ) ( not ( = ?auto_2269662 ?auto_2269665 ) ) ( not ( = ?auto_2269662 ?auto_2269666 ) ) ( not ( = ?auto_2269662 ?auto_2269667 ) ) ( not ( = ?auto_2269662 ?auto_2269668 ) ) ( not ( = ?auto_2269662 ?auto_2269669 ) ) ( not ( = ?auto_2269662 ?auto_2269670 ) ) ( not ( = ?auto_2269662 ?auto_2269675 ) ) ( not ( = ?auto_2269663 ?auto_2269664 ) ) ( not ( = ?auto_2269663 ?auto_2269665 ) ) ( not ( = ?auto_2269663 ?auto_2269666 ) ) ( not ( = ?auto_2269663 ?auto_2269667 ) ) ( not ( = ?auto_2269663 ?auto_2269668 ) ) ( not ( = ?auto_2269663 ?auto_2269669 ) ) ( not ( = ?auto_2269663 ?auto_2269670 ) ) ( not ( = ?auto_2269663 ?auto_2269675 ) ) ( not ( = ?auto_2269664 ?auto_2269665 ) ) ( not ( = ?auto_2269664 ?auto_2269666 ) ) ( not ( = ?auto_2269664 ?auto_2269667 ) ) ( not ( = ?auto_2269664 ?auto_2269668 ) ) ( not ( = ?auto_2269664 ?auto_2269669 ) ) ( not ( = ?auto_2269664 ?auto_2269670 ) ) ( not ( = ?auto_2269664 ?auto_2269675 ) ) ( not ( = ?auto_2269665 ?auto_2269666 ) ) ( not ( = ?auto_2269665 ?auto_2269667 ) ) ( not ( = ?auto_2269665 ?auto_2269668 ) ) ( not ( = ?auto_2269665 ?auto_2269669 ) ) ( not ( = ?auto_2269665 ?auto_2269670 ) ) ( not ( = ?auto_2269665 ?auto_2269675 ) ) ( not ( = ?auto_2269666 ?auto_2269667 ) ) ( not ( = ?auto_2269666 ?auto_2269668 ) ) ( not ( = ?auto_2269666 ?auto_2269669 ) ) ( not ( = ?auto_2269666 ?auto_2269670 ) ) ( not ( = ?auto_2269666 ?auto_2269675 ) ) ( not ( = ?auto_2269667 ?auto_2269668 ) ) ( not ( = ?auto_2269667 ?auto_2269669 ) ) ( not ( = ?auto_2269667 ?auto_2269670 ) ) ( not ( = ?auto_2269667 ?auto_2269675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269668 ?auto_2269669 ?auto_2269670 )
      ( MAKE-8CRATE-VERIFY ?auto_2269662 ?auto_2269663 ?auto_2269664 ?auto_2269665 ?auto_2269666 ?auto_2269667 ?auto_2269668 ?auto_2269669 ?auto_2269670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2269677 - SURFACE
      ?auto_2269678 - SURFACE
    )
    :vars
    (
      ?auto_2269683 - HOIST
      ?auto_2269681 - PLACE
      ?auto_2269682 - SURFACE
      ?auto_2269680 - PLACE
      ?auto_2269679 - HOIST
      ?auto_2269684 - SURFACE
      ?auto_2269685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269683 ?auto_2269681 ) ( IS-CRATE ?auto_2269678 ) ( not ( = ?auto_2269677 ?auto_2269678 ) ) ( not ( = ?auto_2269682 ?auto_2269677 ) ) ( not ( = ?auto_2269682 ?auto_2269678 ) ) ( not ( = ?auto_2269680 ?auto_2269681 ) ) ( HOIST-AT ?auto_2269679 ?auto_2269680 ) ( not ( = ?auto_2269683 ?auto_2269679 ) ) ( AVAILABLE ?auto_2269679 ) ( SURFACE-AT ?auto_2269678 ?auto_2269680 ) ( ON ?auto_2269678 ?auto_2269684 ) ( CLEAR ?auto_2269678 ) ( not ( = ?auto_2269677 ?auto_2269684 ) ) ( not ( = ?auto_2269678 ?auto_2269684 ) ) ( not ( = ?auto_2269682 ?auto_2269684 ) ) ( SURFACE-AT ?auto_2269682 ?auto_2269681 ) ( CLEAR ?auto_2269682 ) ( IS-CRATE ?auto_2269677 ) ( AVAILABLE ?auto_2269683 ) ( IN ?auto_2269677 ?auto_2269685 ) ( TRUCK-AT ?auto_2269685 ?auto_2269680 ) )
    :subtasks
    ( ( !DRIVE ?auto_2269685 ?auto_2269680 ?auto_2269681 )
      ( MAKE-2CRATE ?auto_2269682 ?auto_2269677 ?auto_2269678 )
      ( MAKE-1CRATE-VERIFY ?auto_2269677 ?auto_2269678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2269686 - SURFACE
      ?auto_2269687 - SURFACE
      ?auto_2269688 - SURFACE
    )
    :vars
    (
      ?auto_2269693 - HOIST
      ?auto_2269694 - PLACE
      ?auto_2269692 - PLACE
      ?auto_2269691 - HOIST
      ?auto_2269690 - SURFACE
      ?auto_2269689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269693 ?auto_2269694 ) ( IS-CRATE ?auto_2269688 ) ( not ( = ?auto_2269687 ?auto_2269688 ) ) ( not ( = ?auto_2269686 ?auto_2269687 ) ) ( not ( = ?auto_2269686 ?auto_2269688 ) ) ( not ( = ?auto_2269692 ?auto_2269694 ) ) ( HOIST-AT ?auto_2269691 ?auto_2269692 ) ( not ( = ?auto_2269693 ?auto_2269691 ) ) ( AVAILABLE ?auto_2269691 ) ( SURFACE-AT ?auto_2269688 ?auto_2269692 ) ( ON ?auto_2269688 ?auto_2269690 ) ( CLEAR ?auto_2269688 ) ( not ( = ?auto_2269687 ?auto_2269690 ) ) ( not ( = ?auto_2269688 ?auto_2269690 ) ) ( not ( = ?auto_2269686 ?auto_2269690 ) ) ( SURFACE-AT ?auto_2269686 ?auto_2269694 ) ( CLEAR ?auto_2269686 ) ( IS-CRATE ?auto_2269687 ) ( AVAILABLE ?auto_2269693 ) ( IN ?auto_2269687 ?auto_2269689 ) ( TRUCK-AT ?auto_2269689 ?auto_2269692 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2269687 ?auto_2269688 )
      ( MAKE-2CRATE-VERIFY ?auto_2269686 ?auto_2269687 ?auto_2269688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2269695 - SURFACE
      ?auto_2269696 - SURFACE
      ?auto_2269697 - SURFACE
      ?auto_2269698 - SURFACE
    )
    :vars
    (
      ?auto_2269700 - HOIST
      ?auto_2269704 - PLACE
      ?auto_2269701 - PLACE
      ?auto_2269702 - HOIST
      ?auto_2269703 - SURFACE
      ?auto_2269699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269700 ?auto_2269704 ) ( IS-CRATE ?auto_2269698 ) ( not ( = ?auto_2269697 ?auto_2269698 ) ) ( not ( = ?auto_2269696 ?auto_2269697 ) ) ( not ( = ?auto_2269696 ?auto_2269698 ) ) ( not ( = ?auto_2269701 ?auto_2269704 ) ) ( HOIST-AT ?auto_2269702 ?auto_2269701 ) ( not ( = ?auto_2269700 ?auto_2269702 ) ) ( AVAILABLE ?auto_2269702 ) ( SURFACE-AT ?auto_2269698 ?auto_2269701 ) ( ON ?auto_2269698 ?auto_2269703 ) ( CLEAR ?auto_2269698 ) ( not ( = ?auto_2269697 ?auto_2269703 ) ) ( not ( = ?auto_2269698 ?auto_2269703 ) ) ( not ( = ?auto_2269696 ?auto_2269703 ) ) ( SURFACE-AT ?auto_2269696 ?auto_2269704 ) ( CLEAR ?auto_2269696 ) ( IS-CRATE ?auto_2269697 ) ( AVAILABLE ?auto_2269700 ) ( IN ?auto_2269697 ?auto_2269699 ) ( TRUCK-AT ?auto_2269699 ?auto_2269701 ) ( ON ?auto_2269696 ?auto_2269695 ) ( not ( = ?auto_2269695 ?auto_2269696 ) ) ( not ( = ?auto_2269695 ?auto_2269697 ) ) ( not ( = ?auto_2269695 ?auto_2269698 ) ) ( not ( = ?auto_2269695 ?auto_2269703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269696 ?auto_2269697 ?auto_2269698 )
      ( MAKE-3CRATE-VERIFY ?auto_2269695 ?auto_2269696 ?auto_2269697 ?auto_2269698 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2269705 - SURFACE
      ?auto_2269706 - SURFACE
      ?auto_2269707 - SURFACE
      ?auto_2269708 - SURFACE
      ?auto_2269709 - SURFACE
    )
    :vars
    (
      ?auto_2269711 - HOIST
      ?auto_2269715 - PLACE
      ?auto_2269712 - PLACE
      ?auto_2269713 - HOIST
      ?auto_2269714 - SURFACE
      ?auto_2269710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269711 ?auto_2269715 ) ( IS-CRATE ?auto_2269709 ) ( not ( = ?auto_2269708 ?auto_2269709 ) ) ( not ( = ?auto_2269707 ?auto_2269708 ) ) ( not ( = ?auto_2269707 ?auto_2269709 ) ) ( not ( = ?auto_2269712 ?auto_2269715 ) ) ( HOIST-AT ?auto_2269713 ?auto_2269712 ) ( not ( = ?auto_2269711 ?auto_2269713 ) ) ( AVAILABLE ?auto_2269713 ) ( SURFACE-AT ?auto_2269709 ?auto_2269712 ) ( ON ?auto_2269709 ?auto_2269714 ) ( CLEAR ?auto_2269709 ) ( not ( = ?auto_2269708 ?auto_2269714 ) ) ( not ( = ?auto_2269709 ?auto_2269714 ) ) ( not ( = ?auto_2269707 ?auto_2269714 ) ) ( SURFACE-AT ?auto_2269707 ?auto_2269715 ) ( CLEAR ?auto_2269707 ) ( IS-CRATE ?auto_2269708 ) ( AVAILABLE ?auto_2269711 ) ( IN ?auto_2269708 ?auto_2269710 ) ( TRUCK-AT ?auto_2269710 ?auto_2269712 ) ( ON ?auto_2269706 ?auto_2269705 ) ( ON ?auto_2269707 ?auto_2269706 ) ( not ( = ?auto_2269705 ?auto_2269706 ) ) ( not ( = ?auto_2269705 ?auto_2269707 ) ) ( not ( = ?auto_2269705 ?auto_2269708 ) ) ( not ( = ?auto_2269705 ?auto_2269709 ) ) ( not ( = ?auto_2269705 ?auto_2269714 ) ) ( not ( = ?auto_2269706 ?auto_2269707 ) ) ( not ( = ?auto_2269706 ?auto_2269708 ) ) ( not ( = ?auto_2269706 ?auto_2269709 ) ) ( not ( = ?auto_2269706 ?auto_2269714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269707 ?auto_2269708 ?auto_2269709 )
      ( MAKE-4CRATE-VERIFY ?auto_2269705 ?auto_2269706 ?auto_2269707 ?auto_2269708 ?auto_2269709 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2269716 - SURFACE
      ?auto_2269717 - SURFACE
      ?auto_2269718 - SURFACE
      ?auto_2269719 - SURFACE
      ?auto_2269720 - SURFACE
      ?auto_2269721 - SURFACE
    )
    :vars
    (
      ?auto_2269723 - HOIST
      ?auto_2269727 - PLACE
      ?auto_2269724 - PLACE
      ?auto_2269725 - HOIST
      ?auto_2269726 - SURFACE
      ?auto_2269722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269723 ?auto_2269727 ) ( IS-CRATE ?auto_2269721 ) ( not ( = ?auto_2269720 ?auto_2269721 ) ) ( not ( = ?auto_2269719 ?auto_2269720 ) ) ( not ( = ?auto_2269719 ?auto_2269721 ) ) ( not ( = ?auto_2269724 ?auto_2269727 ) ) ( HOIST-AT ?auto_2269725 ?auto_2269724 ) ( not ( = ?auto_2269723 ?auto_2269725 ) ) ( AVAILABLE ?auto_2269725 ) ( SURFACE-AT ?auto_2269721 ?auto_2269724 ) ( ON ?auto_2269721 ?auto_2269726 ) ( CLEAR ?auto_2269721 ) ( not ( = ?auto_2269720 ?auto_2269726 ) ) ( not ( = ?auto_2269721 ?auto_2269726 ) ) ( not ( = ?auto_2269719 ?auto_2269726 ) ) ( SURFACE-AT ?auto_2269719 ?auto_2269727 ) ( CLEAR ?auto_2269719 ) ( IS-CRATE ?auto_2269720 ) ( AVAILABLE ?auto_2269723 ) ( IN ?auto_2269720 ?auto_2269722 ) ( TRUCK-AT ?auto_2269722 ?auto_2269724 ) ( ON ?auto_2269717 ?auto_2269716 ) ( ON ?auto_2269718 ?auto_2269717 ) ( ON ?auto_2269719 ?auto_2269718 ) ( not ( = ?auto_2269716 ?auto_2269717 ) ) ( not ( = ?auto_2269716 ?auto_2269718 ) ) ( not ( = ?auto_2269716 ?auto_2269719 ) ) ( not ( = ?auto_2269716 ?auto_2269720 ) ) ( not ( = ?auto_2269716 ?auto_2269721 ) ) ( not ( = ?auto_2269716 ?auto_2269726 ) ) ( not ( = ?auto_2269717 ?auto_2269718 ) ) ( not ( = ?auto_2269717 ?auto_2269719 ) ) ( not ( = ?auto_2269717 ?auto_2269720 ) ) ( not ( = ?auto_2269717 ?auto_2269721 ) ) ( not ( = ?auto_2269717 ?auto_2269726 ) ) ( not ( = ?auto_2269718 ?auto_2269719 ) ) ( not ( = ?auto_2269718 ?auto_2269720 ) ) ( not ( = ?auto_2269718 ?auto_2269721 ) ) ( not ( = ?auto_2269718 ?auto_2269726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269719 ?auto_2269720 ?auto_2269721 )
      ( MAKE-5CRATE-VERIFY ?auto_2269716 ?auto_2269717 ?auto_2269718 ?auto_2269719 ?auto_2269720 ?auto_2269721 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2269728 - SURFACE
      ?auto_2269729 - SURFACE
      ?auto_2269730 - SURFACE
      ?auto_2269731 - SURFACE
      ?auto_2269732 - SURFACE
      ?auto_2269733 - SURFACE
      ?auto_2269734 - SURFACE
    )
    :vars
    (
      ?auto_2269736 - HOIST
      ?auto_2269740 - PLACE
      ?auto_2269737 - PLACE
      ?auto_2269738 - HOIST
      ?auto_2269739 - SURFACE
      ?auto_2269735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269736 ?auto_2269740 ) ( IS-CRATE ?auto_2269734 ) ( not ( = ?auto_2269733 ?auto_2269734 ) ) ( not ( = ?auto_2269732 ?auto_2269733 ) ) ( not ( = ?auto_2269732 ?auto_2269734 ) ) ( not ( = ?auto_2269737 ?auto_2269740 ) ) ( HOIST-AT ?auto_2269738 ?auto_2269737 ) ( not ( = ?auto_2269736 ?auto_2269738 ) ) ( AVAILABLE ?auto_2269738 ) ( SURFACE-AT ?auto_2269734 ?auto_2269737 ) ( ON ?auto_2269734 ?auto_2269739 ) ( CLEAR ?auto_2269734 ) ( not ( = ?auto_2269733 ?auto_2269739 ) ) ( not ( = ?auto_2269734 ?auto_2269739 ) ) ( not ( = ?auto_2269732 ?auto_2269739 ) ) ( SURFACE-AT ?auto_2269732 ?auto_2269740 ) ( CLEAR ?auto_2269732 ) ( IS-CRATE ?auto_2269733 ) ( AVAILABLE ?auto_2269736 ) ( IN ?auto_2269733 ?auto_2269735 ) ( TRUCK-AT ?auto_2269735 ?auto_2269737 ) ( ON ?auto_2269729 ?auto_2269728 ) ( ON ?auto_2269730 ?auto_2269729 ) ( ON ?auto_2269731 ?auto_2269730 ) ( ON ?auto_2269732 ?auto_2269731 ) ( not ( = ?auto_2269728 ?auto_2269729 ) ) ( not ( = ?auto_2269728 ?auto_2269730 ) ) ( not ( = ?auto_2269728 ?auto_2269731 ) ) ( not ( = ?auto_2269728 ?auto_2269732 ) ) ( not ( = ?auto_2269728 ?auto_2269733 ) ) ( not ( = ?auto_2269728 ?auto_2269734 ) ) ( not ( = ?auto_2269728 ?auto_2269739 ) ) ( not ( = ?auto_2269729 ?auto_2269730 ) ) ( not ( = ?auto_2269729 ?auto_2269731 ) ) ( not ( = ?auto_2269729 ?auto_2269732 ) ) ( not ( = ?auto_2269729 ?auto_2269733 ) ) ( not ( = ?auto_2269729 ?auto_2269734 ) ) ( not ( = ?auto_2269729 ?auto_2269739 ) ) ( not ( = ?auto_2269730 ?auto_2269731 ) ) ( not ( = ?auto_2269730 ?auto_2269732 ) ) ( not ( = ?auto_2269730 ?auto_2269733 ) ) ( not ( = ?auto_2269730 ?auto_2269734 ) ) ( not ( = ?auto_2269730 ?auto_2269739 ) ) ( not ( = ?auto_2269731 ?auto_2269732 ) ) ( not ( = ?auto_2269731 ?auto_2269733 ) ) ( not ( = ?auto_2269731 ?auto_2269734 ) ) ( not ( = ?auto_2269731 ?auto_2269739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269732 ?auto_2269733 ?auto_2269734 )
      ( MAKE-6CRATE-VERIFY ?auto_2269728 ?auto_2269729 ?auto_2269730 ?auto_2269731 ?auto_2269732 ?auto_2269733 ?auto_2269734 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2269741 - SURFACE
      ?auto_2269742 - SURFACE
      ?auto_2269743 - SURFACE
      ?auto_2269744 - SURFACE
      ?auto_2269745 - SURFACE
      ?auto_2269746 - SURFACE
      ?auto_2269747 - SURFACE
      ?auto_2269748 - SURFACE
    )
    :vars
    (
      ?auto_2269750 - HOIST
      ?auto_2269754 - PLACE
      ?auto_2269751 - PLACE
      ?auto_2269752 - HOIST
      ?auto_2269753 - SURFACE
      ?auto_2269749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269750 ?auto_2269754 ) ( IS-CRATE ?auto_2269748 ) ( not ( = ?auto_2269747 ?auto_2269748 ) ) ( not ( = ?auto_2269746 ?auto_2269747 ) ) ( not ( = ?auto_2269746 ?auto_2269748 ) ) ( not ( = ?auto_2269751 ?auto_2269754 ) ) ( HOIST-AT ?auto_2269752 ?auto_2269751 ) ( not ( = ?auto_2269750 ?auto_2269752 ) ) ( AVAILABLE ?auto_2269752 ) ( SURFACE-AT ?auto_2269748 ?auto_2269751 ) ( ON ?auto_2269748 ?auto_2269753 ) ( CLEAR ?auto_2269748 ) ( not ( = ?auto_2269747 ?auto_2269753 ) ) ( not ( = ?auto_2269748 ?auto_2269753 ) ) ( not ( = ?auto_2269746 ?auto_2269753 ) ) ( SURFACE-AT ?auto_2269746 ?auto_2269754 ) ( CLEAR ?auto_2269746 ) ( IS-CRATE ?auto_2269747 ) ( AVAILABLE ?auto_2269750 ) ( IN ?auto_2269747 ?auto_2269749 ) ( TRUCK-AT ?auto_2269749 ?auto_2269751 ) ( ON ?auto_2269742 ?auto_2269741 ) ( ON ?auto_2269743 ?auto_2269742 ) ( ON ?auto_2269744 ?auto_2269743 ) ( ON ?auto_2269745 ?auto_2269744 ) ( ON ?auto_2269746 ?auto_2269745 ) ( not ( = ?auto_2269741 ?auto_2269742 ) ) ( not ( = ?auto_2269741 ?auto_2269743 ) ) ( not ( = ?auto_2269741 ?auto_2269744 ) ) ( not ( = ?auto_2269741 ?auto_2269745 ) ) ( not ( = ?auto_2269741 ?auto_2269746 ) ) ( not ( = ?auto_2269741 ?auto_2269747 ) ) ( not ( = ?auto_2269741 ?auto_2269748 ) ) ( not ( = ?auto_2269741 ?auto_2269753 ) ) ( not ( = ?auto_2269742 ?auto_2269743 ) ) ( not ( = ?auto_2269742 ?auto_2269744 ) ) ( not ( = ?auto_2269742 ?auto_2269745 ) ) ( not ( = ?auto_2269742 ?auto_2269746 ) ) ( not ( = ?auto_2269742 ?auto_2269747 ) ) ( not ( = ?auto_2269742 ?auto_2269748 ) ) ( not ( = ?auto_2269742 ?auto_2269753 ) ) ( not ( = ?auto_2269743 ?auto_2269744 ) ) ( not ( = ?auto_2269743 ?auto_2269745 ) ) ( not ( = ?auto_2269743 ?auto_2269746 ) ) ( not ( = ?auto_2269743 ?auto_2269747 ) ) ( not ( = ?auto_2269743 ?auto_2269748 ) ) ( not ( = ?auto_2269743 ?auto_2269753 ) ) ( not ( = ?auto_2269744 ?auto_2269745 ) ) ( not ( = ?auto_2269744 ?auto_2269746 ) ) ( not ( = ?auto_2269744 ?auto_2269747 ) ) ( not ( = ?auto_2269744 ?auto_2269748 ) ) ( not ( = ?auto_2269744 ?auto_2269753 ) ) ( not ( = ?auto_2269745 ?auto_2269746 ) ) ( not ( = ?auto_2269745 ?auto_2269747 ) ) ( not ( = ?auto_2269745 ?auto_2269748 ) ) ( not ( = ?auto_2269745 ?auto_2269753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269746 ?auto_2269747 ?auto_2269748 )
      ( MAKE-7CRATE-VERIFY ?auto_2269741 ?auto_2269742 ?auto_2269743 ?auto_2269744 ?auto_2269745 ?auto_2269746 ?auto_2269747 ?auto_2269748 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269755 - SURFACE
      ?auto_2269756 - SURFACE
      ?auto_2269757 - SURFACE
      ?auto_2269758 - SURFACE
      ?auto_2269759 - SURFACE
      ?auto_2269760 - SURFACE
      ?auto_2269761 - SURFACE
      ?auto_2269762 - SURFACE
      ?auto_2269763 - SURFACE
    )
    :vars
    (
      ?auto_2269765 - HOIST
      ?auto_2269769 - PLACE
      ?auto_2269766 - PLACE
      ?auto_2269767 - HOIST
      ?auto_2269768 - SURFACE
      ?auto_2269764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269765 ?auto_2269769 ) ( IS-CRATE ?auto_2269763 ) ( not ( = ?auto_2269762 ?auto_2269763 ) ) ( not ( = ?auto_2269761 ?auto_2269762 ) ) ( not ( = ?auto_2269761 ?auto_2269763 ) ) ( not ( = ?auto_2269766 ?auto_2269769 ) ) ( HOIST-AT ?auto_2269767 ?auto_2269766 ) ( not ( = ?auto_2269765 ?auto_2269767 ) ) ( AVAILABLE ?auto_2269767 ) ( SURFACE-AT ?auto_2269763 ?auto_2269766 ) ( ON ?auto_2269763 ?auto_2269768 ) ( CLEAR ?auto_2269763 ) ( not ( = ?auto_2269762 ?auto_2269768 ) ) ( not ( = ?auto_2269763 ?auto_2269768 ) ) ( not ( = ?auto_2269761 ?auto_2269768 ) ) ( SURFACE-AT ?auto_2269761 ?auto_2269769 ) ( CLEAR ?auto_2269761 ) ( IS-CRATE ?auto_2269762 ) ( AVAILABLE ?auto_2269765 ) ( IN ?auto_2269762 ?auto_2269764 ) ( TRUCK-AT ?auto_2269764 ?auto_2269766 ) ( ON ?auto_2269756 ?auto_2269755 ) ( ON ?auto_2269757 ?auto_2269756 ) ( ON ?auto_2269758 ?auto_2269757 ) ( ON ?auto_2269759 ?auto_2269758 ) ( ON ?auto_2269760 ?auto_2269759 ) ( ON ?auto_2269761 ?auto_2269760 ) ( not ( = ?auto_2269755 ?auto_2269756 ) ) ( not ( = ?auto_2269755 ?auto_2269757 ) ) ( not ( = ?auto_2269755 ?auto_2269758 ) ) ( not ( = ?auto_2269755 ?auto_2269759 ) ) ( not ( = ?auto_2269755 ?auto_2269760 ) ) ( not ( = ?auto_2269755 ?auto_2269761 ) ) ( not ( = ?auto_2269755 ?auto_2269762 ) ) ( not ( = ?auto_2269755 ?auto_2269763 ) ) ( not ( = ?auto_2269755 ?auto_2269768 ) ) ( not ( = ?auto_2269756 ?auto_2269757 ) ) ( not ( = ?auto_2269756 ?auto_2269758 ) ) ( not ( = ?auto_2269756 ?auto_2269759 ) ) ( not ( = ?auto_2269756 ?auto_2269760 ) ) ( not ( = ?auto_2269756 ?auto_2269761 ) ) ( not ( = ?auto_2269756 ?auto_2269762 ) ) ( not ( = ?auto_2269756 ?auto_2269763 ) ) ( not ( = ?auto_2269756 ?auto_2269768 ) ) ( not ( = ?auto_2269757 ?auto_2269758 ) ) ( not ( = ?auto_2269757 ?auto_2269759 ) ) ( not ( = ?auto_2269757 ?auto_2269760 ) ) ( not ( = ?auto_2269757 ?auto_2269761 ) ) ( not ( = ?auto_2269757 ?auto_2269762 ) ) ( not ( = ?auto_2269757 ?auto_2269763 ) ) ( not ( = ?auto_2269757 ?auto_2269768 ) ) ( not ( = ?auto_2269758 ?auto_2269759 ) ) ( not ( = ?auto_2269758 ?auto_2269760 ) ) ( not ( = ?auto_2269758 ?auto_2269761 ) ) ( not ( = ?auto_2269758 ?auto_2269762 ) ) ( not ( = ?auto_2269758 ?auto_2269763 ) ) ( not ( = ?auto_2269758 ?auto_2269768 ) ) ( not ( = ?auto_2269759 ?auto_2269760 ) ) ( not ( = ?auto_2269759 ?auto_2269761 ) ) ( not ( = ?auto_2269759 ?auto_2269762 ) ) ( not ( = ?auto_2269759 ?auto_2269763 ) ) ( not ( = ?auto_2269759 ?auto_2269768 ) ) ( not ( = ?auto_2269760 ?auto_2269761 ) ) ( not ( = ?auto_2269760 ?auto_2269762 ) ) ( not ( = ?auto_2269760 ?auto_2269763 ) ) ( not ( = ?auto_2269760 ?auto_2269768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269761 ?auto_2269762 ?auto_2269763 )
      ( MAKE-8CRATE-VERIFY ?auto_2269755 ?auto_2269756 ?auto_2269757 ?auto_2269758 ?auto_2269759 ?auto_2269760 ?auto_2269761 ?auto_2269762 ?auto_2269763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2269770 - SURFACE
      ?auto_2269771 - SURFACE
    )
    :vars
    (
      ?auto_2269773 - HOIST
      ?auto_2269778 - PLACE
      ?auto_2269776 - SURFACE
      ?auto_2269774 - PLACE
      ?auto_2269775 - HOIST
      ?auto_2269777 - SURFACE
      ?auto_2269772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269773 ?auto_2269778 ) ( IS-CRATE ?auto_2269771 ) ( not ( = ?auto_2269770 ?auto_2269771 ) ) ( not ( = ?auto_2269776 ?auto_2269770 ) ) ( not ( = ?auto_2269776 ?auto_2269771 ) ) ( not ( = ?auto_2269774 ?auto_2269778 ) ) ( HOIST-AT ?auto_2269775 ?auto_2269774 ) ( not ( = ?auto_2269773 ?auto_2269775 ) ) ( SURFACE-AT ?auto_2269771 ?auto_2269774 ) ( ON ?auto_2269771 ?auto_2269777 ) ( CLEAR ?auto_2269771 ) ( not ( = ?auto_2269770 ?auto_2269777 ) ) ( not ( = ?auto_2269771 ?auto_2269777 ) ) ( not ( = ?auto_2269776 ?auto_2269777 ) ) ( SURFACE-AT ?auto_2269776 ?auto_2269778 ) ( CLEAR ?auto_2269776 ) ( IS-CRATE ?auto_2269770 ) ( AVAILABLE ?auto_2269773 ) ( TRUCK-AT ?auto_2269772 ?auto_2269774 ) ( LIFTING ?auto_2269775 ?auto_2269770 ) )
    :subtasks
    ( ( !LOAD ?auto_2269775 ?auto_2269770 ?auto_2269772 ?auto_2269774 )
      ( MAKE-2CRATE ?auto_2269776 ?auto_2269770 ?auto_2269771 )
      ( MAKE-1CRATE-VERIFY ?auto_2269770 ?auto_2269771 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2269779 - SURFACE
      ?auto_2269780 - SURFACE
      ?auto_2269781 - SURFACE
    )
    :vars
    (
      ?auto_2269782 - HOIST
      ?auto_2269785 - PLACE
      ?auto_2269783 - PLACE
      ?auto_2269787 - HOIST
      ?auto_2269784 - SURFACE
      ?auto_2269786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269782 ?auto_2269785 ) ( IS-CRATE ?auto_2269781 ) ( not ( = ?auto_2269780 ?auto_2269781 ) ) ( not ( = ?auto_2269779 ?auto_2269780 ) ) ( not ( = ?auto_2269779 ?auto_2269781 ) ) ( not ( = ?auto_2269783 ?auto_2269785 ) ) ( HOIST-AT ?auto_2269787 ?auto_2269783 ) ( not ( = ?auto_2269782 ?auto_2269787 ) ) ( SURFACE-AT ?auto_2269781 ?auto_2269783 ) ( ON ?auto_2269781 ?auto_2269784 ) ( CLEAR ?auto_2269781 ) ( not ( = ?auto_2269780 ?auto_2269784 ) ) ( not ( = ?auto_2269781 ?auto_2269784 ) ) ( not ( = ?auto_2269779 ?auto_2269784 ) ) ( SURFACE-AT ?auto_2269779 ?auto_2269785 ) ( CLEAR ?auto_2269779 ) ( IS-CRATE ?auto_2269780 ) ( AVAILABLE ?auto_2269782 ) ( TRUCK-AT ?auto_2269786 ?auto_2269783 ) ( LIFTING ?auto_2269787 ?auto_2269780 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2269780 ?auto_2269781 )
      ( MAKE-2CRATE-VERIFY ?auto_2269779 ?auto_2269780 ?auto_2269781 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2269788 - SURFACE
      ?auto_2269789 - SURFACE
      ?auto_2269790 - SURFACE
      ?auto_2269791 - SURFACE
    )
    :vars
    (
      ?auto_2269795 - HOIST
      ?auto_2269792 - PLACE
      ?auto_2269794 - PLACE
      ?auto_2269797 - HOIST
      ?auto_2269796 - SURFACE
      ?auto_2269793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269795 ?auto_2269792 ) ( IS-CRATE ?auto_2269791 ) ( not ( = ?auto_2269790 ?auto_2269791 ) ) ( not ( = ?auto_2269789 ?auto_2269790 ) ) ( not ( = ?auto_2269789 ?auto_2269791 ) ) ( not ( = ?auto_2269794 ?auto_2269792 ) ) ( HOIST-AT ?auto_2269797 ?auto_2269794 ) ( not ( = ?auto_2269795 ?auto_2269797 ) ) ( SURFACE-AT ?auto_2269791 ?auto_2269794 ) ( ON ?auto_2269791 ?auto_2269796 ) ( CLEAR ?auto_2269791 ) ( not ( = ?auto_2269790 ?auto_2269796 ) ) ( not ( = ?auto_2269791 ?auto_2269796 ) ) ( not ( = ?auto_2269789 ?auto_2269796 ) ) ( SURFACE-AT ?auto_2269789 ?auto_2269792 ) ( CLEAR ?auto_2269789 ) ( IS-CRATE ?auto_2269790 ) ( AVAILABLE ?auto_2269795 ) ( TRUCK-AT ?auto_2269793 ?auto_2269794 ) ( LIFTING ?auto_2269797 ?auto_2269790 ) ( ON ?auto_2269789 ?auto_2269788 ) ( not ( = ?auto_2269788 ?auto_2269789 ) ) ( not ( = ?auto_2269788 ?auto_2269790 ) ) ( not ( = ?auto_2269788 ?auto_2269791 ) ) ( not ( = ?auto_2269788 ?auto_2269796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269789 ?auto_2269790 ?auto_2269791 )
      ( MAKE-3CRATE-VERIFY ?auto_2269788 ?auto_2269789 ?auto_2269790 ?auto_2269791 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2269798 - SURFACE
      ?auto_2269799 - SURFACE
      ?auto_2269800 - SURFACE
      ?auto_2269801 - SURFACE
      ?auto_2269802 - SURFACE
    )
    :vars
    (
      ?auto_2269806 - HOIST
      ?auto_2269803 - PLACE
      ?auto_2269805 - PLACE
      ?auto_2269808 - HOIST
      ?auto_2269807 - SURFACE
      ?auto_2269804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269806 ?auto_2269803 ) ( IS-CRATE ?auto_2269802 ) ( not ( = ?auto_2269801 ?auto_2269802 ) ) ( not ( = ?auto_2269800 ?auto_2269801 ) ) ( not ( = ?auto_2269800 ?auto_2269802 ) ) ( not ( = ?auto_2269805 ?auto_2269803 ) ) ( HOIST-AT ?auto_2269808 ?auto_2269805 ) ( not ( = ?auto_2269806 ?auto_2269808 ) ) ( SURFACE-AT ?auto_2269802 ?auto_2269805 ) ( ON ?auto_2269802 ?auto_2269807 ) ( CLEAR ?auto_2269802 ) ( not ( = ?auto_2269801 ?auto_2269807 ) ) ( not ( = ?auto_2269802 ?auto_2269807 ) ) ( not ( = ?auto_2269800 ?auto_2269807 ) ) ( SURFACE-AT ?auto_2269800 ?auto_2269803 ) ( CLEAR ?auto_2269800 ) ( IS-CRATE ?auto_2269801 ) ( AVAILABLE ?auto_2269806 ) ( TRUCK-AT ?auto_2269804 ?auto_2269805 ) ( LIFTING ?auto_2269808 ?auto_2269801 ) ( ON ?auto_2269799 ?auto_2269798 ) ( ON ?auto_2269800 ?auto_2269799 ) ( not ( = ?auto_2269798 ?auto_2269799 ) ) ( not ( = ?auto_2269798 ?auto_2269800 ) ) ( not ( = ?auto_2269798 ?auto_2269801 ) ) ( not ( = ?auto_2269798 ?auto_2269802 ) ) ( not ( = ?auto_2269798 ?auto_2269807 ) ) ( not ( = ?auto_2269799 ?auto_2269800 ) ) ( not ( = ?auto_2269799 ?auto_2269801 ) ) ( not ( = ?auto_2269799 ?auto_2269802 ) ) ( not ( = ?auto_2269799 ?auto_2269807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269800 ?auto_2269801 ?auto_2269802 )
      ( MAKE-4CRATE-VERIFY ?auto_2269798 ?auto_2269799 ?auto_2269800 ?auto_2269801 ?auto_2269802 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2269809 - SURFACE
      ?auto_2269810 - SURFACE
      ?auto_2269811 - SURFACE
      ?auto_2269812 - SURFACE
      ?auto_2269813 - SURFACE
      ?auto_2269814 - SURFACE
    )
    :vars
    (
      ?auto_2269818 - HOIST
      ?auto_2269815 - PLACE
      ?auto_2269817 - PLACE
      ?auto_2269820 - HOIST
      ?auto_2269819 - SURFACE
      ?auto_2269816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269818 ?auto_2269815 ) ( IS-CRATE ?auto_2269814 ) ( not ( = ?auto_2269813 ?auto_2269814 ) ) ( not ( = ?auto_2269812 ?auto_2269813 ) ) ( not ( = ?auto_2269812 ?auto_2269814 ) ) ( not ( = ?auto_2269817 ?auto_2269815 ) ) ( HOIST-AT ?auto_2269820 ?auto_2269817 ) ( not ( = ?auto_2269818 ?auto_2269820 ) ) ( SURFACE-AT ?auto_2269814 ?auto_2269817 ) ( ON ?auto_2269814 ?auto_2269819 ) ( CLEAR ?auto_2269814 ) ( not ( = ?auto_2269813 ?auto_2269819 ) ) ( not ( = ?auto_2269814 ?auto_2269819 ) ) ( not ( = ?auto_2269812 ?auto_2269819 ) ) ( SURFACE-AT ?auto_2269812 ?auto_2269815 ) ( CLEAR ?auto_2269812 ) ( IS-CRATE ?auto_2269813 ) ( AVAILABLE ?auto_2269818 ) ( TRUCK-AT ?auto_2269816 ?auto_2269817 ) ( LIFTING ?auto_2269820 ?auto_2269813 ) ( ON ?auto_2269810 ?auto_2269809 ) ( ON ?auto_2269811 ?auto_2269810 ) ( ON ?auto_2269812 ?auto_2269811 ) ( not ( = ?auto_2269809 ?auto_2269810 ) ) ( not ( = ?auto_2269809 ?auto_2269811 ) ) ( not ( = ?auto_2269809 ?auto_2269812 ) ) ( not ( = ?auto_2269809 ?auto_2269813 ) ) ( not ( = ?auto_2269809 ?auto_2269814 ) ) ( not ( = ?auto_2269809 ?auto_2269819 ) ) ( not ( = ?auto_2269810 ?auto_2269811 ) ) ( not ( = ?auto_2269810 ?auto_2269812 ) ) ( not ( = ?auto_2269810 ?auto_2269813 ) ) ( not ( = ?auto_2269810 ?auto_2269814 ) ) ( not ( = ?auto_2269810 ?auto_2269819 ) ) ( not ( = ?auto_2269811 ?auto_2269812 ) ) ( not ( = ?auto_2269811 ?auto_2269813 ) ) ( not ( = ?auto_2269811 ?auto_2269814 ) ) ( not ( = ?auto_2269811 ?auto_2269819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269812 ?auto_2269813 ?auto_2269814 )
      ( MAKE-5CRATE-VERIFY ?auto_2269809 ?auto_2269810 ?auto_2269811 ?auto_2269812 ?auto_2269813 ?auto_2269814 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2269821 - SURFACE
      ?auto_2269822 - SURFACE
      ?auto_2269823 - SURFACE
      ?auto_2269824 - SURFACE
      ?auto_2269825 - SURFACE
      ?auto_2269826 - SURFACE
      ?auto_2269827 - SURFACE
    )
    :vars
    (
      ?auto_2269831 - HOIST
      ?auto_2269828 - PLACE
      ?auto_2269830 - PLACE
      ?auto_2269833 - HOIST
      ?auto_2269832 - SURFACE
      ?auto_2269829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269831 ?auto_2269828 ) ( IS-CRATE ?auto_2269827 ) ( not ( = ?auto_2269826 ?auto_2269827 ) ) ( not ( = ?auto_2269825 ?auto_2269826 ) ) ( not ( = ?auto_2269825 ?auto_2269827 ) ) ( not ( = ?auto_2269830 ?auto_2269828 ) ) ( HOIST-AT ?auto_2269833 ?auto_2269830 ) ( not ( = ?auto_2269831 ?auto_2269833 ) ) ( SURFACE-AT ?auto_2269827 ?auto_2269830 ) ( ON ?auto_2269827 ?auto_2269832 ) ( CLEAR ?auto_2269827 ) ( not ( = ?auto_2269826 ?auto_2269832 ) ) ( not ( = ?auto_2269827 ?auto_2269832 ) ) ( not ( = ?auto_2269825 ?auto_2269832 ) ) ( SURFACE-AT ?auto_2269825 ?auto_2269828 ) ( CLEAR ?auto_2269825 ) ( IS-CRATE ?auto_2269826 ) ( AVAILABLE ?auto_2269831 ) ( TRUCK-AT ?auto_2269829 ?auto_2269830 ) ( LIFTING ?auto_2269833 ?auto_2269826 ) ( ON ?auto_2269822 ?auto_2269821 ) ( ON ?auto_2269823 ?auto_2269822 ) ( ON ?auto_2269824 ?auto_2269823 ) ( ON ?auto_2269825 ?auto_2269824 ) ( not ( = ?auto_2269821 ?auto_2269822 ) ) ( not ( = ?auto_2269821 ?auto_2269823 ) ) ( not ( = ?auto_2269821 ?auto_2269824 ) ) ( not ( = ?auto_2269821 ?auto_2269825 ) ) ( not ( = ?auto_2269821 ?auto_2269826 ) ) ( not ( = ?auto_2269821 ?auto_2269827 ) ) ( not ( = ?auto_2269821 ?auto_2269832 ) ) ( not ( = ?auto_2269822 ?auto_2269823 ) ) ( not ( = ?auto_2269822 ?auto_2269824 ) ) ( not ( = ?auto_2269822 ?auto_2269825 ) ) ( not ( = ?auto_2269822 ?auto_2269826 ) ) ( not ( = ?auto_2269822 ?auto_2269827 ) ) ( not ( = ?auto_2269822 ?auto_2269832 ) ) ( not ( = ?auto_2269823 ?auto_2269824 ) ) ( not ( = ?auto_2269823 ?auto_2269825 ) ) ( not ( = ?auto_2269823 ?auto_2269826 ) ) ( not ( = ?auto_2269823 ?auto_2269827 ) ) ( not ( = ?auto_2269823 ?auto_2269832 ) ) ( not ( = ?auto_2269824 ?auto_2269825 ) ) ( not ( = ?auto_2269824 ?auto_2269826 ) ) ( not ( = ?auto_2269824 ?auto_2269827 ) ) ( not ( = ?auto_2269824 ?auto_2269832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269825 ?auto_2269826 ?auto_2269827 )
      ( MAKE-6CRATE-VERIFY ?auto_2269821 ?auto_2269822 ?auto_2269823 ?auto_2269824 ?auto_2269825 ?auto_2269826 ?auto_2269827 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2269834 - SURFACE
      ?auto_2269835 - SURFACE
      ?auto_2269836 - SURFACE
      ?auto_2269837 - SURFACE
      ?auto_2269838 - SURFACE
      ?auto_2269839 - SURFACE
      ?auto_2269840 - SURFACE
      ?auto_2269841 - SURFACE
    )
    :vars
    (
      ?auto_2269845 - HOIST
      ?auto_2269842 - PLACE
      ?auto_2269844 - PLACE
      ?auto_2269847 - HOIST
      ?auto_2269846 - SURFACE
      ?auto_2269843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269845 ?auto_2269842 ) ( IS-CRATE ?auto_2269841 ) ( not ( = ?auto_2269840 ?auto_2269841 ) ) ( not ( = ?auto_2269839 ?auto_2269840 ) ) ( not ( = ?auto_2269839 ?auto_2269841 ) ) ( not ( = ?auto_2269844 ?auto_2269842 ) ) ( HOIST-AT ?auto_2269847 ?auto_2269844 ) ( not ( = ?auto_2269845 ?auto_2269847 ) ) ( SURFACE-AT ?auto_2269841 ?auto_2269844 ) ( ON ?auto_2269841 ?auto_2269846 ) ( CLEAR ?auto_2269841 ) ( not ( = ?auto_2269840 ?auto_2269846 ) ) ( not ( = ?auto_2269841 ?auto_2269846 ) ) ( not ( = ?auto_2269839 ?auto_2269846 ) ) ( SURFACE-AT ?auto_2269839 ?auto_2269842 ) ( CLEAR ?auto_2269839 ) ( IS-CRATE ?auto_2269840 ) ( AVAILABLE ?auto_2269845 ) ( TRUCK-AT ?auto_2269843 ?auto_2269844 ) ( LIFTING ?auto_2269847 ?auto_2269840 ) ( ON ?auto_2269835 ?auto_2269834 ) ( ON ?auto_2269836 ?auto_2269835 ) ( ON ?auto_2269837 ?auto_2269836 ) ( ON ?auto_2269838 ?auto_2269837 ) ( ON ?auto_2269839 ?auto_2269838 ) ( not ( = ?auto_2269834 ?auto_2269835 ) ) ( not ( = ?auto_2269834 ?auto_2269836 ) ) ( not ( = ?auto_2269834 ?auto_2269837 ) ) ( not ( = ?auto_2269834 ?auto_2269838 ) ) ( not ( = ?auto_2269834 ?auto_2269839 ) ) ( not ( = ?auto_2269834 ?auto_2269840 ) ) ( not ( = ?auto_2269834 ?auto_2269841 ) ) ( not ( = ?auto_2269834 ?auto_2269846 ) ) ( not ( = ?auto_2269835 ?auto_2269836 ) ) ( not ( = ?auto_2269835 ?auto_2269837 ) ) ( not ( = ?auto_2269835 ?auto_2269838 ) ) ( not ( = ?auto_2269835 ?auto_2269839 ) ) ( not ( = ?auto_2269835 ?auto_2269840 ) ) ( not ( = ?auto_2269835 ?auto_2269841 ) ) ( not ( = ?auto_2269835 ?auto_2269846 ) ) ( not ( = ?auto_2269836 ?auto_2269837 ) ) ( not ( = ?auto_2269836 ?auto_2269838 ) ) ( not ( = ?auto_2269836 ?auto_2269839 ) ) ( not ( = ?auto_2269836 ?auto_2269840 ) ) ( not ( = ?auto_2269836 ?auto_2269841 ) ) ( not ( = ?auto_2269836 ?auto_2269846 ) ) ( not ( = ?auto_2269837 ?auto_2269838 ) ) ( not ( = ?auto_2269837 ?auto_2269839 ) ) ( not ( = ?auto_2269837 ?auto_2269840 ) ) ( not ( = ?auto_2269837 ?auto_2269841 ) ) ( not ( = ?auto_2269837 ?auto_2269846 ) ) ( not ( = ?auto_2269838 ?auto_2269839 ) ) ( not ( = ?auto_2269838 ?auto_2269840 ) ) ( not ( = ?auto_2269838 ?auto_2269841 ) ) ( not ( = ?auto_2269838 ?auto_2269846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269839 ?auto_2269840 ?auto_2269841 )
      ( MAKE-7CRATE-VERIFY ?auto_2269834 ?auto_2269835 ?auto_2269836 ?auto_2269837 ?auto_2269838 ?auto_2269839 ?auto_2269840 ?auto_2269841 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269848 - SURFACE
      ?auto_2269849 - SURFACE
      ?auto_2269850 - SURFACE
      ?auto_2269851 - SURFACE
      ?auto_2269852 - SURFACE
      ?auto_2269853 - SURFACE
      ?auto_2269854 - SURFACE
      ?auto_2269855 - SURFACE
      ?auto_2269856 - SURFACE
    )
    :vars
    (
      ?auto_2269860 - HOIST
      ?auto_2269857 - PLACE
      ?auto_2269859 - PLACE
      ?auto_2269862 - HOIST
      ?auto_2269861 - SURFACE
      ?auto_2269858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269860 ?auto_2269857 ) ( IS-CRATE ?auto_2269856 ) ( not ( = ?auto_2269855 ?auto_2269856 ) ) ( not ( = ?auto_2269854 ?auto_2269855 ) ) ( not ( = ?auto_2269854 ?auto_2269856 ) ) ( not ( = ?auto_2269859 ?auto_2269857 ) ) ( HOIST-AT ?auto_2269862 ?auto_2269859 ) ( not ( = ?auto_2269860 ?auto_2269862 ) ) ( SURFACE-AT ?auto_2269856 ?auto_2269859 ) ( ON ?auto_2269856 ?auto_2269861 ) ( CLEAR ?auto_2269856 ) ( not ( = ?auto_2269855 ?auto_2269861 ) ) ( not ( = ?auto_2269856 ?auto_2269861 ) ) ( not ( = ?auto_2269854 ?auto_2269861 ) ) ( SURFACE-AT ?auto_2269854 ?auto_2269857 ) ( CLEAR ?auto_2269854 ) ( IS-CRATE ?auto_2269855 ) ( AVAILABLE ?auto_2269860 ) ( TRUCK-AT ?auto_2269858 ?auto_2269859 ) ( LIFTING ?auto_2269862 ?auto_2269855 ) ( ON ?auto_2269849 ?auto_2269848 ) ( ON ?auto_2269850 ?auto_2269849 ) ( ON ?auto_2269851 ?auto_2269850 ) ( ON ?auto_2269852 ?auto_2269851 ) ( ON ?auto_2269853 ?auto_2269852 ) ( ON ?auto_2269854 ?auto_2269853 ) ( not ( = ?auto_2269848 ?auto_2269849 ) ) ( not ( = ?auto_2269848 ?auto_2269850 ) ) ( not ( = ?auto_2269848 ?auto_2269851 ) ) ( not ( = ?auto_2269848 ?auto_2269852 ) ) ( not ( = ?auto_2269848 ?auto_2269853 ) ) ( not ( = ?auto_2269848 ?auto_2269854 ) ) ( not ( = ?auto_2269848 ?auto_2269855 ) ) ( not ( = ?auto_2269848 ?auto_2269856 ) ) ( not ( = ?auto_2269848 ?auto_2269861 ) ) ( not ( = ?auto_2269849 ?auto_2269850 ) ) ( not ( = ?auto_2269849 ?auto_2269851 ) ) ( not ( = ?auto_2269849 ?auto_2269852 ) ) ( not ( = ?auto_2269849 ?auto_2269853 ) ) ( not ( = ?auto_2269849 ?auto_2269854 ) ) ( not ( = ?auto_2269849 ?auto_2269855 ) ) ( not ( = ?auto_2269849 ?auto_2269856 ) ) ( not ( = ?auto_2269849 ?auto_2269861 ) ) ( not ( = ?auto_2269850 ?auto_2269851 ) ) ( not ( = ?auto_2269850 ?auto_2269852 ) ) ( not ( = ?auto_2269850 ?auto_2269853 ) ) ( not ( = ?auto_2269850 ?auto_2269854 ) ) ( not ( = ?auto_2269850 ?auto_2269855 ) ) ( not ( = ?auto_2269850 ?auto_2269856 ) ) ( not ( = ?auto_2269850 ?auto_2269861 ) ) ( not ( = ?auto_2269851 ?auto_2269852 ) ) ( not ( = ?auto_2269851 ?auto_2269853 ) ) ( not ( = ?auto_2269851 ?auto_2269854 ) ) ( not ( = ?auto_2269851 ?auto_2269855 ) ) ( not ( = ?auto_2269851 ?auto_2269856 ) ) ( not ( = ?auto_2269851 ?auto_2269861 ) ) ( not ( = ?auto_2269852 ?auto_2269853 ) ) ( not ( = ?auto_2269852 ?auto_2269854 ) ) ( not ( = ?auto_2269852 ?auto_2269855 ) ) ( not ( = ?auto_2269852 ?auto_2269856 ) ) ( not ( = ?auto_2269852 ?auto_2269861 ) ) ( not ( = ?auto_2269853 ?auto_2269854 ) ) ( not ( = ?auto_2269853 ?auto_2269855 ) ) ( not ( = ?auto_2269853 ?auto_2269856 ) ) ( not ( = ?auto_2269853 ?auto_2269861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269854 ?auto_2269855 ?auto_2269856 )
      ( MAKE-8CRATE-VERIFY ?auto_2269848 ?auto_2269849 ?auto_2269850 ?auto_2269851 ?auto_2269852 ?auto_2269853 ?auto_2269854 ?auto_2269855 ?auto_2269856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2269863 - SURFACE
      ?auto_2269864 - SURFACE
    )
    :vars
    (
      ?auto_2269868 - HOIST
      ?auto_2269865 - PLACE
      ?auto_2269869 - SURFACE
      ?auto_2269867 - PLACE
      ?auto_2269871 - HOIST
      ?auto_2269870 - SURFACE
      ?auto_2269866 - TRUCK
      ?auto_2269872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269868 ?auto_2269865 ) ( IS-CRATE ?auto_2269864 ) ( not ( = ?auto_2269863 ?auto_2269864 ) ) ( not ( = ?auto_2269869 ?auto_2269863 ) ) ( not ( = ?auto_2269869 ?auto_2269864 ) ) ( not ( = ?auto_2269867 ?auto_2269865 ) ) ( HOIST-AT ?auto_2269871 ?auto_2269867 ) ( not ( = ?auto_2269868 ?auto_2269871 ) ) ( SURFACE-AT ?auto_2269864 ?auto_2269867 ) ( ON ?auto_2269864 ?auto_2269870 ) ( CLEAR ?auto_2269864 ) ( not ( = ?auto_2269863 ?auto_2269870 ) ) ( not ( = ?auto_2269864 ?auto_2269870 ) ) ( not ( = ?auto_2269869 ?auto_2269870 ) ) ( SURFACE-AT ?auto_2269869 ?auto_2269865 ) ( CLEAR ?auto_2269869 ) ( IS-CRATE ?auto_2269863 ) ( AVAILABLE ?auto_2269868 ) ( TRUCK-AT ?auto_2269866 ?auto_2269867 ) ( AVAILABLE ?auto_2269871 ) ( SURFACE-AT ?auto_2269863 ?auto_2269867 ) ( ON ?auto_2269863 ?auto_2269872 ) ( CLEAR ?auto_2269863 ) ( not ( = ?auto_2269863 ?auto_2269872 ) ) ( not ( = ?auto_2269864 ?auto_2269872 ) ) ( not ( = ?auto_2269869 ?auto_2269872 ) ) ( not ( = ?auto_2269870 ?auto_2269872 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2269871 ?auto_2269863 ?auto_2269872 ?auto_2269867 )
      ( MAKE-2CRATE ?auto_2269869 ?auto_2269863 ?auto_2269864 )
      ( MAKE-1CRATE-VERIFY ?auto_2269863 ?auto_2269864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2269873 - SURFACE
      ?auto_2269874 - SURFACE
      ?auto_2269875 - SURFACE
    )
    :vars
    (
      ?auto_2269879 - HOIST
      ?auto_2269876 - PLACE
      ?auto_2269877 - PLACE
      ?auto_2269880 - HOIST
      ?auto_2269878 - SURFACE
      ?auto_2269881 - TRUCK
      ?auto_2269882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269879 ?auto_2269876 ) ( IS-CRATE ?auto_2269875 ) ( not ( = ?auto_2269874 ?auto_2269875 ) ) ( not ( = ?auto_2269873 ?auto_2269874 ) ) ( not ( = ?auto_2269873 ?auto_2269875 ) ) ( not ( = ?auto_2269877 ?auto_2269876 ) ) ( HOIST-AT ?auto_2269880 ?auto_2269877 ) ( not ( = ?auto_2269879 ?auto_2269880 ) ) ( SURFACE-AT ?auto_2269875 ?auto_2269877 ) ( ON ?auto_2269875 ?auto_2269878 ) ( CLEAR ?auto_2269875 ) ( not ( = ?auto_2269874 ?auto_2269878 ) ) ( not ( = ?auto_2269875 ?auto_2269878 ) ) ( not ( = ?auto_2269873 ?auto_2269878 ) ) ( SURFACE-AT ?auto_2269873 ?auto_2269876 ) ( CLEAR ?auto_2269873 ) ( IS-CRATE ?auto_2269874 ) ( AVAILABLE ?auto_2269879 ) ( TRUCK-AT ?auto_2269881 ?auto_2269877 ) ( AVAILABLE ?auto_2269880 ) ( SURFACE-AT ?auto_2269874 ?auto_2269877 ) ( ON ?auto_2269874 ?auto_2269882 ) ( CLEAR ?auto_2269874 ) ( not ( = ?auto_2269874 ?auto_2269882 ) ) ( not ( = ?auto_2269875 ?auto_2269882 ) ) ( not ( = ?auto_2269873 ?auto_2269882 ) ) ( not ( = ?auto_2269878 ?auto_2269882 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2269874 ?auto_2269875 )
      ( MAKE-2CRATE-VERIFY ?auto_2269873 ?auto_2269874 ?auto_2269875 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2269883 - SURFACE
      ?auto_2269884 - SURFACE
      ?auto_2269885 - SURFACE
      ?auto_2269886 - SURFACE
    )
    :vars
    (
      ?auto_2269893 - HOIST
      ?auto_2269888 - PLACE
      ?auto_2269891 - PLACE
      ?auto_2269889 - HOIST
      ?auto_2269890 - SURFACE
      ?auto_2269892 - TRUCK
      ?auto_2269887 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269893 ?auto_2269888 ) ( IS-CRATE ?auto_2269886 ) ( not ( = ?auto_2269885 ?auto_2269886 ) ) ( not ( = ?auto_2269884 ?auto_2269885 ) ) ( not ( = ?auto_2269884 ?auto_2269886 ) ) ( not ( = ?auto_2269891 ?auto_2269888 ) ) ( HOIST-AT ?auto_2269889 ?auto_2269891 ) ( not ( = ?auto_2269893 ?auto_2269889 ) ) ( SURFACE-AT ?auto_2269886 ?auto_2269891 ) ( ON ?auto_2269886 ?auto_2269890 ) ( CLEAR ?auto_2269886 ) ( not ( = ?auto_2269885 ?auto_2269890 ) ) ( not ( = ?auto_2269886 ?auto_2269890 ) ) ( not ( = ?auto_2269884 ?auto_2269890 ) ) ( SURFACE-AT ?auto_2269884 ?auto_2269888 ) ( CLEAR ?auto_2269884 ) ( IS-CRATE ?auto_2269885 ) ( AVAILABLE ?auto_2269893 ) ( TRUCK-AT ?auto_2269892 ?auto_2269891 ) ( AVAILABLE ?auto_2269889 ) ( SURFACE-AT ?auto_2269885 ?auto_2269891 ) ( ON ?auto_2269885 ?auto_2269887 ) ( CLEAR ?auto_2269885 ) ( not ( = ?auto_2269885 ?auto_2269887 ) ) ( not ( = ?auto_2269886 ?auto_2269887 ) ) ( not ( = ?auto_2269884 ?auto_2269887 ) ) ( not ( = ?auto_2269890 ?auto_2269887 ) ) ( ON ?auto_2269884 ?auto_2269883 ) ( not ( = ?auto_2269883 ?auto_2269884 ) ) ( not ( = ?auto_2269883 ?auto_2269885 ) ) ( not ( = ?auto_2269883 ?auto_2269886 ) ) ( not ( = ?auto_2269883 ?auto_2269890 ) ) ( not ( = ?auto_2269883 ?auto_2269887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269884 ?auto_2269885 ?auto_2269886 )
      ( MAKE-3CRATE-VERIFY ?auto_2269883 ?auto_2269884 ?auto_2269885 ?auto_2269886 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2269894 - SURFACE
      ?auto_2269895 - SURFACE
      ?auto_2269896 - SURFACE
      ?auto_2269897 - SURFACE
      ?auto_2269898 - SURFACE
    )
    :vars
    (
      ?auto_2269905 - HOIST
      ?auto_2269900 - PLACE
      ?auto_2269903 - PLACE
      ?auto_2269901 - HOIST
      ?auto_2269902 - SURFACE
      ?auto_2269904 - TRUCK
      ?auto_2269899 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269905 ?auto_2269900 ) ( IS-CRATE ?auto_2269898 ) ( not ( = ?auto_2269897 ?auto_2269898 ) ) ( not ( = ?auto_2269896 ?auto_2269897 ) ) ( not ( = ?auto_2269896 ?auto_2269898 ) ) ( not ( = ?auto_2269903 ?auto_2269900 ) ) ( HOIST-AT ?auto_2269901 ?auto_2269903 ) ( not ( = ?auto_2269905 ?auto_2269901 ) ) ( SURFACE-AT ?auto_2269898 ?auto_2269903 ) ( ON ?auto_2269898 ?auto_2269902 ) ( CLEAR ?auto_2269898 ) ( not ( = ?auto_2269897 ?auto_2269902 ) ) ( not ( = ?auto_2269898 ?auto_2269902 ) ) ( not ( = ?auto_2269896 ?auto_2269902 ) ) ( SURFACE-AT ?auto_2269896 ?auto_2269900 ) ( CLEAR ?auto_2269896 ) ( IS-CRATE ?auto_2269897 ) ( AVAILABLE ?auto_2269905 ) ( TRUCK-AT ?auto_2269904 ?auto_2269903 ) ( AVAILABLE ?auto_2269901 ) ( SURFACE-AT ?auto_2269897 ?auto_2269903 ) ( ON ?auto_2269897 ?auto_2269899 ) ( CLEAR ?auto_2269897 ) ( not ( = ?auto_2269897 ?auto_2269899 ) ) ( not ( = ?auto_2269898 ?auto_2269899 ) ) ( not ( = ?auto_2269896 ?auto_2269899 ) ) ( not ( = ?auto_2269902 ?auto_2269899 ) ) ( ON ?auto_2269895 ?auto_2269894 ) ( ON ?auto_2269896 ?auto_2269895 ) ( not ( = ?auto_2269894 ?auto_2269895 ) ) ( not ( = ?auto_2269894 ?auto_2269896 ) ) ( not ( = ?auto_2269894 ?auto_2269897 ) ) ( not ( = ?auto_2269894 ?auto_2269898 ) ) ( not ( = ?auto_2269894 ?auto_2269902 ) ) ( not ( = ?auto_2269894 ?auto_2269899 ) ) ( not ( = ?auto_2269895 ?auto_2269896 ) ) ( not ( = ?auto_2269895 ?auto_2269897 ) ) ( not ( = ?auto_2269895 ?auto_2269898 ) ) ( not ( = ?auto_2269895 ?auto_2269902 ) ) ( not ( = ?auto_2269895 ?auto_2269899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269896 ?auto_2269897 ?auto_2269898 )
      ( MAKE-4CRATE-VERIFY ?auto_2269894 ?auto_2269895 ?auto_2269896 ?auto_2269897 ?auto_2269898 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2269906 - SURFACE
      ?auto_2269907 - SURFACE
      ?auto_2269908 - SURFACE
      ?auto_2269909 - SURFACE
      ?auto_2269910 - SURFACE
      ?auto_2269911 - SURFACE
    )
    :vars
    (
      ?auto_2269918 - HOIST
      ?auto_2269913 - PLACE
      ?auto_2269916 - PLACE
      ?auto_2269914 - HOIST
      ?auto_2269915 - SURFACE
      ?auto_2269917 - TRUCK
      ?auto_2269912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269918 ?auto_2269913 ) ( IS-CRATE ?auto_2269911 ) ( not ( = ?auto_2269910 ?auto_2269911 ) ) ( not ( = ?auto_2269909 ?auto_2269910 ) ) ( not ( = ?auto_2269909 ?auto_2269911 ) ) ( not ( = ?auto_2269916 ?auto_2269913 ) ) ( HOIST-AT ?auto_2269914 ?auto_2269916 ) ( not ( = ?auto_2269918 ?auto_2269914 ) ) ( SURFACE-AT ?auto_2269911 ?auto_2269916 ) ( ON ?auto_2269911 ?auto_2269915 ) ( CLEAR ?auto_2269911 ) ( not ( = ?auto_2269910 ?auto_2269915 ) ) ( not ( = ?auto_2269911 ?auto_2269915 ) ) ( not ( = ?auto_2269909 ?auto_2269915 ) ) ( SURFACE-AT ?auto_2269909 ?auto_2269913 ) ( CLEAR ?auto_2269909 ) ( IS-CRATE ?auto_2269910 ) ( AVAILABLE ?auto_2269918 ) ( TRUCK-AT ?auto_2269917 ?auto_2269916 ) ( AVAILABLE ?auto_2269914 ) ( SURFACE-AT ?auto_2269910 ?auto_2269916 ) ( ON ?auto_2269910 ?auto_2269912 ) ( CLEAR ?auto_2269910 ) ( not ( = ?auto_2269910 ?auto_2269912 ) ) ( not ( = ?auto_2269911 ?auto_2269912 ) ) ( not ( = ?auto_2269909 ?auto_2269912 ) ) ( not ( = ?auto_2269915 ?auto_2269912 ) ) ( ON ?auto_2269907 ?auto_2269906 ) ( ON ?auto_2269908 ?auto_2269907 ) ( ON ?auto_2269909 ?auto_2269908 ) ( not ( = ?auto_2269906 ?auto_2269907 ) ) ( not ( = ?auto_2269906 ?auto_2269908 ) ) ( not ( = ?auto_2269906 ?auto_2269909 ) ) ( not ( = ?auto_2269906 ?auto_2269910 ) ) ( not ( = ?auto_2269906 ?auto_2269911 ) ) ( not ( = ?auto_2269906 ?auto_2269915 ) ) ( not ( = ?auto_2269906 ?auto_2269912 ) ) ( not ( = ?auto_2269907 ?auto_2269908 ) ) ( not ( = ?auto_2269907 ?auto_2269909 ) ) ( not ( = ?auto_2269907 ?auto_2269910 ) ) ( not ( = ?auto_2269907 ?auto_2269911 ) ) ( not ( = ?auto_2269907 ?auto_2269915 ) ) ( not ( = ?auto_2269907 ?auto_2269912 ) ) ( not ( = ?auto_2269908 ?auto_2269909 ) ) ( not ( = ?auto_2269908 ?auto_2269910 ) ) ( not ( = ?auto_2269908 ?auto_2269911 ) ) ( not ( = ?auto_2269908 ?auto_2269915 ) ) ( not ( = ?auto_2269908 ?auto_2269912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269909 ?auto_2269910 ?auto_2269911 )
      ( MAKE-5CRATE-VERIFY ?auto_2269906 ?auto_2269907 ?auto_2269908 ?auto_2269909 ?auto_2269910 ?auto_2269911 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2269919 - SURFACE
      ?auto_2269920 - SURFACE
      ?auto_2269921 - SURFACE
      ?auto_2269922 - SURFACE
      ?auto_2269923 - SURFACE
      ?auto_2269924 - SURFACE
      ?auto_2269925 - SURFACE
    )
    :vars
    (
      ?auto_2269932 - HOIST
      ?auto_2269927 - PLACE
      ?auto_2269930 - PLACE
      ?auto_2269928 - HOIST
      ?auto_2269929 - SURFACE
      ?auto_2269931 - TRUCK
      ?auto_2269926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269932 ?auto_2269927 ) ( IS-CRATE ?auto_2269925 ) ( not ( = ?auto_2269924 ?auto_2269925 ) ) ( not ( = ?auto_2269923 ?auto_2269924 ) ) ( not ( = ?auto_2269923 ?auto_2269925 ) ) ( not ( = ?auto_2269930 ?auto_2269927 ) ) ( HOIST-AT ?auto_2269928 ?auto_2269930 ) ( not ( = ?auto_2269932 ?auto_2269928 ) ) ( SURFACE-AT ?auto_2269925 ?auto_2269930 ) ( ON ?auto_2269925 ?auto_2269929 ) ( CLEAR ?auto_2269925 ) ( not ( = ?auto_2269924 ?auto_2269929 ) ) ( not ( = ?auto_2269925 ?auto_2269929 ) ) ( not ( = ?auto_2269923 ?auto_2269929 ) ) ( SURFACE-AT ?auto_2269923 ?auto_2269927 ) ( CLEAR ?auto_2269923 ) ( IS-CRATE ?auto_2269924 ) ( AVAILABLE ?auto_2269932 ) ( TRUCK-AT ?auto_2269931 ?auto_2269930 ) ( AVAILABLE ?auto_2269928 ) ( SURFACE-AT ?auto_2269924 ?auto_2269930 ) ( ON ?auto_2269924 ?auto_2269926 ) ( CLEAR ?auto_2269924 ) ( not ( = ?auto_2269924 ?auto_2269926 ) ) ( not ( = ?auto_2269925 ?auto_2269926 ) ) ( not ( = ?auto_2269923 ?auto_2269926 ) ) ( not ( = ?auto_2269929 ?auto_2269926 ) ) ( ON ?auto_2269920 ?auto_2269919 ) ( ON ?auto_2269921 ?auto_2269920 ) ( ON ?auto_2269922 ?auto_2269921 ) ( ON ?auto_2269923 ?auto_2269922 ) ( not ( = ?auto_2269919 ?auto_2269920 ) ) ( not ( = ?auto_2269919 ?auto_2269921 ) ) ( not ( = ?auto_2269919 ?auto_2269922 ) ) ( not ( = ?auto_2269919 ?auto_2269923 ) ) ( not ( = ?auto_2269919 ?auto_2269924 ) ) ( not ( = ?auto_2269919 ?auto_2269925 ) ) ( not ( = ?auto_2269919 ?auto_2269929 ) ) ( not ( = ?auto_2269919 ?auto_2269926 ) ) ( not ( = ?auto_2269920 ?auto_2269921 ) ) ( not ( = ?auto_2269920 ?auto_2269922 ) ) ( not ( = ?auto_2269920 ?auto_2269923 ) ) ( not ( = ?auto_2269920 ?auto_2269924 ) ) ( not ( = ?auto_2269920 ?auto_2269925 ) ) ( not ( = ?auto_2269920 ?auto_2269929 ) ) ( not ( = ?auto_2269920 ?auto_2269926 ) ) ( not ( = ?auto_2269921 ?auto_2269922 ) ) ( not ( = ?auto_2269921 ?auto_2269923 ) ) ( not ( = ?auto_2269921 ?auto_2269924 ) ) ( not ( = ?auto_2269921 ?auto_2269925 ) ) ( not ( = ?auto_2269921 ?auto_2269929 ) ) ( not ( = ?auto_2269921 ?auto_2269926 ) ) ( not ( = ?auto_2269922 ?auto_2269923 ) ) ( not ( = ?auto_2269922 ?auto_2269924 ) ) ( not ( = ?auto_2269922 ?auto_2269925 ) ) ( not ( = ?auto_2269922 ?auto_2269929 ) ) ( not ( = ?auto_2269922 ?auto_2269926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269923 ?auto_2269924 ?auto_2269925 )
      ( MAKE-6CRATE-VERIFY ?auto_2269919 ?auto_2269920 ?auto_2269921 ?auto_2269922 ?auto_2269923 ?auto_2269924 ?auto_2269925 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2269933 - SURFACE
      ?auto_2269934 - SURFACE
      ?auto_2269935 - SURFACE
      ?auto_2269936 - SURFACE
      ?auto_2269937 - SURFACE
      ?auto_2269938 - SURFACE
      ?auto_2269939 - SURFACE
      ?auto_2269940 - SURFACE
    )
    :vars
    (
      ?auto_2269947 - HOIST
      ?auto_2269942 - PLACE
      ?auto_2269945 - PLACE
      ?auto_2269943 - HOIST
      ?auto_2269944 - SURFACE
      ?auto_2269946 - TRUCK
      ?auto_2269941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269947 ?auto_2269942 ) ( IS-CRATE ?auto_2269940 ) ( not ( = ?auto_2269939 ?auto_2269940 ) ) ( not ( = ?auto_2269938 ?auto_2269939 ) ) ( not ( = ?auto_2269938 ?auto_2269940 ) ) ( not ( = ?auto_2269945 ?auto_2269942 ) ) ( HOIST-AT ?auto_2269943 ?auto_2269945 ) ( not ( = ?auto_2269947 ?auto_2269943 ) ) ( SURFACE-AT ?auto_2269940 ?auto_2269945 ) ( ON ?auto_2269940 ?auto_2269944 ) ( CLEAR ?auto_2269940 ) ( not ( = ?auto_2269939 ?auto_2269944 ) ) ( not ( = ?auto_2269940 ?auto_2269944 ) ) ( not ( = ?auto_2269938 ?auto_2269944 ) ) ( SURFACE-AT ?auto_2269938 ?auto_2269942 ) ( CLEAR ?auto_2269938 ) ( IS-CRATE ?auto_2269939 ) ( AVAILABLE ?auto_2269947 ) ( TRUCK-AT ?auto_2269946 ?auto_2269945 ) ( AVAILABLE ?auto_2269943 ) ( SURFACE-AT ?auto_2269939 ?auto_2269945 ) ( ON ?auto_2269939 ?auto_2269941 ) ( CLEAR ?auto_2269939 ) ( not ( = ?auto_2269939 ?auto_2269941 ) ) ( not ( = ?auto_2269940 ?auto_2269941 ) ) ( not ( = ?auto_2269938 ?auto_2269941 ) ) ( not ( = ?auto_2269944 ?auto_2269941 ) ) ( ON ?auto_2269934 ?auto_2269933 ) ( ON ?auto_2269935 ?auto_2269934 ) ( ON ?auto_2269936 ?auto_2269935 ) ( ON ?auto_2269937 ?auto_2269936 ) ( ON ?auto_2269938 ?auto_2269937 ) ( not ( = ?auto_2269933 ?auto_2269934 ) ) ( not ( = ?auto_2269933 ?auto_2269935 ) ) ( not ( = ?auto_2269933 ?auto_2269936 ) ) ( not ( = ?auto_2269933 ?auto_2269937 ) ) ( not ( = ?auto_2269933 ?auto_2269938 ) ) ( not ( = ?auto_2269933 ?auto_2269939 ) ) ( not ( = ?auto_2269933 ?auto_2269940 ) ) ( not ( = ?auto_2269933 ?auto_2269944 ) ) ( not ( = ?auto_2269933 ?auto_2269941 ) ) ( not ( = ?auto_2269934 ?auto_2269935 ) ) ( not ( = ?auto_2269934 ?auto_2269936 ) ) ( not ( = ?auto_2269934 ?auto_2269937 ) ) ( not ( = ?auto_2269934 ?auto_2269938 ) ) ( not ( = ?auto_2269934 ?auto_2269939 ) ) ( not ( = ?auto_2269934 ?auto_2269940 ) ) ( not ( = ?auto_2269934 ?auto_2269944 ) ) ( not ( = ?auto_2269934 ?auto_2269941 ) ) ( not ( = ?auto_2269935 ?auto_2269936 ) ) ( not ( = ?auto_2269935 ?auto_2269937 ) ) ( not ( = ?auto_2269935 ?auto_2269938 ) ) ( not ( = ?auto_2269935 ?auto_2269939 ) ) ( not ( = ?auto_2269935 ?auto_2269940 ) ) ( not ( = ?auto_2269935 ?auto_2269944 ) ) ( not ( = ?auto_2269935 ?auto_2269941 ) ) ( not ( = ?auto_2269936 ?auto_2269937 ) ) ( not ( = ?auto_2269936 ?auto_2269938 ) ) ( not ( = ?auto_2269936 ?auto_2269939 ) ) ( not ( = ?auto_2269936 ?auto_2269940 ) ) ( not ( = ?auto_2269936 ?auto_2269944 ) ) ( not ( = ?auto_2269936 ?auto_2269941 ) ) ( not ( = ?auto_2269937 ?auto_2269938 ) ) ( not ( = ?auto_2269937 ?auto_2269939 ) ) ( not ( = ?auto_2269937 ?auto_2269940 ) ) ( not ( = ?auto_2269937 ?auto_2269944 ) ) ( not ( = ?auto_2269937 ?auto_2269941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269938 ?auto_2269939 ?auto_2269940 )
      ( MAKE-7CRATE-VERIFY ?auto_2269933 ?auto_2269934 ?auto_2269935 ?auto_2269936 ?auto_2269937 ?auto_2269938 ?auto_2269939 ?auto_2269940 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269948 - SURFACE
      ?auto_2269949 - SURFACE
      ?auto_2269950 - SURFACE
      ?auto_2269951 - SURFACE
      ?auto_2269952 - SURFACE
      ?auto_2269953 - SURFACE
      ?auto_2269954 - SURFACE
      ?auto_2269955 - SURFACE
      ?auto_2269956 - SURFACE
    )
    :vars
    (
      ?auto_2269963 - HOIST
      ?auto_2269958 - PLACE
      ?auto_2269961 - PLACE
      ?auto_2269959 - HOIST
      ?auto_2269960 - SURFACE
      ?auto_2269962 - TRUCK
      ?auto_2269957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269963 ?auto_2269958 ) ( IS-CRATE ?auto_2269956 ) ( not ( = ?auto_2269955 ?auto_2269956 ) ) ( not ( = ?auto_2269954 ?auto_2269955 ) ) ( not ( = ?auto_2269954 ?auto_2269956 ) ) ( not ( = ?auto_2269961 ?auto_2269958 ) ) ( HOIST-AT ?auto_2269959 ?auto_2269961 ) ( not ( = ?auto_2269963 ?auto_2269959 ) ) ( SURFACE-AT ?auto_2269956 ?auto_2269961 ) ( ON ?auto_2269956 ?auto_2269960 ) ( CLEAR ?auto_2269956 ) ( not ( = ?auto_2269955 ?auto_2269960 ) ) ( not ( = ?auto_2269956 ?auto_2269960 ) ) ( not ( = ?auto_2269954 ?auto_2269960 ) ) ( SURFACE-AT ?auto_2269954 ?auto_2269958 ) ( CLEAR ?auto_2269954 ) ( IS-CRATE ?auto_2269955 ) ( AVAILABLE ?auto_2269963 ) ( TRUCK-AT ?auto_2269962 ?auto_2269961 ) ( AVAILABLE ?auto_2269959 ) ( SURFACE-AT ?auto_2269955 ?auto_2269961 ) ( ON ?auto_2269955 ?auto_2269957 ) ( CLEAR ?auto_2269955 ) ( not ( = ?auto_2269955 ?auto_2269957 ) ) ( not ( = ?auto_2269956 ?auto_2269957 ) ) ( not ( = ?auto_2269954 ?auto_2269957 ) ) ( not ( = ?auto_2269960 ?auto_2269957 ) ) ( ON ?auto_2269949 ?auto_2269948 ) ( ON ?auto_2269950 ?auto_2269949 ) ( ON ?auto_2269951 ?auto_2269950 ) ( ON ?auto_2269952 ?auto_2269951 ) ( ON ?auto_2269953 ?auto_2269952 ) ( ON ?auto_2269954 ?auto_2269953 ) ( not ( = ?auto_2269948 ?auto_2269949 ) ) ( not ( = ?auto_2269948 ?auto_2269950 ) ) ( not ( = ?auto_2269948 ?auto_2269951 ) ) ( not ( = ?auto_2269948 ?auto_2269952 ) ) ( not ( = ?auto_2269948 ?auto_2269953 ) ) ( not ( = ?auto_2269948 ?auto_2269954 ) ) ( not ( = ?auto_2269948 ?auto_2269955 ) ) ( not ( = ?auto_2269948 ?auto_2269956 ) ) ( not ( = ?auto_2269948 ?auto_2269960 ) ) ( not ( = ?auto_2269948 ?auto_2269957 ) ) ( not ( = ?auto_2269949 ?auto_2269950 ) ) ( not ( = ?auto_2269949 ?auto_2269951 ) ) ( not ( = ?auto_2269949 ?auto_2269952 ) ) ( not ( = ?auto_2269949 ?auto_2269953 ) ) ( not ( = ?auto_2269949 ?auto_2269954 ) ) ( not ( = ?auto_2269949 ?auto_2269955 ) ) ( not ( = ?auto_2269949 ?auto_2269956 ) ) ( not ( = ?auto_2269949 ?auto_2269960 ) ) ( not ( = ?auto_2269949 ?auto_2269957 ) ) ( not ( = ?auto_2269950 ?auto_2269951 ) ) ( not ( = ?auto_2269950 ?auto_2269952 ) ) ( not ( = ?auto_2269950 ?auto_2269953 ) ) ( not ( = ?auto_2269950 ?auto_2269954 ) ) ( not ( = ?auto_2269950 ?auto_2269955 ) ) ( not ( = ?auto_2269950 ?auto_2269956 ) ) ( not ( = ?auto_2269950 ?auto_2269960 ) ) ( not ( = ?auto_2269950 ?auto_2269957 ) ) ( not ( = ?auto_2269951 ?auto_2269952 ) ) ( not ( = ?auto_2269951 ?auto_2269953 ) ) ( not ( = ?auto_2269951 ?auto_2269954 ) ) ( not ( = ?auto_2269951 ?auto_2269955 ) ) ( not ( = ?auto_2269951 ?auto_2269956 ) ) ( not ( = ?auto_2269951 ?auto_2269960 ) ) ( not ( = ?auto_2269951 ?auto_2269957 ) ) ( not ( = ?auto_2269952 ?auto_2269953 ) ) ( not ( = ?auto_2269952 ?auto_2269954 ) ) ( not ( = ?auto_2269952 ?auto_2269955 ) ) ( not ( = ?auto_2269952 ?auto_2269956 ) ) ( not ( = ?auto_2269952 ?auto_2269960 ) ) ( not ( = ?auto_2269952 ?auto_2269957 ) ) ( not ( = ?auto_2269953 ?auto_2269954 ) ) ( not ( = ?auto_2269953 ?auto_2269955 ) ) ( not ( = ?auto_2269953 ?auto_2269956 ) ) ( not ( = ?auto_2269953 ?auto_2269960 ) ) ( not ( = ?auto_2269953 ?auto_2269957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269954 ?auto_2269955 ?auto_2269956 )
      ( MAKE-8CRATE-VERIFY ?auto_2269948 ?auto_2269949 ?auto_2269950 ?auto_2269951 ?auto_2269952 ?auto_2269953 ?auto_2269954 ?auto_2269955 ?auto_2269956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2269964 - SURFACE
      ?auto_2269965 - SURFACE
    )
    :vars
    (
      ?auto_2269973 - HOIST
      ?auto_2269968 - PLACE
      ?auto_2269966 - SURFACE
      ?auto_2269971 - PLACE
      ?auto_2269969 - HOIST
      ?auto_2269970 - SURFACE
      ?auto_2269967 - SURFACE
      ?auto_2269972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269973 ?auto_2269968 ) ( IS-CRATE ?auto_2269965 ) ( not ( = ?auto_2269964 ?auto_2269965 ) ) ( not ( = ?auto_2269966 ?auto_2269964 ) ) ( not ( = ?auto_2269966 ?auto_2269965 ) ) ( not ( = ?auto_2269971 ?auto_2269968 ) ) ( HOIST-AT ?auto_2269969 ?auto_2269971 ) ( not ( = ?auto_2269973 ?auto_2269969 ) ) ( SURFACE-AT ?auto_2269965 ?auto_2269971 ) ( ON ?auto_2269965 ?auto_2269970 ) ( CLEAR ?auto_2269965 ) ( not ( = ?auto_2269964 ?auto_2269970 ) ) ( not ( = ?auto_2269965 ?auto_2269970 ) ) ( not ( = ?auto_2269966 ?auto_2269970 ) ) ( SURFACE-AT ?auto_2269966 ?auto_2269968 ) ( CLEAR ?auto_2269966 ) ( IS-CRATE ?auto_2269964 ) ( AVAILABLE ?auto_2269973 ) ( AVAILABLE ?auto_2269969 ) ( SURFACE-AT ?auto_2269964 ?auto_2269971 ) ( ON ?auto_2269964 ?auto_2269967 ) ( CLEAR ?auto_2269964 ) ( not ( = ?auto_2269964 ?auto_2269967 ) ) ( not ( = ?auto_2269965 ?auto_2269967 ) ) ( not ( = ?auto_2269966 ?auto_2269967 ) ) ( not ( = ?auto_2269970 ?auto_2269967 ) ) ( TRUCK-AT ?auto_2269972 ?auto_2269968 ) )
    :subtasks
    ( ( !DRIVE ?auto_2269972 ?auto_2269968 ?auto_2269971 )
      ( MAKE-2CRATE ?auto_2269966 ?auto_2269964 ?auto_2269965 )
      ( MAKE-1CRATE-VERIFY ?auto_2269964 ?auto_2269965 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2269974 - SURFACE
      ?auto_2269975 - SURFACE
      ?auto_2269976 - SURFACE
    )
    :vars
    (
      ?auto_2269979 - HOIST
      ?auto_2269983 - PLACE
      ?auto_2269980 - PLACE
      ?auto_2269982 - HOIST
      ?auto_2269981 - SURFACE
      ?auto_2269978 - SURFACE
      ?auto_2269977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269979 ?auto_2269983 ) ( IS-CRATE ?auto_2269976 ) ( not ( = ?auto_2269975 ?auto_2269976 ) ) ( not ( = ?auto_2269974 ?auto_2269975 ) ) ( not ( = ?auto_2269974 ?auto_2269976 ) ) ( not ( = ?auto_2269980 ?auto_2269983 ) ) ( HOIST-AT ?auto_2269982 ?auto_2269980 ) ( not ( = ?auto_2269979 ?auto_2269982 ) ) ( SURFACE-AT ?auto_2269976 ?auto_2269980 ) ( ON ?auto_2269976 ?auto_2269981 ) ( CLEAR ?auto_2269976 ) ( not ( = ?auto_2269975 ?auto_2269981 ) ) ( not ( = ?auto_2269976 ?auto_2269981 ) ) ( not ( = ?auto_2269974 ?auto_2269981 ) ) ( SURFACE-AT ?auto_2269974 ?auto_2269983 ) ( CLEAR ?auto_2269974 ) ( IS-CRATE ?auto_2269975 ) ( AVAILABLE ?auto_2269979 ) ( AVAILABLE ?auto_2269982 ) ( SURFACE-AT ?auto_2269975 ?auto_2269980 ) ( ON ?auto_2269975 ?auto_2269978 ) ( CLEAR ?auto_2269975 ) ( not ( = ?auto_2269975 ?auto_2269978 ) ) ( not ( = ?auto_2269976 ?auto_2269978 ) ) ( not ( = ?auto_2269974 ?auto_2269978 ) ) ( not ( = ?auto_2269981 ?auto_2269978 ) ) ( TRUCK-AT ?auto_2269977 ?auto_2269983 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2269975 ?auto_2269976 )
      ( MAKE-2CRATE-VERIFY ?auto_2269974 ?auto_2269975 ?auto_2269976 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2269984 - SURFACE
      ?auto_2269985 - SURFACE
      ?auto_2269986 - SURFACE
      ?auto_2269987 - SURFACE
    )
    :vars
    (
      ?auto_2269990 - HOIST
      ?auto_2269991 - PLACE
      ?auto_2269988 - PLACE
      ?auto_2269992 - HOIST
      ?auto_2269994 - SURFACE
      ?auto_2269993 - SURFACE
      ?auto_2269989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269990 ?auto_2269991 ) ( IS-CRATE ?auto_2269987 ) ( not ( = ?auto_2269986 ?auto_2269987 ) ) ( not ( = ?auto_2269985 ?auto_2269986 ) ) ( not ( = ?auto_2269985 ?auto_2269987 ) ) ( not ( = ?auto_2269988 ?auto_2269991 ) ) ( HOIST-AT ?auto_2269992 ?auto_2269988 ) ( not ( = ?auto_2269990 ?auto_2269992 ) ) ( SURFACE-AT ?auto_2269987 ?auto_2269988 ) ( ON ?auto_2269987 ?auto_2269994 ) ( CLEAR ?auto_2269987 ) ( not ( = ?auto_2269986 ?auto_2269994 ) ) ( not ( = ?auto_2269987 ?auto_2269994 ) ) ( not ( = ?auto_2269985 ?auto_2269994 ) ) ( SURFACE-AT ?auto_2269985 ?auto_2269991 ) ( CLEAR ?auto_2269985 ) ( IS-CRATE ?auto_2269986 ) ( AVAILABLE ?auto_2269990 ) ( AVAILABLE ?auto_2269992 ) ( SURFACE-AT ?auto_2269986 ?auto_2269988 ) ( ON ?auto_2269986 ?auto_2269993 ) ( CLEAR ?auto_2269986 ) ( not ( = ?auto_2269986 ?auto_2269993 ) ) ( not ( = ?auto_2269987 ?auto_2269993 ) ) ( not ( = ?auto_2269985 ?auto_2269993 ) ) ( not ( = ?auto_2269994 ?auto_2269993 ) ) ( TRUCK-AT ?auto_2269989 ?auto_2269991 ) ( ON ?auto_2269985 ?auto_2269984 ) ( not ( = ?auto_2269984 ?auto_2269985 ) ) ( not ( = ?auto_2269984 ?auto_2269986 ) ) ( not ( = ?auto_2269984 ?auto_2269987 ) ) ( not ( = ?auto_2269984 ?auto_2269994 ) ) ( not ( = ?auto_2269984 ?auto_2269993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269985 ?auto_2269986 ?auto_2269987 )
      ( MAKE-3CRATE-VERIFY ?auto_2269984 ?auto_2269985 ?auto_2269986 ?auto_2269987 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2269995 - SURFACE
      ?auto_2269996 - SURFACE
      ?auto_2269997 - SURFACE
      ?auto_2269998 - SURFACE
      ?auto_2269999 - SURFACE
    )
    :vars
    (
      ?auto_2270002 - HOIST
      ?auto_2270003 - PLACE
      ?auto_2270000 - PLACE
      ?auto_2270004 - HOIST
      ?auto_2270006 - SURFACE
      ?auto_2270005 - SURFACE
      ?auto_2270001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270002 ?auto_2270003 ) ( IS-CRATE ?auto_2269999 ) ( not ( = ?auto_2269998 ?auto_2269999 ) ) ( not ( = ?auto_2269997 ?auto_2269998 ) ) ( not ( = ?auto_2269997 ?auto_2269999 ) ) ( not ( = ?auto_2270000 ?auto_2270003 ) ) ( HOIST-AT ?auto_2270004 ?auto_2270000 ) ( not ( = ?auto_2270002 ?auto_2270004 ) ) ( SURFACE-AT ?auto_2269999 ?auto_2270000 ) ( ON ?auto_2269999 ?auto_2270006 ) ( CLEAR ?auto_2269999 ) ( not ( = ?auto_2269998 ?auto_2270006 ) ) ( not ( = ?auto_2269999 ?auto_2270006 ) ) ( not ( = ?auto_2269997 ?auto_2270006 ) ) ( SURFACE-AT ?auto_2269997 ?auto_2270003 ) ( CLEAR ?auto_2269997 ) ( IS-CRATE ?auto_2269998 ) ( AVAILABLE ?auto_2270002 ) ( AVAILABLE ?auto_2270004 ) ( SURFACE-AT ?auto_2269998 ?auto_2270000 ) ( ON ?auto_2269998 ?auto_2270005 ) ( CLEAR ?auto_2269998 ) ( not ( = ?auto_2269998 ?auto_2270005 ) ) ( not ( = ?auto_2269999 ?auto_2270005 ) ) ( not ( = ?auto_2269997 ?auto_2270005 ) ) ( not ( = ?auto_2270006 ?auto_2270005 ) ) ( TRUCK-AT ?auto_2270001 ?auto_2270003 ) ( ON ?auto_2269996 ?auto_2269995 ) ( ON ?auto_2269997 ?auto_2269996 ) ( not ( = ?auto_2269995 ?auto_2269996 ) ) ( not ( = ?auto_2269995 ?auto_2269997 ) ) ( not ( = ?auto_2269995 ?auto_2269998 ) ) ( not ( = ?auto_2269995 ?auto_2269999 ) ) ( not ( = ?auto_2269995 ?auto_2270006 ) ) ( not ( = ?auto_2269995 ?auto_2270005 ) ) ( not ( = ?auto_2269996 ?auto_2269997 ) ) ( not ( = ?auto_2269996 ?auto_2269998 ) ) ( not ( = ?auto_2269996 ?auto_2269999 ) ) ( not ( = ?auto_2269996 ?auto_2270006 ) ) ( not ( = ?auto_2269996 ?auto_2270005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269997 ?auto_2269998 ?auto_2269999 )
      ( MAKE-4CRATE-VERIFY ?auto_2269995 ?auto_2269996 ?auto_2269997 ?auto_2269998 ?auto_2269999 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2270007 - SURFACE
      ?auto_2270008 - SURFACE
      ?auto_2270009 - SURFACE
      ?auto_2270010 - SURFACE
      ?auto_2270011 - SURFACE
      ?auto_2270012 - SURFACE
    )
    :vars
    (
      ?auto_2270015 - HOIST
      ?auto_2270016 - PLACE
      ?auto_2270013 - PLACE
      ?auto_2270017 - HOIST
      ?auto_2270019 - SURFACE
      ?auto_2270018 - SURFACE
      ?auto_2270014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270015 ?auto_2270016 ) ( IS-CRATE ?auto_2270012 ) ( not ( = ?auto_2270011 ?auto_2270012 ) ) ( not ( = ?auto_2270010 ?auto_2270011 ) ) ( not ( = ?auto_2270010 ?auto_2270012 ) ) ( not ( = ?auto_2270013 ?auto_2270016 ) ) ( HOIST-AT ?auto_2270017 ?auto_2270013 ) ( not ( = ?auto_2270015 ?auto_2270017 ) ) ( SURFACE-AT ?auto_2270012 ?auto_2270013 ) ( ON ?auto_2270012 ?auto_2270019 ) ( CLEAR ?auto_2270012 ) ( not ( = ?auto_2270011 ?auto_2270019 ) ) ( not ( = ?auto_2270012 ?auto_2270019 ) ) ( not ( = ?auto_2270010 ?auto_2270019 ) ) ( SURFACE-AT ?auto_2270010 ?auto_2270016 ) ( CLEAR ?auto_2270010 ) ( IS-CRATE ?auto_2270011 ) ( AVAILABLE ?auto_2270015 ) ( AVAILABLE ?auto_2270017 ) ( SURFACE-AT ?auto_2270011 ?auto_2270013 ) ( ON ?auto_2270011 ?auto_2270018 ) ( CLEAR ?auto_2270011 ) ( not ( = ?auto_2270011 ?auto_2270018 ) ) ( not ( = ?auto_2270012 ?auto_2270018 ) ) ( not ( = ?auto_2270010 ?auto_2270018 ) ) ( not ( = ?auto_2270019 ?auto_2270018 ) ) ( TRUCK-AT ?auto_2270014 ?auto_2270016 ) ( ON ?auto_2270008 ?auto_2270007 ) ( ON ?auto_2270009 ?auto_2270008 ) ( ON ?auto_2270010 ?auto_2270009 ) ( not ( = ?auto_2270007 ?auto_2270008 ) ) ( not ( = ?auto_2270007 ?auto_2270009 ) ) ( not ( = ?auto_2270007 ?auto_2270010 ) ) ( not ( = ?auto_2270007 ?auto_2270011 ) ) ( not ( = ?auto_2270007 ?auto_2270012 ) ) ( not ( = ?auto_2270007 ?auto_2270019 ) ) ( not ( = ?auto_2270007 ?auto_2270018 ) ) ( not ( = ?auto_2270008 ?auto_2270009 ) ) ( not ( = ?auto_2270008 ?auto_2270010 ) ) ( not ( = ?auto_2270008 ?auto_2270011 ) ) ( not ( = ?auto_2270008 ?auto_2270012 ) ) ( not ( = ?auto_2270008 ?auto_2270019 ) ) ( not ( = ?auto_2270008 ?auto_2270018 ) ) ( not ( = ?auto_2270009 ?auto_2270010 ) ) ( not ( = ?auto_2270009 ?auto_2270011 ) ) ( not ( = ?auto_2270009 ?auto_2270012 ) ) ( not ( = ?auto_2270009 ?auto_2270019 ) ) ( not ( = ?auto_2270009 ?auto_2270018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270010 ?auto_2270011 ?auto_2270012 )
      ( MAKE-5CRATE-VERIFY ?auto_2270007 ?auto_2270008 ?auto_2270009 ?auto_2270010 ?auto_2270011 ?auto_2270012 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2270020 - SURFACE
      ?auto_2270021 - SURFACE
      ?auto_2270022 - SURFACE
      ?auto_2270023 - SURFACE
      ?auto_2270024 - SURFACE
      ?auto_2270025 - SURFACE
      ?auto_2270026 - SURFACE
    )
    :vars
    (
      ?auto_2270029 - HOIST
      ?auto_2270030 - PLACE
      ?auto_2270027 - PLACE
      ?auto_2270031 - HOIST
      ?auto_2270033 - SURFACE
      ?auto_2270032 - SURFACE
      ?auto_2270028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270029 ?auto_2270030 ) ( IS-CRATE ?auto_2270026 ) ( not ( = ?auto_2270025 ?auto_2270026 ) ) ( not ( = ?auto_2270024 ?auto_2270025 ) ) ( not ( = ?auto_2270024 ?auto_2270026 ) ) ( not ( = ?auto_2270027 ?auto_2270030 ) ) ( HOIST-AT ?auto_2270031 ?auto_2270027 ) ( not ( = ?auto_2270029 ?auto_2270031 ) ) ( SURFACE-AT ?auto_2270026 ?auto_2270027 ) ( ON ?auto_2270026 ?auto_2270033 ) ( CLEAR ?auto_2270026 ) ( not ( = ?auto_2270025 ?auto_2270033 ) ) ( not ( = ?auto_2270026 ?auto_2270033 ) ) ( not ( = ?auto_2270024 ?auto_2270033 ) ) ( SURFACE-AT ?auto_2270024 ?auto_2270030 ) ( CLEAR ?auto_2270024 ) ( IS-CRATE ?auto_2270025 ) ( AVAILABLE ?auto_2270029 ) ( AVAILABLE ?auto_2270031 ) ( SURFACE-AT ?auto_2270025 ?auto_2270027 ) ( ON ?auto_2270025 ?auto_2270032 ) ( CLEAR ?auto_2270025 ) ( not ( = ?auto_2270025 ?auto_2270032 ) ) ( not ( = ?auto_2270026 ?auto_2270032 ) ) ( not ( = ?auto_2270024 ?auto_2270032 ) ) ( not ( = ?auto_2270033 ?auto_2270032 ) ) ( TRUCK-AT ?auto_2270028 ?auto_2270030 ) ( ON ?auto_2270021 ?auto_2270020 ) ( ON ?auto_2270022 ?auto_2270021 ) ( ON ?auto_2270023 ?auto_2270022 ) ( ON ?auto_2270024 ?auto_2270023 ) ( not ( = ?auto_2270020 ?auto_2270021 ) ) ( not ( = ?auto_2270020 ?auto_2270022 ) ) ( not ( = ?auto_2270020 ?auto_2270023 ) ) ( not ( = ?auto_2270020 ?auto_2270024 ) ) ( not ( = ?auto_2270020 ?auto_2270025 ) ) ( not ( = ?auto_2270020 ?auto_2270026 ) ) ( not ( = ?auto_2270020 ?auto_2270033 ) ) ( not ( = ?auto_2270020 ?auto_2270032 ) ) ( not ( = ?auto_2270021 ?auto_2270022 ) ) ( not ( = ?auto_2270021 ?auto_2270023 ) ) ( not ( = ?auto_2270021 ?auto_2270024 ) ) ( not ( = ?auto_2270021 ?auto_2270025 ) ) ( not ( = ?auto_2270021 ?auto_2270026 ) ) ( not ( = ?auto_2270021 ?auto_2270033 ) ) ( not ( = ?auto_2270021 ?auto_2270032 ) ) ( not ( = ?auto_2270022 ?auto_2270023 ) ) ( not ( = ?auto_2270022 ?auto_2270024 ) ) ( not ( = ?auto_2270022 ?auto_2270025 ) ) ( not ( = ?auto_2270022 ?auto_2270026 ) ) ( not ( = ?auto_2270022 ?auto_2270033 ) ) ( not ( = ?auto_2270022 ?auto_2270032 ) ) ( not ( = ?auto_2270023 ?auto_2270024 ) ) ( not ( = ?auto_2270023 ?auto_2270025 ) ) ( not ( = ?auto_2270023 ?auto_2270026 ) ) ( not ( = ?auto_2270023 ?auto_2270033 ) ) ( not ( = ?auto_2270023 ?auto_2270032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270024 ?auto_2270025 ?auto_2270026 )
      ( MAKE-6CRATE-VERIFY ?auto_2270020 ?auto_2270021 ?auto_2270022 ?auto_2270023 ?auto_2270024 ?auto_2270025 ?auto_2270026 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2270034 - SURFACE
      ?auto_2270035 - SURFACE
      ?auto_2270036 - SURFACE
      ?auto_2270037 - SURFACE
      ?auto_2270038 - SURFACE
      ?auto_2270039 - SURFACE
      ?auto_2270040 - SURFACE
      ?auto_2270041 - SURFACE
    )
    :vars
    (
      ?auto_2270044 - HOIST
      ?auto_2270045 - PLACE
      ?auto_2270042 - PLACE
      ?auto_2270046 - HOIST
      ?auto_2270048 - SURFACE
      ?auto_2270047 - SURFACE
      ?auto_2270043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270044 ?auto_2270045 ) ( IS-CRATE ?auto_2270041 ) ( not ( = ?auto_2270040 ?auto_2270041 ) ) ( not ( = ?auto_2270039 ?auto_2270040 ) ) ( not ( = ?auto_2270039 ?auto_2270041 ) ) ( not ( = ?auto_2270042 ?auto_2270045 ) ) ( HOIST-AT ?auto_2270046 ?auto_2270042 ) ( not ( = ?auto_2270044 ?auto_2270046 ) ) ( SURFACE-AT ?auto_2270041 ?auto_2270042 ) ( ON ?auto_2270041 ?auto_2270048 ) ( CLEAR ?auto_2270041 ) ( not ( = ?auto_2270040 ?auto_2270048 ) ) ( not ( = ?auto_2270041 ?auto_2270048 ) ) ( not ( = ?auto_2270039 ?auto_2270048 ) ) ( SURFACE-AT ?auto_2270039 ?auto_2270045 ) ( CLEAR ?auto_2270039 ) ( IS-CRATE ?auto_2270040 ) ( AVAILABLE ?auto_2270044 ) ( AVAILABLE ?auto_2270046 ) ( SURFACE-AT ?auto_2270040 ?auto_2270042 ) ( ON ?auto_2270040 ?auto_2270047 ) ( CLEAR ?auto_2270040 ) ( not ( = ?auto_2270040 ?auto_2270047 ) ) ( not ( = ?auto_2270041 ?auto_2270047 ) ) ( not ( = ?auto_2270039 ?auto_2270047 ) ) ( not ( = ?auto_2270048 ?auto_2270047 ) ) ( TRUCK-AT ?auto_2270043 ?auto_2270045 ) ( ON ?auto_2270035 ?auto_2270034 ) ( ON ?auto_2270036 ?auto_2270035 ) ( ON ?auto_2270037 ?auto_2270036 ) ( ON ?auto_2270038 ?auto_2270037 ) ( ON ?auto_2270039 ?auto_2270038 ) ( not ( = ?auto_2270034 ?auto_2270035 ) ) ( not ( = ?auto_2270034 ?auto_2270036 ) ) ( not ( = ?auto_2270034 ?auto_2270037 ) ) ( not ( = ?auto_2270034 ?auto_2270038 ) ) ( not ( = ?auto_2270034 ?auto_2270039 ) ) ( not ( = ?auto_2270034 ?auto_2270040 ) ) ( not ( = ?auto_2270034 ?auto_2270041 ) ) ( not ( = ?auto_2270034 ?auto_2270048 ) ) ( not ( = ?auto_2270034 ?auto_2270047 ) ) ( not ( = ?auto_2270035 ?auto_2270036 ) ) ( not ( = ?auto_2270035 ?auto_2270037 ) ) ( not ( = ?auto_2270035 ?auto_2270038 ) ) ( not ( = ?auto_2270035 ?auto_2270039 ) ) ( not ( = ?auto_2270035 ?auto_2270040 ) ) ( not ( = ?auto_2270035 ?auto_2270041 ) ) ( not ( = ?auto_2270035 ?auto_2270048 ) ) ( not ( = ?auto_2270035 ?auto_2270047 ) ) ( not ( = ?auto_2270036 ?auto_2270037 ) ) ( not ( = ?auto_2270036 ?auto_2270038 ) ) ( not ( = ?auto_2270036 ?auto_2270039 ) ) ( not ( = ?auto_2270036 ?auto_2270040 ) ) ( not ( = ?auto_2270036 ?auto_2270041 ) ) ( not ( = ?auto_2270036 ?auto_2270048 ) ) ( not ( = ?auto_2270036 ?auto_2270047 ) ) ( not ( = ?auto_2270037 ?auto_2270038 ) ) ( not ( = ?auto_2270037 ?auto_2270039 ) ) ( not ( = ?auto_2270037 ?auto_2270040 ) ) ( not ( = ?auto_2270037 ?auto_2270041 ) ) ( not ( = ?auto_2270037 ?auto_2270048 ) ) ( not ( = ?auto_2270037 ?auto_2270047 ) ) ( not ( = ?auto_2270038 ?auto_2270039 ) ) ( not ( = ?auto_2270038 ?auto_2270040 ) ) ( not ( = ?auto_2270038 ?auto_2270041 ) ) ( not ( = ?auto_2270038 ?auto_2270048 ) ) ( not ( = ?auto_2270038 ?auto_2270047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270039 ?auto_2270040 ?auto_2270041 )
      ( MAKE-7CRATE-VERIFY ?auto_2270034 ?auto_2270035 ?auto_2270036 ?auto_2270037 ?auto_2270038 ?auto_2270039 ?auto_2270040 ?auto_2270041 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2270049 - SURFACE
      ?auto_2270050 - SURFACE
      ?auto_2270051 - SURFACE
      ?auto_2270052 - SURFACE
      ?auto_2270053 - SURFACE
      ?auto_2270054 - SURFACE
      ?auto_2270055 - SURFACE
      ?auto_2270056 - SURFACE
      ?auto_2270057 - SURFACE
    )
    :vars
    (
      ?auto_2270060 - HOIST
      ?auto_2270061 - PLACE
      ?auto_2270058 - PLACE
      ?auto_2270062 - HOIST
      ?auto_2270064 - SURFACE
      ?auto_2270063 - SURFACE
      ?auto_2270059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270060 ?auto_2270061 ) ( IS-CRATE ?auto_2270057 ) ( not ( = ?auto_2270056 ?auto_2270057 ) ) ( not ( = ?auto_2270055 ?auto_2270056 ) ) ( not ( = ?auto_2270055 ?auto_2270057 ) ) ( not ( = ?auto_2270058 ?auto_2270061 ) ) ( HOIST-AT ?auto_2270062 ?auto_2270058 ) ( not ( = ?auto_2270060 ?auto_2270062 ) ) ( SURFACE-AT ?auto_2270057 ?auto_2270058 ) ( ON ?auto_2270057 ?auto_2270064 ) ( CLEAR ?auto_2270057 ) ( not ( = ?auto_2270056 ?auto_2270064 ) ) ( not ( = ?auto_2270057 ?auto_2270064 ) ) ( not ( = ?auto_2270055 ?auto_2270064 ) ) ( SURFACE-AT ?auto_2270055 ?auto_2270061 ) ( CLEAR ?auto_2270055 ) ( IS-CRATE ?auto_2270056 ) ( AVAILABLE ?auto_2270060 ) ( AVAILABLE ?auto_2270062 ) ( SURFACE-AT ?auto_2270056 ?auto_2270058 ) ( ON ?auto_2270056 ?auto_2270063 ) ( CLEAR ?auto_2270056 ) ( not ( = ?auto_2270056 ?auto_2270063 ) ) ( not ( = ?auto_2270057 ?auto_2270063 ) ) ( not ( = ?auto_2270055 ?auto_2270063 ) ) ( not ( = ?auto_2270064 ?auto_2270063 ) ) ( TRUCK-AT ?auto_2270059 ?auto_2270061 ) ( ON ?auto_2270050 ?auto_2270049 ) ( ON ?auto_2270051 ?auto_2270050 ) ( ON ?auto_2270052 ?auto_2270051 ) ( ON ?auto_2270053 ?auto_2270052 ) ( ON ?auto_2270054 ?auto_2270053 ) ( ON ?auto_2270055 ?auto_2270054 ) ( not ( = ?auto_2270049 ?auto_2270050 ) ) ( not ( = ?auto_2270049 ?auto_2270051 ) ) ( not ( = ?auto_2270049 ?auto_2270052 ) ) ( not ( = ?auto_2270049 ?auto_2270053 ) ) ( not ( = ?auto_2270049 ?auto_2270054 ) ) ( not ( = ?auto_2270049 ?auto_2270055 ) ) ( not ( = ?auto_2270049 ?auto_2270056 ) ) ( not ( = ?auto_2270049 ?auto_2270057 ) ) ( not ( = ?auto_2270049 ?auto_2270064 ) ) ( not ( = ?auto_2270049 ?auto_2270063 ) ) ( not ( = ?auto_2270050 ?auto_2270051 ) ) ( not ( = ?auto_2270050 ?auto_2270052 ) ) ( not ( = ?auto_2270050 ?auto_2270053 ) ) ( not ( = ?auto_2270050 ?auto_2270054 ) ) ( not ( = ?auto_2270050 ?auto_2270055 ) ) ( not ( = ?auto_2270050 ?auto_2270056 ) ) ( not ( = ?auto_2270050 ?auto_2270057 ) ) ( not ( = ?auto_2270050 ?auto_2270064 ) ) ( not ( = ?auto_2270050 ?auto_2270063 ) ) ( not ( = ?auto_2270051 ?auto_2270052 ) ) ( not ( = ?auto_2270051 ?auto_2270053 ) ) ( not ( = ?auto_2270051 ?auto_2270054 ) ) ( not ( = ?auto_2270051 ?auto_2270055 ) ) ( not ( = ?auto_2270051 ?auto_2270056 ) ) ( not ( = ?auto_2270051 ?auto_2270057 ) ) ( not ( = ?auto_2270051 ?auto_2270064 ) ) ( not ( = ?auto_2270051 ?auto_2270063 ) ) ( not ( = ?auto_2270052 ?auto_2270053 ) ) ( not ( = ?auto_2270052 ?auto_2270054 ) ) ( not ( = ?auto_2270052 ?auto_2270055 ) ) ( not ( = ?auto_2270052 ?auto_2270056 ) ) ( not ( = ?auto_2270052 ?auto_2270057 ) ) ( not ( = ?auto_2270052 ?auto_2270064 ) ) ( not ( = ?auto_2270052 ?auto_2270063 ) ) ( not ( = ?auto_2270053 ?auto_2270054 ) ) ( not ( = ?auto_2270053 ?auto_2270055 ) ) ( not ( = ?auto_2270053 ?auto_2270056 ) ) ( not ( = ?auto_2270053 ?auto_2270057 ) ) ( not ( = ?auto_2270053 ?auto_2270064 ) ) ( not ( = ?auto_2270053 ?auto_2270063 ) ) ( not ( = ?auto_2270054 ?auto_2270055 ) ) ( not ( = ?auto_2270054 ?auto_2270056 ) ) ( not ( = ?auto_2270054 ?auto_2270057 ) ) ( not ( = ?auto_2270054 ?auto_2270064 ) ) ( not ( = ?auto_2270054 ?auto_2270063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270055 ?auto_2270056 ?auto_2270057 )
      ( MAKE-8CRATE-VERIFY ?auto_2270049 ?auto_2270050 ?auto_2270051 ?auto_2270052 ?auto_2270053 ?auto_2270054 ?auto_2270055 ?auto_2270056 ?auto_2270057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2270065 - SURFACE
      ?auto_2270066 - SURFACE
    )
    :vars
    (
      ?auto_2270069 - HOIST
      ?auto_2270070 - PLACE
      ?auto_2270072 - SURFACE
      ?auto_2270067 - PLACE
      ?auto_2270071 - HOIST
      ?auto_2270074 - SURFACE
      ?auto_2270073 - SURFACE
      ?auto_2270068 - TRUCK
      ?auto_2270075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270069 ?auto_2270070 ) ( IS-CRATE ?auto_2270066 ) ( not ( = ?auto_2270065 ?auto_2270066 ) ) ( not ( = ?auto_2270072 ?auto_2270065 ) ) ( not ( = ?auto_2270072 ?auto_2270066 ) ) ( not ( = ?auto_2270067 ?auto_2270070 ) ) ( HOIST-AT ?auto_2270071 ?auto_2270067 ) ( not ( = ?auto_2270069 ?auto_2270071 ) ) ( SURFACE-AT ?auto_2270066 ?auto_2270067 ) ( ON ?auto_2270066 ?auto_2270074 ) ( CLEAR ?auto_2270066 ) ( not ( = ?auto_2270065 ?auto_2270074 ) ) ( not ( = ?auto_2270066 ?auto_2270074 ) ) ( not ( = ?auto_2270072 ?auto_2270074 ) ) ( IS-CRATE ?auto_2270065 ) ( AVAILABLE ?auto_2270071 ) ( SURFACE-AT ?auto_2270065 ?auto_2270067 ) ( ON ?auto_2270065 ?auto_2270073 ) ( CLEAR ?auto_2270065 ) ( not ( = ?auto_2270065 ?auto_2270073 ) ) ( not ( = ?auto_2270066 ?auto_2270073 ) ) ( not ( = ?auto_2270072 ?auto_2270073 ) ) ( not ( = ?auto_2270074 ?auto_2270073 ) ) ( TRUCK-AT ?auto_2270068 ?auto_2270070 ) ( SURFACE-AT ?auto_2270075 ?auto_2270070 ) ( CLEAR ?auto_2270075 ) ( LIFTING ?auto_2270069 ?auto_2270072 ) ( IS-CRATE ?auto_2270072 ) ( not ( = ?auto_2270075 ?auto_2270072 ) ) ( not ( = ?auto_2270065 ?auto_2270075 ) ) ( not ( = ?auto_2270066 ?auto_2270075 ) ) ( not ( = ?auto_2270074 ?auto_2270075 ) ) ( not ( = ?auto_2270073 ?auto_2270075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2270075 ?auto_2270072 )
      ( MAKE-2CRATE ?auto_2270072 ?auto_2270065 ?auto_2270066 )
      ( MAKE-1CRATE-VERIFY ?auto_2270065 ?auto_2270066 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2270076 - SURFACE
      ?auto_2270077 - SURFACE
      ?auto_2270078 - SURFACE
    )
    :vars
    (
      ?auto_2270084 - HOIST
      ?auto_2270080 - PLACE
      ?auto_2270081 - PLACE
      ?auto_2270082 - HOIST
      ?auto_2270086 - SURFACE
      ?auto_2270085 - SURFACE
      ?auto_2270079 - TRUCK
      ?auto_2270083 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270084 ?auto_2270080 ) ( IS-CRATE ?auto_2270078 ) ( not ( = ?auto_2270077 ?auto_2270078 ) ) ( not ( = ?auto_2270076 ?auto_2270077 ) ) ( not ( = ?auto_2270076 ?auto_2270078 ) ) ( not ( = ?auto_2270081 ?auto_2270080 ) ) ( HOIST-AT ?auto_2270082 ?auto_2270081 ) ( not ( = ?auto_2270084 ?auto_2270082 ) ) ( SURFACE-AT ?auto_2270078 ?auto_2270081 ) ( ON ?auto_2270078 ?auto_2270086 ) ( CLEAR ?auto_2270078 ) ( not ( = ?auto_2270077 ?auto_2270086 ) ) ( not ( = ?auto_2270078 ?auto_2270086 ) ) ( not ( = ?auto_2270076 ?auto_2270086 ) ) ( IS-CRATE ?auto_2270077 ) ( AVAILABLE ?auto_2270082 ) ( SURFACE-AT ?auto_2270077 ?auto_2270081 ) ( ON ?auto_2270077 ?auto_2270085 ) ( CLEAR ?auto_2270077 ) ( not ( = ?auto_2270077 ?auto_2270085 ) ) ( not ( = ?auto_2270078 ?auto_2270085 ) ) ( not ( = ?auto_2270076 ?auto_2270085 ) ) ( not ( = ?auto_2270086 ?auto_2270085 ) ) ( TRUCK-AT ?auto_2270079 ?auto_2270080 ) ( SURFACE-AT ?auto_2270083 ?auto_2270080 ) ( CLEAR ?auto_2270083 ) ( LIFTING ?auto_2270084 ?auto_2270076 ) ( IS-CRATE ?auto_2270076 ) ( not ( = ?auto_2270083 ?auto_2270076 ) ) ( not ( = ?auto_2270077 ?auto_2270083 ) ) ( not ( = ?auto_2270078 ?auto_2270083 ) ) ( not ( = ?auto_2270086 ?auto_2270083 ) ) ( not ( = ?auto_2270085 ?auto_2270083 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2270077 ?auto_2270078 )
      ( MAKE-2CRATE-VERIFY ?auto_2270076 ?auto_2270077 ?auto_2270078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2270087 - SURFACE
      ?auto_2270088 - SURFACE
      ?auto_2270089 - SURFACE
      ?auto_2270090 - SURFACE
    )
    :vars
    (
      ?auto_2270092 - HOIST
      ?auto_2270091 - PLACE
      ?auto_2270093 - PLACE
      ?auto_2270094 - HOIST
      ?auto_2270097 - SURFACE
      ?auto_2270096 - SURFACE
      ?auto_2270095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270092 ?auto_2270091 ) ( IS-CRATE ?auto_2270090 ) ( not ( = ?auto_2270089 ?auto_2270090 ) ) ( not ( = ?auto_2270088 ?auto_2270089 ) ) ( not ( = ?auto_2270088 ?auto_2270090 ) ) ( not ( = ?auto_2270093 ?auto_2270091 ) ) ( HOIST-AT ?auto_2270094 ?auto_2270093 ) ( not ( = ?auto_2270092 ?auto_2270094 ) ) ( SURFACE-AT ?auto_2270090 ?auto_2270093 ) ( ON ?auto_2270090 ?auto_2270097 ) ( CLEAR ?auto_2270090 ) ( not ( = ?auto_2270089 ?auto_2270097 ) ) ( not ( = ?auto_2270090 ?auto_2270097 ) ) ( not ( = ?auto_2270088 ?auto_2270097 ) ) ( IS-CRATE ?auto_2270089 ) ( AVAILABLE ?auto_2270094 ) ( SURFACE-AT ?auto_2270089 ?auto_2270093 ) ( ON ?auto_2270089 ?auto_2270096 ) ( CLEAR ?auto_2270089 ) ( not ( = ?auto_2270089 ?auto_2270096 ) ) ( not ( = ?auto_2270090 ?auto_2270096 ) ) ( not ( = ?auto_2270088 ?auto_2270096 ) ) ( not ( = ?auto_2270097 ?auto_2270096 ) ) ( TRUCK-AT ?auto_2270095 ?auto_2270091 ) ( SURFACE-AT ?auto_2270087 ?auto_2270091 ) ( CLEAR ?auto_2270087 ) ( LIFTING ?auto_2270092 ?auto_2270088 ) ( IS-CRATE ?auto_2270088 ) ( not ( = ?auto_2270087 ?auto_2270088 ) ) ( not ( = ?auto_2270089 ?auto_2270087 ) ) ( not ( = ?auto_2270090 ?auto_2270087 ) ) ( not ( = ?auto_2270097 ?auto_2270087 ) ) ( not ( = ?auto_2270096 ?auto_2270087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270088 ?auto_2270089 ?auto_2270090 )
      ( MAKE-3CRATE-VERIFY ?auto_2270087 ?auto_2270088 ?auto_2270089 ?auto_2270090 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2270098 - SURFACE
      ?auto_2270099 - SURFACE
      ?auto_2270100 - SURFACE
      ?auto_2270101 - SURFACE
      ?auto_2270102 - SURFACE
    )
    :vars
    (
      ?auto_2270104 - HOIST
      ?auto_2270103 - PLACE
      ?auto_2270105 - PLACE
      ?auto_2270106 - HOIST
      ?auto_2270109 - SURFACE
      ?auto_2270108 - SURFACE
      ?auto_2270107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270104 ?auto_2270103 ) ( IS-CRATE ?auto_2270102 ) ( not ( = ?auto_2270101 ?auto_2270102 ) ) ( not ( = ?auto_2270100 ?auto_2270101 ) ) ( not ( = ?auto_2270100 ?auto_2270102 ) ) ( not ( = ?auto_2270105 ?auto_2270103 ) ) ( HOIST-AT ?auto_2270106 ?auto_2270105 ) ( not ( = ?auto_2270104 ?auto_2270106 ) ) ( SURFACE-AT ?auto_2270102 ?auto_2270105 ) ( ON ?auto_2270102 ?auto_2270109 ) ( CLEAR ?auto_2270102 ) ( not ( = ?auto_2270101 ?auto_2270109 ) ) ( not ( = ?auto_2270102 ?auto_2270109 ) ) ( not ( = ?auto_2270100 ?auto_2270109 ) ) ( IS-CRATE ?auto_2270101 ) ( AVAILABLE ?auto_2270106 ) ( SURFACE-AT ?auto_2270101 ?auto_2270105 ) ( ON ?auto_2270101 ?auto_2270108 ) ( CLEAR ?auto_2270101 ) ( not ( = ?auto_2270101 ?auto_2270108 ) ) ( not ( = ?auto_2270102 ?auto_2270108 ) ) ( not ( = ?auto_2270100 ?auto_2270108 ) ) ( not ( = ?auto_2270109 ?auto_2270108 ) ) ( TRUCK-AT ?auto_2270107 ?auto_2270103 ) ( SURFACE-AT ?auto_2270099 ?auto_2270103 ) ( CLEAR ?auto_2270099 ) ( LIFTING ?auto_2270104 ?auto_2270100 ) ( IS-CRATE ?auto_2270100 ) ( not ( = ?auto_2270099 ?auto_2270100 ) ) ( not ( = ?auto_2270101 ?auto_2270099 ) ) ( not ( = ?auto_2270102 ?auto_2270099 ) ) ( not ( = ?auto_2270109 ?auto_2270099 ) ) ( not ( = ?auto_2270108 ?auto_2270099 ) ) ( ON ?auto_2270099 ?auto_2270098 ) ( not ( = ?auto_2270098 ?auto_2270099 ) ) ( not ( = ?auto_2270098 ?auto_2270100 ) ) ( not ( = ?auto_2270098 ?auto_2270101 ) ) ( not ( = ?auto_2270098 ?auto_2270102 ) ) ( not ( = ?auto_2270098 ?auto_2270109 ) ) ( not ( = ?auto_2270098 ?auto_2270108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270100 ?auto_2270101 ?auto_2270102 )
      ( MAKE-4CRATE-VERIFY ?auto_2270098 ?auto_2270099 ?auto_2270100 ?auto_2270101 ?auto_2270102 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2270110 - SURFACE
      ?auto_2270111 - SURFACE
      ?auto_2270112 - SURFACE
      ?auto_2270113 - SURFACE
      ?auto_2270114 - SURFACE
      ?auto_2270115 - SURFACE
    )
    :vars
    (
      ?auto_2270117 - HOIST
      ?auto_2270116 - PLACE
      ?auto_2270118 - PLACE
      ?auto_2270119 - HOIST
      ?auto_2270122 - SURFACE
      ?auto_2270121 - SURFACE
      ?auto_2270120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270117 ?auto_2270116 ) ( IS-CRATE ?auto_2270115 ) ( not ( = ?auto_2270114 ?auto_2270115 ) ) ( not ( = ?auto_2270113 ?auto_2270114 ) ) ( not ( = ?auto_2270113 ?auto_2270115 ) ) ( not ( = ?auto_2270118 ?auto_2270116 ) ) ( HOIST-AT ?auto_2270119 ?auto_2270118 ) ( not ( = ?auto_2270117 ?auto_2270119 ) ) ( SURFACE-AT ?auto_2270115 ?auto_2270118 ) ( ON ?auto_2270115 ?auto_2270122 ) ( CLEAR ?auto_2270115 ) ( not ( = ?auto_2270114 ?auto_2270122 ) ) ( not ( = ?auto_2270115 ?auto_2270122 ) ) ( not ( = ?auto_2270113 ?auto_2270122 ) ) ( IS-CRATE ?auto_2270114 ) ( AVAILABLE ?auto_2270119 ) ( SURFACE-AT ?auto_2270114 ?auto_2270118 ) ( ON ?auto_2270114 ?auto_2270121 ) ( CLEAR ?auto_2270114 ) ( not ( = ?auto_2270114 ?auto_2270121 ) ) ( not ( = ?auto_2270115 ?auto_2270121 ) ) ( not ( = ?auto_2270113 ?auto_2270121 ) ) ( not ( = ?auto_2270122 ?auto_2270121 ) ) ( TRUCK-AT ?auto_2270120 ?auto_2270116 ) ( SURFACE-AT ?auto_2270112 ?auto_2270116 ) ( CLEAR ?auto_2270112 ) ( LIFTING ?auto_2270117 ?auto_2270113 ) ( IS-CRATE ?auto_2270113 ) ( not ( = ?auto_2270112 ?auto_2270113 ) ) ( not ( = ?auto_2270114 ?auto_2270112 ) ) ( not ( = ?auto_2270115 ?auto_2270112 ) ) ( not ( = ?auto_2270122 ?auto_2270112 ) ) ( not ( = ?auto_2270121 ?auto_2270112 ) ) ( ON ?auto_2270111 ?auto_2270110 ) ( ON ?auto_2270112 ?auto_2270111 ) ( not ( = ?auto_2270110 ?auto_2270111 ) ) ( not ( = ?auto_2270110 ?auto_2270112 ) ) ( not ( = ?auto_2270110 ?auto_2270113 ) ) ( not ( = ?auto_2270110 ?auto_2270114 ) ) ( not ( = ?auto_2270110 ?auto_2270115 ) ) ( not ( = ?auto_2270110 ?auto_2270122 ) ) ( not ( = ?auto_2270110 ?auto_2270121 ) ) ( not ( = ?auto_2270111 ?auto_2270112 ) ) ( not ( = ?auto_2270111 ?auto_2270113 ) ) ( not ( = ?auto_2270111 ?auto_2270114 ) ) ( not ( = ?auto_2270111 ?auto_2270115 ) ) ( not ( = ?auto_2270111 ?auto_2270122 ) ) ( not ( = ?auto_2270111 ?auto_2270121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270113 ?auto_2270114 ?auto_2270115 )
      ( MAKE-5CRATE-VERIFY ?auto_2270110 ?auto_2270111 ?auto_2270112 ?auto_2270113 ?auto_2270114 ?auto_2270115 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2270123 - SURFACE
      ?auto_2270124 - SURFACE
      ?auto_2270125 - SURFACE
      ?auto_2270126 - SURFACE
      ?auto_2270127 - SURFACE
      ?auto_2270128 - SURFACE
      ?auto_2270129 - SURFACE
    )
    :vars
    (
      ?auto_2270131 - HOIST
      ?auto_2270130 - PLACE
      ?auto_2270132 - PLACE
      ?auto_2270133 - HOIST
      ?auto_2270136 - SURFACE
      ?auto_2270135 - SURFACE
      ?auto_2270134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270131 ?auto_2270130 ) ( IS-CRATE ?auto_2270129 ) ( not ( = ?auto_2270128 ?auto_2270129 ) ) ( not ( = ?auto_2270127 ?auto_2270128 ) ) ( not ( = ?auto_2270127 ?auto_2270129 ) ) ( not ( = ?auto_2270132 ?auto_2270130 ) ) ( HOIST-AT ?auto_2270133 ?auto_2270132 ) ( not ( = ?auto_2270131 ?auto_2270133 ) ) ( SURFACE-AT ?auto_2270129 ?auto_2270132 ) ( ON ?auto_2270129 ?auto_2270136 ) ( CLEAR ?auto_2270129 ) ( not ( = ?auto_2270128 ?auto_2270136 ) ) ( not ( = ?auto_2270129 ?auto_2270136 ) ) ( not ( = ?auto_2270127 ?auto_2270136 ) ) ( IS-CRATE ?auto_2270128 ) ( AVAILABLE ?auto_2270133 ) ( SURFACE-AT ?auto_2270128 ?auto_2270132 ) ( ON ?auto_2270128 ?auto_2270135 ) ( CLEAR ?auto_2270128 ) ( not ( = ?auto_2270128 ?auto_2270135 ) ) ( not ( = ?auto_2270129 ?auto_2270135 ) ) ( not ( = ?auto_2270127 ?auto_2270135 ) ) ( not ( = ?auto_2270136 ?auto_2270135 ) ) ( TRUCK-AT ?auto_2270134 ?auto_2270130 ) ( SURFACE-AT ?auto_2270126 ?auto_2270130 ) ( CLEAR ?auto_2270126 ) ( LIFTING ?auto_2270131 ?auto_2270127 ) ( IS-CRATE ?auto_2270127 ) ( not ( = ?auto_2270126 ?auto_2270127 ) ) ( not ( = ?auto_2270128 ?auto_2270126 ) ) ( not ( = ?auto_2270129 ?auto_2270126 ) ) ( not ( = ?auto_2270136 ?auto_2270126 ) ) ( not ( = ?auto_2270135 ?auto_2270126 ) ) ( ON ?auto_2270124 ?auto_2270123 ) ( ON ?auto_2270125 ?auto_2270124 ) ( ON ?auto_2270126 ?auto_2270125 ) ( not ( = ?auto_2270123 ?auto_2270124 ) ) ( not ( = ?auto_2270123 ?auto_2270125 ) ) ( not ( = ?auto_2270123 ?auto_2270126 ) ) ( not ( = ?auto_2270123 ?auto_2270127 ) ) ( not ( = ?auto_2270123 ?auto_2270128 ) ) ( not ( = ?auto_2270123 ?auto_2270129 ) ) ( not ( = ?auto_2270123 ?auto_2270136 ) ) ( not ( = ?auto_2270123 ?auto_2270135 ) ) ( not ( = ?auto_2270124 ?auto_2270125 ) ) ( not ( = ?auto_2270124 ?auto_2270126 ) ) ( not ( = ?auto_2270124 ?auto_2270127 ) ) ( not ( = ?auto_2270124 ?auto_2270128 ) ) ( not ( = ?auto_2270124 ?auto_2270129 ) ) ( not ( = ?auto_2270124 ?auto_2270136 ) ) ( not ( = ?auto_2270124 ?auto_2270135 ) ) ( not ( = ?auto_2270125 ?auto_2270126 ) ) ( not ( = ?auto_2270125 ?auto_2270127 ) ) ( not ( = ?auto_2270125 ?auto_2270128 ) ) ( not ( = ?auto_2270125 ?auto_2270129 ) ) ( not ( = ?auto_2270125 ?auto_2270136 ) ) ( not ( = ?auto_2270125 ?auto_2270135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270127 ?auto_2270128 ?auto_2270129 )
      ( MAKE-6CRATE-VERIFY ?auto_2270123 ?auto_2270124 ?auto_2270125 ?auto_2270126 ?auto_2270127 ?auto_2270128 ?auto_2270129 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2270137 - SURFACE
      ?auto_2270138 - SURFACE
      ?auto_2270139 - SURFACE
      ?auto_2270140 - SURFACE
      ?auto_2270141 - SURFACE
      ?auto_2270142 - SURFACE
      ?auto_2270143 - SURFACE
      ?auto_2270144 - SURFACE
    )
    :vars
    (
      ?auto_2270146 - HOIST
      ?auto_2270145 - PLACE
      ?auto_2270147 - PLACE
      ?auto_2270148 - HOIST
      ?auto_2270151 - SURFACE
      ?auto_2270150 - SURFACE
      ?auto_2270149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270146 ?auto_2270145 ) ( IS-CRATE ?auto_2270144 ) ( not ( = ?auto_2270143 ?auto_2270144 ) ) ( not ( = ?auto_2270142 ?auto_2270143 ) ) ( not ( = ?auto_2270142 ?auto_2270144 ) ) ( not ( = ?auto_2270147 ?auto_2270145 ) ) ( HOIST-AT ?auto_2270148 ?auto_2270147 ) ( not ( = ?auto_2270146 ?auto_2270148 ) ) ( SURFACE-AT ?auto_2270144 ?auto_2270147 ) ( ON ?auto_2270144 ?auto_2270151 ) ( CLEAR ?auto_2270144 ) ( not ( = ?auto_2270143 ?auto_2270151 ) ) ( not ( = ?auto_2270144 ?auto_2270151 ) ) ( not ( = ?auto_2270142 ?auto_2270151 ) ) ( IS-CRATE ?auto_2270143 ) ( AVAILABLE ?auto_2270148 ) ( SURFACE-AT ?auto_2270143 ?auto_2270147 ) ( ON ?auto_2270143 ?auto_2270150 ) ( CLEAR ?auto_2270143 ) ( not ( = ?auto_2270143 ?auto_2270150 ) ) ( not ( = ?auto_2270144 ?auto_2270150 ) ) ( not ( = ?auto_2270142 ?auto_2270150 ) ) ( not ( = ?auto_2270151 ?auto_2270150 ) ) ( TRUCK-AT ?auto_2270149 ?auto_2270145 ) ( SURFACE-AT ?auto_2270141 ?auto_2270145 ) ( CLEAR ?auto_2270141 ) ( LIFTING ?auto_2270146 ?auto_2270142 ) ( IS-CRATE ?auto_2270142 ) ( not ( = ?auto_2270141 ?auto_2270142 ) ) ( not ( = ?auto_2270143 ?auto_2270141 ) ) ( not ( = ?auto_2270144 ?auto_2270141 ) ) ( not ( = ?auto_2270151 ?auto_2270141 ) ) ( not ( = ?auto_2270150 ?auto_2270141 ) ) ( ON ?auto_2270138 ?auto_2270137 ) ( ON ?auto_2270139 ?auto_2270138 ) ( ON ?auto_2270140 ?auto_2270139 ) ( ON ?auto_2270141 ?auto_2270140 ) ( not ( = ?auto_2270137 ?auto_2270138 ) ) ( not ( = ?auto_2270137 ?auto_2270139 ) ) ( not ( = ?auto_2270137 ?auto_2270140 ) ) ( not ( = ?auto_2270137 ?auto_2270141 ) ) ( not ( = ?auto_2270137 ?auto_2270142 ) ) ( not ( = ?auto_2270137 ?auto_2270143 ) ) ( not ( = ?auto_2270137 ?auto_2270144 ) ) ( not ( = ?auto_2270137 ?auto_2270151 ) ) ( not ( = ?auto_2270137 ?auto_2270150 ) ) ( not ( = ?auto_2270138 ?auto_2270139 ) ) ( not ( = ?auto_2270138 ?auto_2270140 ) ) ( not ( = ?auto_2270138 ?auto_2270141 ) ) ( not ( = ?auto_2270138 ?auto_2270142 ) ) ( not ( = ?auto_2270138 ?auto_2270143 ) ) ( not ( = ?auto_2270138 ?auto_2270144 ) ) ( not ( = ?auto_2270138 ?auto_2270151 ) ) ( not ( = ?auto_2270138 ?auto_2270150 ) ) ( not ( = ?auto_2270139 ?auto_2270140 ) ) ( not ( = ?auto_2270139 ?auto_2270141 ) ) ( not ( = ?auto_2270139 ?auto_2270142 ) ) ( not ( = ?auto_2270139 ?auto_2270143 ) ) ( not ( = ?auto_2270139 ?auto_2270144 ) ) ( not ( = ?auto_2270139 ?auto_2270151 ) ) ( not ( = ?auto_2270139 ?auto_2270150 ) ) ( not ( = ?auto_2270140 ?auto_2270141 ) ) ( not ( = ?auto_2270140 ?auto_2270142 ) ) ( not ( = ?auto_2270140 ?auto_2270143 ) ) ( not ( = ?auto_2270140 ?auto_2270144 ) ) ( not ( = ?auto_2270140 ?auto_2270151 ) ) ( not ( = ?auto_2270140 ?auto_2270150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270142 ?auto_2270143 ?auto_2270144 )
      ( MAKE-7CRATE-VERIFY ?auto_2270137 ?auto_2270138 ?auto_2270139 ?auto_2270140 ?auto_2270141 ?auto_2270142 ?auto_2270143 ?auto_2270144 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2270152 - SURFACE
      ?auto_2270153 - SURFACE
      ?auto_2270154 - SURFACE
      ?auto_2270155 - SURFACE
      ?auto_2270156 - SURFACE
      ?auto_2270157 - SURFACE
      ?auto_2270158 - SURFACE
      ?auto_2270159 - SURFACE
      ?auto_2270160 - SURFACE
    )
    :vars
    (
      ?auto_2270162 - HOIST
      ?auto_2270161 - PLACE
      ?auto_2270163 - PLACE
      ?auto_2270164 - HOIST
      ?auto_2270167 - SURFACE
      ?auto_2270166 - SURFACE
      ?auto_2270165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270162 ?auto_2270161 ) ( IS-CRATE ?auto_2270160 ) ( not ( = ?auto_2270159 ?auto_2270160 ) ) ( not ( = ?auto_2270158 ?auto_2270159 ) ) ( not ( = ?auto_2270158 ?auto_2270160 ) ) ( not ( = ?auto_2270163 ?auto_2270161 ) ) ( HOIST-AT ?auto_2270164 ?auto_2270163 ) ( not ( = ?auto_2270162 ?auto_2270164 ) ) ( SURFACE-AT ?auto_2270160 ?auto_2270163 ) ( ON ?auto_2270160 ?auto_2270167 ) ( CLEAR ?auto_2270160 ) ( not ( = ?auto_2270159 ?auto_2270167 ) ) ( not ( = ?auto_2270160 ?auto_2270167 ) ) ( not ( = ?auto_2270158 ?auto_2270167 ) ) ( IS-CRATE ?auto_2270159 ) ( AVAILABLE ?auto_2270164 ) ( SURFACE-AT ?auto_2270159 ?auto_2270163 ) ( ON ?auto_2270159 ?auto_2270166 ) ( CLEAR ?auto_2270159 ) ( not ( = ?auto_2270159 ?auto_2270166 ) ) ( not ( = ?auto_2270160 ?auto_2270166 ) ) ( not ( = ?auto_2270158 ?auto_2270166 ) ) ( not ( = ?auto_2270167 ?auto_2270166 ) ) ( TRUCK-AT ?auto_2270165 ?auto_2270161 ) ( SURFACE-AT ?auto_2270157 ?auto_2270161 ) ( CLEAR ?auto_2270157 ) ( LIFTING ?auto_2270162 ?auto_2270158 ) ( IS-CRATE ?auto_2270158 ) ( not ( = ?auto_2270157 ?auto_2270158 ) ) ( not ( = ?auto_2270159 ?auto_2270157 ) ) ( not ( = ?auto_2270160 ?auto_2270157 ) ) ( not ( = ?auto_2270167 ?auto_2270157 ) ) ( not ( = ?auto_2270166 ?auto_2270157 ) ) ( ON ?auto_2270153 ?auto_2270152 ) ( ON ?auto_2270154 ?auto_2270153 ) ( ON ?auto_2270155 ?auto_2270154 ) ( ON ?auto_2270156 ?auto_2270155 ) ( ON ?auto_2270157 ?auto_2270156 ) ( not ( = ?auto_2270152 ?auto_2270153 ) ) ( not ( = ?auto_2270152 ?auto_2270154 ) ) ( not ( = ?auto_2270152 ?auto_2270155 ) ) ( not ( = ?auto_2270152 ?auto_2270156 ) ) ( not ( = ?auto_2270152 ?auto_2270157 ) ) ( not ( = ?auto_2270152 ?auto_2270158 ) ) ( not ( = ?auto_2270152 ?auto_2270159 ) ) ( not ( = ?auto_2270152 ?auto_2270160 ) ) ( not ( = ?auto_2270152 ?auto_2270167 ) ) ( not ( = ?auto_2270152 ?auto_2270166 ) ) ( not ( = ?auto_2270153 ?auto_2270154 ) ) ( not ( = ?auto_2270153 ?auto_2270155 ) ) ( not ( = ?auto_2270153 ?auto_2270156 ) ) ( not ( = ?auto_2270153 ?auto_2270157 ) ) ( not ( = ?auto_2270153 ?auto_2270158 ) ) ( not ( = ?auto_2270153 ?auto_2270159 ) ) ( not ( = ?auto_2270153 ?auto_2270160 ) ) ( not ( = ?auto_2270153 ?auto_2270167 ) ) ( not ( = ?auto_2270153 ?auto_2270166 ) ) ( not ( = ?auto_2270154 ?auto_2270155 ) ) ( not ( = ?auto_2270154 ?auto_2270156 ) ) ( not ( = ?auto_2270154 ?auto_2270157 ) ) ( not ( = ?auto_2270154 ?auto_2270158 ) ) ( not ( = ?auto_2270154 ?auto_2270159 ) ) ( not ( = ?auto_2270154 ?auto_2270160 ) ) ( not ( = ?auto_2270154 ?auto_2270167 ) ) ( not ( = ?auto_2270154 ?auto_2270166 ) ) ( not ( = ?auto_2270155 ?auto_2270156 ) ) ( not ( = ?auto_2270155 ?auto_2270157 ) ) ( not ( = ?auto_2270155 ?auto_2270158 ) ) ( not ( = ?auto_2270155 ?auto_2270159 ) ) ( not ( = ?auto_2270155 ?auto_2270160 ) ) ( not ( = ?auto_2270155 ?auto_2270167 ) ) ( not ( = ?auto_2270155 ?auto_2270166 ) ) ( not ( = ?auto_2270156 ?auto_2270157 ) ) ( not ( = ?auto_2270156 ?auto_2270158 ) ) ( not ( = ?auto_2270156 ?auto_2270159 ) ) ( not ( = ?auto_2270156 ?auto_2270160 ) ) ( not ( = ?auto_2270156 ?auto_2270167 ) ) ( not ( = ?auto_2270156 ?auto_2270166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270158 ?auto_2270159 ?auto_2270160 )
      ( MAKE-8CRATE-VERIFY ?auto_2270152 ?auto_2270153 ?auto_2270154 ?auto_2270155 ?auto_2270156 ?auto_2270157 ?auto_2270158 ?auto_2270159 ?auto_2270160 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2273689 - SURFACE
      ?auto_2273690 - SURFACE
      ?auto_2273691 - SURFACE
      ?auto_2273692 - SURFACE
      ?auto_2273693 - SURFACE
      ?auto_2273694 - SURFACE
      ?auto_2273695 - SURFACE
      ?auto_2273696 - SURFACE
      ?auto_2273697 - SURFACE
      ?auto_2273698 - SURFACE
    )
    :vars
    (
      ?auto_2273699 - HOIST
      ?auto_2273700 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2273699 ?auto_2273700 ) ( SURFACE-AT ?auto_2273697 ?auto_2273700 ) ( CLEAR ?auto_2273697 ) ( LIFTING ?auto_2273699 ?auto_2273698 ) ( IS-CRATE ?auto_2273698 ) ( not ( = ?auto_2273697 ?auto_2273698 ) ) ( ON ?auto_2273690 ?auto_2273689 ) ( ON ?auto_2273691 ?auto_2273690 ) ( ON ?auto_2273692 ?auto_2273691 ) ( ON ?auto_2273693 ?auto_2273692 ) ( ON ?auto_2273694 ?auto_2273693 ) ( ON ?auto_2273695 ?auto_2273694 ) ( ON ?auto_2273696 ?auto_2273695 ) ( ON ?auto_2273697 ?auto_2273696 ) ( not ( = ?auto_2273689 ?auto_2273690 ) ) ( not ( = ?auto_2273689 ?auto_2273691 ) ) ( not ( = ?auto_2273689 ?auto_2273692 ) ) ( not ( = ?auto_2273689 ?auto_2273693 ) ) ( not ( = ?auto_2273689 ?auto_2273694 ) ) ( not ( = ?auto_2273689 ?auto_2273695 ) ) ( not ( = ?auto_2273689 ?auto_2273696 ) ) ( not ( = ?auto_2273689 ?auto_2273697 ) ) ( not ( = ?auto_2273689 ?auto_2273698 ) ) ( not ( = ?auto_2273690 ?auto_2273691 ) ) ( not ( = ?auto_2273690 ?auto_2273692 ) ) ( not ( = ?auto_2273690 ?auto_2273693 ) ) ( not ( = ?auto_2273690 ?auto_2273694 ) ) ( not ( = ?auto_2273690 ?auto_2273695 ) ) ( not ( = ?auto_2273690 ?auto_2273696 ) ) ( not ( = ?auto_2273690 ?auto_2273697 ) ) ( not ( = ?auto_2273690 ?auto_2273698 ) ) ( not ( = ?auto_2273691 ?auto_2273692 ) ) ( not ( = ?auto_2273691 ?auto_2273693 ) ) ( not ( = ?auto_2273691 ?auto_2273694 ) ) ( not ( = ?auto_2273691 ?auto_2273695 ) ) ( not ( = ?auto_2273691 ?auto_2273696 ) ) ( not ( = ?auto_2273691 ?auto_2273697 ) ) ( not ( = ?auto_2273691 ?auto_2273698 ) ) ( not ( = ?auto_2273692 ?auto_2273693 ) ) ( not ( = ?auto_2273692 ?auto_2273694 ) ) ( not ( = ?auto_2273692 ?auto_2273695 ) ) ( not ( = ?auto_2273692 ?auto_2273696 ) ) ( not ( = ?auto_2273692 ?auto_2273697 ) ) ( not ( = ?auto_2273692 ?auto_2273698 ) ) ( not ( = ?auto_2273693 ?auto_2273694 ) ) ( not ( = ?auto_2273693 ?auto_2273695 ) ) ( not ( = ?auto_2273693 ?auto_2273696 ) ) ( not ( = ?auto_2273693 ?auto_2273697 ) ) ( not ( = ?auto_2273693 ?auto_2273698 ) ) ( not ( = ?auto_2273694 ?auto_2273695 ) ) ( not ( = ?auto_2273694 ?auto_2273696 ) ) ( not ( = ?auto_2273694 ?auto_2273697 ) ) ( not ( = ?auto_2273694 ?auto_2273698 ) ) ( not ( = ?auto_2273695 ?auto_2273696 ) ) ( not ( = ?auto_2273695 ?auto_2273697 ) ) ( not ( = ?auto_2273695 ?auto_2273698 ) ) ( not ( = ?auto_2273696 ?auto_2273697 ) ) ( not ( = ?auto_2273696 ?auto_2273698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2273697 ?auto_2273698 )
      ( MAKE-9CRATE-VERIFY ?auto_2273689 ?auto_2273690 ?auto_2273691 ?auto_2273692 ?auto_2273693 ?auto_2273694 ?auto_2273695 ?auto_2273696 ?auto_2273697 ?auto_2273698 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2273769 - SURFACE
      ?auto_2273770 - SURFACE
      ?auto_2273771 - SURFACE
      ?auto_2273772 - SURFACE
      ?auto_2273773 - SURFACE
      ?auto_2273774 - SURFACE
      ?auto_2273775 - SURFACE
      ?auto_2273776 - SURFACE
      ?auto_2273777 - SURFACE
      ?auto_2273778 - SURFACE
    )
    :vars
    (
      ?auto_2273781 - HOIST
      ?auto_2273779 - PLACE
      ?auto_2273780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2273781 ?auto_2273779 ) ( SURFACE-AT ?auto_2273777 ?auto_2273779 ) ( CLEAR ?auto_2273777 ) ( IS-CRATE ?auto_2273778 ) ( not ( = ?auto_2273777 ?auto_2273778 ) ) ( TRUCK-AT ?auto_2273780 ?auto_2273779 ) ( AVAILABLE ?auto_2273781 ) ( IN ?auto_2273778 ?auto_2273780 ) ( ON ?auto_2273777 ?auto_2273776 ) ( not ( = ?auto_2273776 ?auto_2273777 ) ) ( not ( = ?auto_2273776 ?auto_2273778 ) ) ( ON ?auto_2273770 ?auto_2273769 ) ( ON ?auto_2273771 ?auto_2273770 ) ( ON ?auto_2273772 ?auto_2273771 ) ( ON ?auto_2273773 ?auto_2273772 ) ( ON ?auto_2273774 ?auto_2273773 ) ( ON ?auto_2273775 ?auto_2273774 ) ( ON ?auto_2273776 ?auto_2273775 ) ( not ( = ?auto_2273769 ?auto_2273770 ) ) ( not ( = ?auto_2273769 ?auto_2273771 ) ) ( not ( = ?auto_2273769 ?auto_2273772 ) ) ( not ( = ?auto_2273769 ?auto_2273773 ) ) ( not ( = ?auto_2273769 ?auto_2273774 ) ) ( not ( = ?auto_2273769 ?auto_2273775 ) ) ( not ( = ?auto_2273769 ?auto_2273776 ) ) ( not ( = ?auto_2273769 ?auto_2273777 ) ) ( not ( = ?auto_2273769 ?auto_2273778 ) ) ( not ( = ?auto_2273770 ?auto_2273771 ) ) ( not ( = ?auto_2273770 ?auto_2273772 ) ) ( not ( = ?auto_2273770 ?auto_2273773 ) ) ( not ( = ?auto_2273770 ?auto_2273774 ) ) ( not ( = ?auto_2273770 ?auto_2273775 ) ) ( not ( = ?auto_2273770 ?auto_2273776 ) ) ( not ( = ?auto_2273770 ?auto_2273777 ) ) ( not ( = ?auto_2273770 ?auto_2273778 ) ) ( not ( = ?auto_2273771 ?auto_2273772 ) ) ( not ( = ?auto_2273771 ?auto_2273773 ) ) ( not ( = ?auto_2273771 ?auto_2273774 ) ) ( not ( = ?auto_2273771 ?auto_2273775 ) ) ( not ( = ?auto_2273771 ?auto_2273776 ) ) ( not ( = ?auto_2273771 ?auto_2273777 ) ) ( not ( = ?auto_2273771 ?auto_2273778 ) ) ( not ( = ?auto_2273772 ?auto_2273773 ) ) ( not ( = ?auto_2273772 ?auto_2273774 ) ) ( not ( = ?auto_2273772 ?auto_2273775 ) ) ( not ( = ?auto_2273772 ?auto_2273776 ) ) ( not ( = ?auto_2273772 ?auto_2273777 ) ) ( not ( = ?auto_2273772 ?auto_2273778 ) ) ( not ( = ?auto_2273773 ?auto_2273774 ) ) ( not ( = ?auto_2273773 ?auto_2273775 ) ) ( not ( = ?auto_2273773 ?auto_2273776 ) ) ( not ( = ?auto_2273773 ?auto_2273777 ) ) ( not ( = ?auto_2273773 ?auto_2273778 ) ) ( not ( = ?auto_2273774 ?auto_2273775 ) ) ( not ( = ?auto_2273774 ?auto_2273776 ) ) ( not ( = ?auto_2273774 ?auto_2273777 ) ) ( not ( = ?auto_2273774 ?auto_2273778 ) ) ( not ( = ?auto_2273775 ?auto_2273776 ) ) ( not ( = ?auto_2273775 ?auto_2273777 ) ) ( not ( = ?auto_2273775 ?auto_2273778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2273776 ?auto_2273777 ?auto_2273778 )
      ( MAKE-9CRATE-VERIFY ?auto_2273769 ?auto_2273770 ?auto_2273771 ?auto_2273772 ?auto_2273773 ?auto_2273774 ?auto_2273775 ?auto_2273776 ?auto_2273777 ?auto_2273778 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2273859 - SURFACE
      ?auto_2273860 - SURFACE
      ?auto_2273861 - SURFACE
      ?auto_2273862 - SURFACE
      ?auto_2273863 - SURFACE
      ?auto_2273864 - SURFACE
      ?auto_2273865 - SURFACE
      ?auto_2273866 - SURFACE
      ?auto_2273867 - SURFACE
      ?auto_2273868 - SURFACE
    )
    :vars
    (
      ?auto_2273869 - HOIST
      ?auto_2273872 - PLACE
      ?auto_2273870 - TRUCK
      ?auto_2273871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2273869 ?auto_2273872 ) ( SURFACE-AT ?auto_2273867 ?auto_2273872 ) ( CLEAR ?auto_2273867 ) ( IS-CRATE ?auto_2273868 ) ( not ( = ?auto_2273867 ?auto_2273868 ) ) ( AVAILABLE ?auto_2273869 ) ( IN ?auto_2273868 ?auto_2273870 ) ( ON ?auto_2273867 ?auto_2273866 ) ( not ( = ?auto_2273866 ?auto_2273867 ) ) ( not ( = ?auto_2273866 ?auto_2273868 ) ) ( TRUCK-AT ?auto_2273870 ?auto_2273871 ) ( not ( = ?auto_2273871 ?auto_2273872 ) ) ( ON ?auto_2273860 ?auto_2273859 ) ( ON ?auto_2273861 ?auto_2273860 ) ( ON ?auto_2273862 ?auto_2273861 ) ( ON ?auto_2273863 ?auto_2273862 ) ( ON ?auto_2273864 ?auto_2273863 ) ( ON ?auto_2273865 ?auto_2273864 ) ( ON ?auto_2273866 ?auto_2273865 ) ( not ( = ?auto_2273859 ?auto_2273860 ) ) ( not ( = ?auto_2273859 ?auto_2273861 ) ) ( not ( = ?auto_2273859 ?auto_2273862 ) ) ( not ( = ?auto_2273859 ?auto_2273863 ) ) ( not ( = ?auto_2273859 ?auto_2273864 ) ) ( not ( = ?auto_2273859 ?auto_2273865 ) ) ( not ( = ?auto_2273859 ?auto_2273866 ) ) ( not ( = ?auto_2273859 ?auto_2273867 ) ) ( not ( = ?auto_2273859 ?auto_2273868 ) ) ( not ( = ?auto_2273860 ?auto_2273861 ) ) ( not ( = ?auto_2273860 ?auto_2273862 ) ) ( not ( = ?auto_2273860 ?auto_2273863 ) ) ( not ( = ?auto_2273860 ?auto_2273864 ) ) ( not ( = ?auto_2273860 ?auto_2273865 ) ) ( not ( = ?auto_2273860 ?auto_2273866 ) ) ( not ( = ?auto_2273860 ?auto_2273867 ) ) ( not ( = ?auto_2273860 ?auto_2273868 ) ) ( not ( = ?auto_2273861 ?auto_2273862 ) ) ( not ( = ?auto_2273861 ?auto_2273863 ) ) ( not ( = ?auto_2273861 ?auto_2273864 ) ) ( not ( = ?auto_2273861 ?auto_2273865 ) ) ( not ( = ?auto_2273861 ?auto_2273866 ) ) ( not ( = ?auto_2273861 ?auto_2273867 ) ) ( not ( = ?auto_2273861 ?auto_2273868 ) ) ( not ( = ?auto_2273862 ?auto_2273863 ) ) ( not ( = ?auto_2273862 ?auto_2273864 ) ) ( not ( = ?auto_2273862 ?auto_2273865 ) ) ( not ( = ?auto_2273862 ?auto_2273866 ) ) ( not ( = ?auto_2273862 ?auto_2273867 ) ) ( not ( = ?auto_2273862 ?auto_2273868 ) ) ( not ( = ?auto_2273863 ?auto_2273864 ) ) ( not ( = ?auto_2273863 ?auto_2273865 ) ) ( not ( = ?auto_2273863 ?auto_2273866 ) ) ( not ( = ?auto_2273863 ?auto_2273867 ) ) ( not ( = ?auto_2273863 ?auto_2273868 ) ) ( not ( = ?auto_2273864 ?auto_2273865 ) ) ( not ( = ?auto_2273864 ?auto_2273866 ) ) ( not ( = ?auto_2273864 ?auto_2273867 ) ) ( not ( = ?auto_2273864 ?auto_2273868 ) ) ( not ( = ?auto_2273865 ?auto_2273866 ) ) ( not ( = ?auto_2273865 ?auto_2273867 ) ) ( not ( = ?auto_2273865 ?auto_2273868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2273866 ?auto_2273867 ?auto_2273868 )
      ( MAKE-9CRATE-VERIFY ?auto_2273859 ?auto_2273860 ?auto_2273861 ?auto_2273862 ?auto_2273863 ?auto_2273864 ?auto_2273865 ?auto_2273866 ?auto_2273867 ?auto_2273868 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2273958 - SURFACE
      ?auto_2273959 - SURFACE
      ?auto_2273960 - SURFACE
      ?auto_2273961 - SURFACE
      ?auto_2273962 - SURFACE
      ?auto_2273963 - SURFACE
      ?auto_2273964 - SURFACE
      ?auto_2273965 - SURFACE
      ?auto_2273966 - SURFACE
      ?auto_2273967 - SURFACE
    )
    :vars
    (
      ?auto_2273971 - HOIST
      ?auto_2273972 - PLACE
      ?auto_2273969 - TRUCK
      ?auto_2273968 - PLACE
      ?auto_2273970 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2273971 ?auto_2273972 ) ( SURFACE-AT ?auto_2273966 ?auto_2273972 ) ( CLEAR ?auto_2273966 ) ( IS-CRATE ?auto_2273967 ) ( not ( = ?auto_2273966 ?auto_2273967 ) ) ( AVAILABLE ?auto_2273971 ) ( ON ?auto_2273966 ?auto_2273965 ) ( not ( = ?auto_2273965 ?auto_2273966 ) ) ( not ( = ?auto_2273965 ?auto_2273967 ) ) ( TRUCK-AT ?auto_2273969 ?auto_2273968 ) ( not ( = ?auto_2273968 ?auto_2273972 ) ) ( HOIST-AT ?auto_2273970 ?auto_2273968 ) ( LIFTING ?auto_2273970 ?auto_2273967 ) ( not ( = ?auto_2273971 ?auto_2273970 ) ) ( ON ?auto_2273959 ?auto_2273958 ) ( ON ?auto_2273960 ?auto_2273959 ) ( ON ?auto_2273961 ?auto_2273960 ) ( ON ?auto_2273962 ?auto_2273961 ) ( ON ?auto_2273963 ?auto_2273962 ) ( ON ?auto_2273964 ?auto_2273963 ) ( ON ?auto_2273965 ?auto_2273964 ) ( not ( = ?auto_2273958 ?auto_2273959 ) ) ( not ( = ?auto_2273958 ?auto_2273960 ) ) ( not ( = ?auto_2273958 ?auto_2273961 ) ) ( not ( = ?auto_2273958 ?auto_2273962 ) ) ( not ( = ?auto_2273958 ?auto_2273963 ) ) ( not ( = ?auto_2273958 ?auto_2273964 ) ) ( not ( = ?auto_2273958 ?auto_2273965 ) ) ( not ( = ?auto_2273958 ?auto_2273966 ) ) ( not ( = ?auto_2273958 ?auto_2273967 ) ) ( not ( = ?auto_2273959 ?auto_2273960 ) ) ( not ( = ?auto_2273959 ?auto_2273961 ) ) ( not ( = ?auto_2273959 ?auto_2273962 ) ) ( not ( = ?auto_2273959 ?auto_2273963 ) ) ( not ( = ?auto_2273959 ?auto_2273964 ) ) ( not ( = ?auto_2273959 ?auto_2273965 ) ) ( not ( = ?auto_2273959 ?auto_2273966 ) ) ( not ( = ?auto_2273959 ?auto_2273967 ) ) ( not ( = ?auto_2273960 ?auto_2273961 ) ) ( not ( = ?auto_2273960 ?auto_2273962 ) ) ( not ( = ?auto_2273960 ?auto_2273963 ) ) ( not ( = ?auto_2273960 ?auto_2273964 ) ) ( not ( = ?auto_2273960 ?auto_2273965 ) ) ( not ( = ?auto_2273960 ?auto_2273966 ) ) ( not ( = ?auto_2273960 ?auto_2273967 ) ) ( not ( = ?auto_2273961 ?auto_2273962 ) ) ( not ( = ?auto_2273961 ?auto_2273963 ) ) ( not ( = ?auto_2273961 ?auto_2273964 ) ) ( not ( = ?auto_2273961 ?auto_2273965 ) ) ( not ( = ?auto_2273961 ?auto_2273966 ) ) ( not ( = ?auto_2273961 ?auto_2273967 ) ) ( not ( = ?auto_2273962 ?auto_2273963 ) ) ( not ( = ?auto_2273962 ?auto_2273964 ) ) ( not ( = ?auto_2273962 ?auto_2273965 ) ) ( not ( = ?auto_2273962 ?auto_2273966 ) ) ( not ( = ?auto_2273962 ?auto_2273967 ) ) ( not ( = ?auto_2273963 ?auto_2273964 ) ) ( not ( = ?auto_2273963 ?auto_2273965 ) ) ( not ( = ?auto_2273963 ?auto_2273966 ) ) ( not ( = ?auto_2273963 ?auto_2273967 ) ) ( not ( = ?auto_2273964 ?auto_2273965 ) ) ( not ( = ?auto_2273964 ?auto_2273966 ) ) ( not ( = ?auto_2273964 ?auto_2273967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2273965 ?auto_2273966 ?auto_2273967 )
      ( MAKE-9CRATE-VERIFY ?auto_2273958 ?auto_2273959 ?auto_2273960 ?auto_2273961 ?auto_2273962 ?auto_2273963 ?auto_2273964 ?auto_2273965 ?auto_2273966 ?auto_2273967 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274066 - SURFACE
      ?auto_2274067 - SURFACE
      ?auto_2274068 - SURFACE
      ?auto_2274069 - SURFACE
      ?auto_2274070 - SURFACE
      ?auto_2274071 - SURFACE
      ?auto_2274072 - SURFACE
      ?auto_2274073 - SURFACE
      ?auto_2274074 - SURFACE
      ?auto_2274075 - SURFACE
    )
    :vars
    (
      ?auto_2274079 - HOIST
      ?auto_2274078 - PLACE
      ?auto_2274076 - TRUCK
      ?auto_2274077 - PLACE
      ?auto_2274080 - HOIST
      ?auto_2274081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274079 ?auto_2274078 ) ( SURFACE-AT ?auto_2274074 ?auto_2274078 ) ( CLEAR ?auto_2274074 ) ( IS-CRATE ?auto_2274075 ) ( not ( = ?auto_2274074 ?auto_2274075 ) ) ( AVAILABLE ?auto_2274079 ) ( ON ?auto_2274074 ?auto_2274073 ) ( not ( = ?auto_2274073 ?auto_2274074 ) ) ( not ( = ?auto_2274073 ?auto_2274075 ) ) ( TRUCK-AT ?auto_2274076 ?auto_2274077 ) ( not ( = ?auto_2274077 ?auto_2274078 ) ) ( HOIST-AT ?auto_2274080 ?auto_2274077 ) ( not ( = ?auto_2274079 ?auto_2274080 ) ) ( AVAILABLE ?auto_2274080 ) ( SURFACE-AT ?auto_2274075 ?auto_2274077 ) ( ON ?auto_2274075 ?auto_2274081 ) ( CLEAR ?auto_2274075 ) ( not ( = ?auto_2274074 ?auto_2274081 ) ) ( not ( = ?auto_2274075 ?auto_2274081 ) ) ( not ( = ?auto_2274073 ?auto_2274081 ) ) ( ON ?auto_2274067 ?auto_2274066 ) ( ON ?auto_2274068 ?auto_2274067 ) ( ON ?auto_2274069 ?auto_2274068 ) ( ON ?auto_2274070 ?auto_2274069 ) ( ON ?auto_2274071 ?auto_2274070 ) ( ON ?auto_2274072 ?auto_2274071 ) ( ON ?auto_2274073 ?auto_2274072 ) ( not ( = ?auto_2274066 ?auto_2274067 ) ) ( not ( = ?auto_2274066 ?auto_2274068 ) ) ( not ( = ?auto_2274066 ?auto_2274069 ) ) ( not ( = ?auto_2274066 ?auto_2274070 ) ) ( not ( = ?auto_2274066 ?auto_2274071 ) ) ( not ( = ?auto_2274066 ?auto_2274072 ) ) ( not ( = ?auto_2274066 ?auto_2274073 ) ) ( not ( = ?auto_2274066 ?auto_2274074 ) ) ( not ( = ?auto_2274066 ?auto_2274075 ) ) ( not ( = ?auto_2274066 ?auto_2274081 ) ) ( not ( = ?auto_2274067 ?auto_2274068 ) ) ( not ( = ?auto_2274067 ?auto_2274069 ) ) ( not ( = ?auto_2274067 ?auto_2274070 ) ) ( not ( = ?auto_2274067 ?auto_2274071 ) ) ( not ( = ?auto_2274067 ?auto_2274072 ) ) ( not ( = ?auto_2274067 ?auto_2274073 ) ) ( not ( = ?auto_2274067 ?auto_2274074 ) ) ( not ( = ?auto_2274067 ?auto_2274075 ) ) ( not ( = ?auto_2274067 ?auto_2274081 ) ) ( not ( = ?auto_2274068 ?auto_2274069 ) ) ( not ( = ?auto_2274068 ?auto_2274070 ) ) ( not ( = ?auto_2274068 ?auto_2274071 ) ) ( not ( = ?auto_2274068 ?auto_2274072 ) ) ( not ( = ?auto_2274068 ?auto_2274073 ) ) ( not ( = ?auto_2274068 ?auto_2274074 ) ) ( not ( = ?auto_2274068 ?auto_2274075 ) ) ( not ( = ?auto_2274068 ?auto_2274081 ) ) ( not ( = ?auto_2274069 ?auto_2274070 ) ) ( not ( = ?auto_2274069 ?auto_2274071 ) ) ( not ( = ?auto_2274069 ?auto_2274072 ) ) ( not ( = ?auto_2274069 ?auto_2274073 ) ) ( not ( = ?auto_2274069 ?auto_2274074 ) ) ( not ( = ?auto_2274069 ?auto_2274075 ) ) ( not ( = ?auto_2274069 ?auto_2274081 ) ) ( not ( = ?auto_2274070 ?auto_2274071 ) ) ( not ( = ?auto_2274070 ?auto_2274072 ) ) ( not ( = ?auto_2274070 ?auto_2274073 ) ) ( not ( = ?auto_2274070 ?auto_2274074 ) ) ( not ( = ?auto_2274070 ?auto_2274075 ) ) ( not ( = ?auto_2274070 ?auto_2274081 ) ) ( not ( = ?auto_2274071 ?auto_2274072 ) ) ( not ( = ?auto_2274071 ?auto_2274073 ) ) ( not ( = ?auto_2274071 ?auto_2274074 ) ) ( not ( = ?auto_2274071 ?auto_2274075 ) ) ( not ( = ?auto_2274071 ?auto_2274081 ) ) ( not ( = ?auto_2274072 ?auto_2274073 ) ) ( not ( = ?auto_2274072 ?auto_2274074 ) ) ( not ( = ?auto_2274072 ?auto_2274075 ) ) ( not ( = ?auto_2274072 ?auto_2274081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274073 ?auto_2274074 ?auto_2274075 )
      ( MAKE-9CRATE-VERIFY ?auto_2274066 ?auto_2274067 ?auto_2274068 ?auto_2274069 ?auto_2274070 ?auto_2274071 ?auto_2274072 ?auto_2274073 ?auto_2274074 ?auto_2274075 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274175 - SURFACE
      ?auto_2274176 - SURFACE
      ?auto_2274177 - SURFACE
      ?auto_2274178 - SURFACE
      ?auto_2274179 - SURFACE
      ?auto_2274180 - SURFACE
      ?auto_2274181 - SURFACE
      ?auto_2274182 - SURFACE
      ?auto_2274183 - SURFACE
      ?auto_2274184 - SURFACE
    )
    :vars
    (
      ?auto_2274185 - HOIST
      ?auto_2274187 - PLACE
      ?auto_2274186 - PLACE
      ?auto_2274188 - HOIST
      ?auto_2274190 - SURFACE
      ?auto_2274189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274185 ?auto_2274187 ) ( SURFACE-AT ?auto_2274183 ?auto_2274187 ) ( CLEAR ?auto_2274183 ) ( IS-CRATE ?auto_2274184 ) ( not ( = ?auto_2274183 ?auto_2274184 ) ) ( AVAILABLE ?auto_2274185 ) ( ON ?auto_2274183 ?auto_2274182 ) ( not ( = ?auto_2274182 ?auto_2274183 ) ) ( not ( = ?auto_2274182 ?auto_2274184 ) ) ( not ( = ?auto_2274186 ?auto_2274187 ) ) ( HOIST-AT ?auto_2274188 ?auto_2274186 ) ( not ( = ?auto_2274185 ?auto_2274188 ) ) ( AVAILABLE ?auto_2274188 ) ( SURFACE-AT ?auto_2274184 ?auto_2274186 ) ( ON ?auto_2274184 ?auto_2274190 ) ( CLEAR ?auto_2274184 ) ( not ( = ?auto_2274183 ?auto_2274190 ) ) ( not ( = ?auto_2274184 ?auto_2274190 ) ) ( not ( = ?auto_2274182 ?auto_2274190 ) ) ( TRUCK-AT ?auto_2274189 ?auto_2274187 ) ( ON ?auto_2274176 ?auto_2274175 ) ( ON ?auto_2274177 ?auto_2274176 ) ( ON ?auto_2274178 ?auto_2274177 ) ( ON ?auto_2274179 ?auto_2274178 ) ( ON ?auto_2274180 ?auto_2274179 ) ( ON ?auto_2274181 ?auto_2274180 ) ( ON ?auto_2274182 ?auto_2274181 ) ( not ( = ?auto_2274175 ?auto_2274176 ) ) ( not ( = ?auto_2274175 ?auto_2274177 ) ) ( not ( = ?auto_2274175 ?auto_2274178 ) ) ( not ( = ?auto_2274175 ?auto_2274179 ) ) ( not ( = ?auto_2274175 ?auto_2274180 ) ) ( not ( = ?auto_2274175 ?auto_2274181 ) ) ( not ( = ?auto_2274175 ?auto_2274182 ) ) ( not ( = ?auto_2274175 ?auto_2274183 ) ) ( not ( = ?auto_2274175 ?auto_2274184 ) ) ( not ( = ?auto_2274175 ?auto_2274190 ) ) ( not ( = ?auto_2274176 ?auto_2274177 ) ) ( not ( = ?auto_2274176 ?auto_2274178 ) ) ( not ( = ?auto_2274176 ?auto_2274179 ) ) ( not ( = ?auto_2274176 ?auto_2274180 ) ) ( not ( = ?auto_2274176 ?auto_2274181 ) ) ( not ( = ?auto_2274176 ?auto_2274182 ) ) ( not ( = ?auto_2274176 ?auto_2274183 ) ) ( not ( = ?auto_2274176 ?auto_2274184 ) ) ( not ( = ?auto_2274176 ?auto_2274190 ) ) ( not ( = ?auto_2274177 ?auto_2274178 ) ) ( not ( = ?auto_2274177 ?auto_2274179 ) ) ( not ( = ?auto_2274177 ?auto_2274180 ) ) ( not ( = ?auto_2274177 ?auto_2274181 ) ) ( not ( = ?auto_2274177 ?auto_2274182 ) ) ( not ( = ?auto_2274177 ?auto_2274183 ) ) ( not ( = ?auto_2274177 ?auto_2274184 ) ) ( not ( = ?auto_2274177 ?auto_2274190 ) ) ( not ( = ?auto_2274178 ?auto_2274179 ) ) ( not ( = ?auto_2274178 ?auto_2274180 ) ) ( not ( = ?auto_2274178 ?auto_2274181 ) ) ( not ( = ?auto_2274178 ?auto_2274182 ) ) ( not ( = ?auto_2274178 ?auto_2274183 ) ) ( not ( = ?auto_2274178 ?auto_2274184 ) ) ( not ( = ?auto_2274178 ?auto_2274190 ) ) ( not ( = ?auto_2274179 ?auto_2274180 ) ) ( not ( = ?auto_2274179 ?auto_2274181 ) ) ( not ( = ?auto_2274179 ?auto_2274182 ) ) ( not ( = ?auto_2274179 ?auto_2274183 ) ) ( not ( = ?auto_2274179 ?auto_2274184 ) ) ( not ( = ?auto_2274179 ?auto_2274190 ) ) ( not ( = ?auto_2274180 ?auto_2274181 ) ) ( not ( = ?auto_2274180 ?auto_2274182 ) ) ( not ( = ?auto_2274180 ?auto_2274183 ) ) ( not ( = ?auto_2274180 ?auto_2274184 ) ) ( not ( = ?auto_2274180 ?auto_2274190 ) ) ( not ( = ?auto_2274181 ?auto_2274182 ) ) ( not ( = ?auto_2274181 ?auto_2274183 ) ) ( not ( = ?auto_2274181 ?auto_2274184 ) ) ( not ( = ?auto_2274181 ?auto_2274190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274182 ?auto_2274183 ?auto_2274184 )
      ( MAKE-9CRATE-VERIFY ?auto_2274175 ?auto_2274176 ?auto_2274177 ?auto_2274178 ?auto_2274179 ?auto_2274180 ?auto_2274181 ?auto_2274182 ?auto_2274183 ?auto_2274184 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274284 - SURFACE
      ?auto_2274285 - SURFACE
      ?auto_2274286 - SURFACE
      ?auto_2274287 - SURFACE
      ?auto_2274288 - SURFACE
      ?auto_2274289 - SURFACE
      ?auto_2274290 - SURFACE
      ?auto_2274291 - SURFACE
      ?auto_2274292 - SURFACE
      ?auto_2274293 - SURFACE
    )
    :vars
    (
      ?auto_2274296 - HOIST
      ?auto_2274298 - PLACE
      ?auto_2274297 - PLACE
      ?auto_2274299 - HOIST
      ?auto_2274294 - SURFACE
      ?auto_2274295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274296 ?auto_2274298 ) ( IS-CRATE ?auto_2274293 ) ( not ( = ?auto_2274292 ?auto_2274293 ) ) ( not ( = ?auto_2274291 ?auto_2274292 ) ) ( not ( = ?auto_2274291 ?auto_2274293 ) ) ( not ( = ?auto_2274297 ?auto_2274298 ) ) ( HOIST-AT ?auto_2274299 ?auto_2274297 ) ( not ( = ?auto_2274296 ?auto_2274299 ) ) ( AVAILABLE ?auto_2274299 ) ( SURFACE-AT ?auto_2274293 ?auto_2274297 ) ( ON ?auto_2274293 ?auto_2274294 ) ( CLEAR ?auto_2274293 ) ( not ( = ?auto_2274292 ?auto_2274294 ) ) ( not ( = ?auto_2274293 ?auto_2274294 ) ) ( not ( = ?auto_2274291 ?auto_2274294 ) ) ( TRUCK-AT ?auto_2274295 ?auto_2274298 ) ( SURFACE-AT ?auto_2274291 ?auto_2274298 ) ( CLEAR ?auto_2274291 ) ( LIFTING ?auto_2274296 ?auto_2274292 ) ( IS-CRATE ?auto_2274292 ) ( ON ?auto_2274285 ?auto_2274284 ) ( ON ?auto_2274286 ?auto_2274285 ) ( ON ?auto_2274287 ?auto_2274286 ) ( ON ?auto_2274288 ?auto_2274287 ) ( ON ?auto_2274289 ?auto_2274288 ) ( ON ?auto_2274290 ?auto_2274289 ) ( ON ?auto_2274291 ?auto_2274290 ) ( not ( = ?auto_2274284 ?auto_2274285 ) ) ( not ( = ?auto_2274284 ?auto_2274286 ) ) ( not ( = ?auto_2274284 ?auto_2274287 ) ) ( not ( = ?auto_2274284 ?auto_2274288 ) ) ( not ( = ?auto_2274284 ?auto_2274289 ) ) ( not ( = ?auto_2274284 ?auto_2274290 ) ) ( not ( = ?auto_2274284 ?auto_2274291 ) ) ( not ( = ?auto_2274284 ?auto_2274292 ) ) ( not ( = ?auto_2274284 ?auto_2274293 ) ) ( not ( = ?auto_2274284 ?auto_2274294 ) ) ( not ( = ?auto_2274285 ?auto_2274286 ) ) ( not ( = ?auto_2274285 ?auto_2274287 ) ) ( not ( = ?auto_2274285 ?auto_2274288 ) ) ( not ( = ?auto_2274285 ?auto_2274289 ) ) ( not ( = ?auto_2274285 ?auto_2274290 ) ) ( not ( = ?auto_2274285 ?auto_2274291 ) ) ( not ( = ?auto_2274285 ?auto_2274292 ) ) ( not ( = ?auto_2274285 ?auto_2274293 ) ) ( not ( = ?auto_2274285 ?auto_2274294 ) ) ( not ( = ?auto_2274286 ?auto_2274287 ) ) ( not ( = ?auto_2274286 ?auto_2274288 ) ) ( not ( = ?auto_2274286 ?auto_2274289 ) ) ( not ( = ?auto_2274286 ?auto_2274290 ) ) ( not ( = ?auto_2274286 ?auto_2274291 ) ) ( not ( = ?auto_2274286 ?auto_2274292 ) ) ( not ( = ?auto_2274286 ?auto_2274293 ) ) ( not ( = ?auto_2274286 ?auto_2274294 ) ) ( not ( = ?auto_2274287 ?auto_2274288 ) ) ( not ( = ?auto_2274287 ?auto_2274289 ) ) ( not ( = ?auto_2274287 ?auto_2274290 ) ) ( not ( = ?auto_2274287 ?auto_2274291 ) ) ( not ( = ?auto_2274287 ?auto_2274292 ) ) ( not ( = ?auto_2274287 ?auto_2274293 ) ) ( not ( = ?auto_2274287 ?auto_2274294 ) ) ( not ( = ?auto_2274288 ?auto_2274289 ) ) ( not ( = ?auto_2274288 ?auto_2274290 ) ) ( not ( = ?auto_2274288 ?auto_2274291 ) ) ( not ( = ?auto_2274288 ?auto_2274292 ) ) ( not ( = ?auto_2274288 ?auto_2274293 ) ) ( not ( = ?auto_2274288 ?auto_2274294 ) ) ( not ( = ?auto_2274289 ?auto_2274290 ) ) ( not ( = ?auto_2274289 ?auto_2274291 ) ) ( not ( = ?auto_2274289 ?auto_2274292 ) ) ( not ( = ?auto_2274289 ?auto_2274293 ) ) ( not ( = ?auto_2274289 ?auto_2274294 ) ) ( not ( = ?auto_2274290 ?auto_2274291 ) ) ( not ( = ?auto_2274290 ?auto_2274292 ) ) ( not ( = ?auto_2274290 ?auto_2274293 ) ) ( not ( = ?auto_2274290 ?auto_2274294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274291 ?auto_2274292 ?auto_2274293 )
      ( MAKE-9CRATE-VERIFY ?auto_2274284 ?auto_2274285 ?auto_2274286 ?auto_2274287 ?auto_2274288 ?auto_2274289 ?auto_2274290 ?auto_2274291 ?auto_2274292 ?auto_2274293 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274393 - SURFACE
      ?auto_2274394 - SURFACE
      ?auto_2274395 - SURFACE
      ?auto_2274396 - SURFACE
      ?auto_2274397 - SURFACE
      ?auto_2274398 - SURFACE
      ?auto_2274399 - SURFACE
      ?auto_2274400 - SURFACE
      ?auto_2274401 - SURFACE
      ?auto_2274402 - SURFACE
    )
    :vars
    (
      ?auto_2274405 - HOIST
      ?auto_2274408 - PLACE
      ?auto_2274407 - PLACE
      ?auto_2274403 - HOIST
      ?auto_2274406 - SURFACE
      ?auto_2274404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274405 ?auto_2274408 ) ( IS-CRATE ?auto_2274402 ) ( not ( = ?auto_2274401 ?auto_2274402 ) ) ( not ( = ?auto_2274400 ?auto_2274401 ) ) ( not ( = ?auto_2274400 ?auto_2274402 ) ) ( not ( = ?auto_2274407 ?auto_2274408 ) ) ( HOIST-AT ?auto_2274403 ?auto_2274407 ) ( not ( = ?auto_2274405 ?auto_2274403 ) ) ( AVAILABLE ?auto_2274403 ) ( SURFACE-AT ?auto_2274402 ?auto_2274407 ) ( ON ?auto_2274402 ?auto_2274406 ) ( CLEAR ?auto_2274402 ) ( not ( = ?auto_2274401 ?auto_2274406 ) ) ( not ( = ?auto_2274402 ?auto_2274406 ) ) ( not ( = ?auto_2274400 ?auto_2274406 ) ) ( TRUCK-AT ?auto_2274404 ?auto_2274408 ) ( SURFACE-AT ?auto_2274400 ?auto_2274408 ) ( CLEAR ?auto_2274400 ) ( IS-CRATE ?auto_2274401 ) ( AVAILABLE ?auto_2274405 ) ( IN ?auto_2274401 ?auto_2274404 ) ( ON ?auto_2274394 ?auto_2274393 ) ( ON ?auto_2274395 ?auto_2274394 ) ( ON ?auto_2274396 ?auto_2274395 ) ( ON ?auto_2274397 ?auto_2274396 ) ( ON ?auto_2274398 ?auto_2274397 ) ( ON ?auto_2274399 ?auto_2274398 ) ( ON ?auto_2274400 ?auto_2274399 ) ( not ( = ?auto_2274393 ?auto_2274394 ) ) ( not ( = ?auto_2274393 ?auto_2274395 ) ) ( not ( = ?auto_2274393 ?auto_2274396 ) ) ( not ( = ?auto_2274393 ?auto_2274397 ) ) ( not ( = ?auto_2274393 ?auto_2274398 ) ) ( not ( = ?auto_2274393 ?auto_2274399 ) ) ( not ( = ?auto_2274393 ?auto_2274400 ) ) ( not ( = ?auto_2274393 ?auto_2274401 ) ) ( not ( = ?auto_2274393 ?auto_2274402 ) ) ( not ( = ?auto_2274393 ?auto_2274406 ) ) ( not ( = ?auto_2274394 ?auto_2274395 ) ) ( not ( = ?auto_2274394 ?auto_2274396 ) ) ( not ( = ?auto_2274394 ?auto_2274397 ) ) ( not ( = ?auto_2274394 ?auto_2274398 ) ) ( not ( = ?auto_2274394 ?auto_2274399 ) ) ( not ( = ?auto_2274394 ?auto_2274400 ) ) ( not ( = ?auto_2274394 ?auto_2274401 ) ) ( not ( = ?auto_2274394 ?auto_2274402 ) ) ( not ( = ?auto_2274394 ?auto_2274406 ) ) ( not ( = ?auto_2274395 ?auto_2274396 ) ) ( not ( = ?auto_2274395 ?auto_2274397 ) ) ( not ( = ?auto_2274395 ?auto_2274398 ) ) ( not ( = ?auto_2274395 ?auto_2274399 ) ) ( not ( = ?auto_2274395 ?auto_2274400 ) ) ( not ( = ?auto_2274395 ?auto_2274401 ) ) ( not ( = ?auto_2274395 ?auto_2274402 ) ) ( not ( = ?auto_2274395 ?auto_2274406 ) ) ( not ( = ?auto_2274396 ?auto_2274397 ) ) ( not ( = ?auto_2274396 ?auto_2274398 ) ) ( not ( = ?auto_2274396 ?auto_2274399 ) ) ( not ( = ?auto_2274396 ?auto_2274400 ) ) ( not ( = ?auto_2274396 ?auto_2274401 ) ) ( not ( = ?auto_2274396 ?auto_2274402 ) ) ( not ( = ?auto_2274396 ?auto_2274406 ) ) ( not ( = ?auto_2274397 ?auto_2274398 ) ) ( not ( = ?auto_2274397 ?auto_2274399 ) ) ( not ( = ?auto_2274397 ?auto_2274400 ) ) ( not ( = ?auto_2274397 ?auto_2274401 ) ) ( not ( = ?auto_2274397 ?auto_2274402 ) ) ( not ( = ?auto_2274397 ?auto_2274406 ) ) ( not ( = ?auto_2274398 ?auto_2274399 ) ) ( not ( = ?auto_2274398 ?auto_2274400 ) ) ( not ( = ?auto_2274398 ?auto_2274401 ) ) ( not ( = ?auto_2274398 ?auto_2274402 ) ) ( not ( = ?auto_2274398 ?auto_2274406 ) ) ( not ( = ?auto_2274399 ?auto_2274400 ) ) ( not ( = ?auto_2274399 ?auto_2274401 ) ) ( not ( = ?auto_2274399 ?auto_2274402 ) ) ( not ( = ?auto_2274399 ?auto_2274406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274400 ?auto_2274401 ?auto_2274402 )
      ( MAKE-9CRATE-VERIFY ?auto_2274393 ?auto_2274394 ?auto_2274395 ?auto_2274396 ?auto_2274397 ?auto_2274398 ?auto_2274399 ?auto_2274400 ?auto_2274401 ?auto_2274402 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2279924 - SURFACE
      ?auto_2279925 - SURFACE
      ?auto_2279926 - SURFACE
      ?auto_2279927 - SURFACE
      ?auto_2279928 - SURFACE
      ?auto_2279929 - SURFACE
      ?auto_2279930 - SURFACE
      ?auto_2279931 - SURFACE
      ?auto_2279932 - SURFACE
      ?auto_2279933 - SURFACE
      ?auto_2279934 - SURFACE
    )
    :vars
    (
      ?auto_2279935 - HOIST
      ?auto_2279936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2279935 ?auto_2279936 ) ( SURFACE-AT ?auto_2279933 ?auto_2279936 ) ( CLEAR ?auto_2279933 ) ( LIFTING ?auto_2279935 ?auto_2279934 ) ( IS-CRATE ?auto_2279934 ) ( not ( = ?auto_2279933 ?auto_2279934 ) ) ( ON ?auto_2279925 ?auto_2279924 ) ( ON ?auto_2279926 ?auto_2279925 ) ( ON ?auto_2279927 ?auto_2279926 ) ( ON ?auto_2279928 ?auto_2279927 ) ( ON ?auto_2279929 ?auto_2279928 ) ( ON ?auto_2279930 ?auto_2279929 ) ( ON ?auto_2279931 ?auto_2279930 ) ( ON ?auto_2279932 ?auto_2279931 ) ( ON ?auto_2279933 ?auto_2279932 ) ( not ( = ?auto_2279924 ?auto_2279925 ) ) ( not ( = ?auto_2279924 ?auto_2279926 ) ) ( not ( = ?auto_2279924 ?auto_2279927 ) ) ( not ( = ?auto_2279924 ?auto_2279928 ) ) ( not ( = ?auto_2279924 ?auto_2279929 ) ) ( not ( = ?auto_2279924 ?auto_2279930 ) ) ( not ( = ?auto_2279924 ?auto_2279931 ) ) ( not ( = ?auto_2279924 ?auto_2279932 ) ) ( not ( = ?auto_2279924 ?auto_2279933 ) ) ( not ( = ?auto_2279924 ?auto_2279934 ) ) ( not ( = ?auto_2279925 ?auto_2279926 ) ) ( not ( = ?auto_2279925 ?auto_2279927 ) ) ( not ( = ?auto_2279925 ?auto_2279928 ) ) ( not ( = ?auto_2279925 ?auto_2279929 ) ) ( not ( = ?auto_2279925 ?auto_2279930 ) ) ( not ( = ?auto_2279925 ?auto_2279931 ) ) ( not ( = ?auto_2279925 ?auto_2279932 ) ) ( not ( = ?auto_2279925 ?auto_2279933 ) ) ( not ( = ?auto_2279925 ?auto_2279934 ) ) ( not ( = ?auto_2279926 ?auto_2279927 ) ) ( not ( = ?auto_2279926 ?auto_2279928 ) ) ( not ( = ?auto_2279926 ?auto_2279929 ) ) ( not ( = ?auto_2279926 ?auto_2279930 ) ) ( not ( = ?auto_2279926 ?auto_2279931 ) ) ( not ( = ?auto_2279926 ?auto_2279932 ) ) ( not ( = ?auto_2279926 ?auto_2279933 ) ) ( not ( = ?auto_2279926 ?auto_2279934 ) ) ( not ( = ?auto_2279927 ?auto_2279928 ) ) ( not ( = ?auto_2279927 ?auto_2279929 ) ) ( not ( = ?auto_2279927 ?auto_2279930 ) ) ( not ( = ?auto_2279927 ?auto_2279931 ) ) ( not ( = ?auto_2279927 ?auto_2279932 ) ) ( not ( = ?auto_2279927 ?auto_2279933 ) ) ( not ( = ?auto_2279927 ?auto_2279934 ) ) ( not ( = ?auto_2279928 ?auto_2279929 ) ) ( not ( = ?auto_2279928 ?auto_2279930 ) ) ( not ( = ?auto_2279928 ?auto_2279931 ) ) ( not ( = ?auto_2279928 ?auto_2279932 ) ) ( not ( = ?auto_2279928 ?auto_2279933 ) ) ( not ( = ?auto_2279928 ?auto_2279934 ) ) ( not ( = ?auto_2279929 ?auto_2279930 ) ) ( not ( = ?auto_2279929 ?auto_2279931 ) ) ( not ( = ?auto_2279929 ?auto_2279932 ) ) ( not ( = ?auto_2279929 ?auto_2279933 ) ) ( not ( = ?auto_2279929 ?auto_2279934 ) ) ( not ( = ?auto_2279930 ?auto_2279931 ) ) ( not ( = ?auto_2279930 ?auto_2279932 ) ) ( not ( = ?auto_2279930 ?auto_2279933 ) ) ( not ( = ?auto_2279930 ?auto_2279934 ) ) ( not ( = ?auto_2279931 ?auto_2279932 ) ) ( not ( = ?auto_2279931 ?auto_2279933 ) ) ( not ( = ?auto_2279931 ?auto_2279934 ) ) ( not ( = ?auto_2279932 ?auto_2279933 ) ) ( not ( = ?auto_2279932 ?auto_2279934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2279933 ?auto_2279934 )
      ( MAKE-10CRATE-VERIFY ?auto_2279924 ?auto_2279925 ?auto_2279926 ?auto_2279927 ?auto_2279928 ?auto_2279929 ?auto_2279930 ?auto_2279931 ?auto_2279932 ?auto_2279933 ?auto_2279934 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280018 - SURFACE
      ?auto_2280019 - SURFACE
      ?auto_2280020 - SURFACE
      ?auto_2280021 - SURFACE
      ?auto_2280022 - SURFACE
      ?auto_2280023 - SURFACE
      ?auto_2280024 - SURFACE
      ?auto_2280025 - SURFACE
      ?auto_2280026 - SURFACE
      ?auto_2280027 - SURFACE
      ?auto_2280028 - SURFACE
    )
    :vars
    (
      ?auto_2280031 - HOIST
      ?auto_2280029 - PLACE
      ?auto_2280030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280031 ?auto_2280029 ) ( SURFACE-AT ?auto_2280027 ?auto_2280029 ) ( CLEAR ?auto_2280027 ) ( IS-CRATE ?auto_2280028 ) ( not ( = ?auto_2280027 ?auto_2280028 ) ) ( TRUCK-AT ?auto_2280030 ?auto_2280029 ) ( AVAILABLE ?auto_2280031 ) ( IN ?auto_2280028 ?auto_2280030 ) ( ON ?auto_2280027 ?auto_2280026 ) ( not ( = ?auto_2280026 ?auto_2280027 ) ) ( not ( = ?auto_2280026 ?auto_2280028 ) ) ( ON ?auto_2280019 ?auto_2280018 ) ( ON ?auto_2280020 ?auto_2280019 ) ( ON ?auto_2280021 ?auto_2280020 ) ( ON ?auto_2280022 ?auto_2280021 ) ( ON ?auto_2280023 ?auto_2280022 ) ( ON ?auto_2280024 ?auto_2280023 ) ( ON ?auto_2280025 ?auto_2280024 ) ( ON ?auto_2280026 ?auto_2280025 ) ( not ( = ?auto_2280018 ?auto_2280019 ) ) ( not ( = ?auto_2280018 ?auto_2280020 ) ) ( not ( = ?auto_2280018 ?auto_2280021 ) ) ( not ( = ?auto_2280018 ?auto_2280022 ) ) ( not ( = ?auto_2280018 ?auto_2280023 ) ) ( not ( = ?auto_2280018 ?auto_2280024 ) ) ( not ( = ?auto_2280018 ?auto_2280025 ) ) ( not ( = ?auto_2280018 ?auto_2280026 ) ) ( not ( = ?auto_2280018 ?auto_2280027 ) ) ( not ( = ?auto_2280018 ?auto_2280028 ) ) ( not ( = ?auto_2280019 ?auto_2280020 ) ) ( not ( = ?auto_2280019 ?auto_2280021 ) ) ( not ( = ?auto_2280019 ?auto_2280022 ) ) ( not ( = ?auto_2280019 ?auto_2280023 ) ) ( not ( = ?auto_2280019 ?auto_2280024 ) ) ( not ( = ?auto_2280019 ?auto_2280025 ) ) ( not ( = ?auto_2280019 ?auto_2280026 ) ) ( not ( = ?auto_2280019 ?auto_2280027 ) ) ( not ( = ?auto_2280019 ?auto_2280028 ) ) ( not ( = ?auto_2280020 ?auto_2280021 ) ) ( not ( = ?auto_2280020 ?auto_2280022 ) ) ( not ( = ?auto_2280020 ?auto_2280023 ) ) ( not ( = ?auto_2280020 ?auto_2280024 ) ) ( not ( = ?auto_2280020 ?auto_2280025 ) ) ( not ( = ?auto_2280020 ?auto_2280026 ) ) ( not ( = ?auto_2280020 ?auto_2280027 ) ) ( not ( = ?auto_2280020 ?auto_2280028 ) ) ( not ( = ?auto_2280021 ?auto_2280022 ) ) ( not ( = ?auto_2280021 ?auto_2280023 ) ) ( not ( = ?auto_2280021 ?auto_2280024 ) ) ( not ( = ?auto_2280021 ?auto_2280025 ) ) ( not ( = ?auto_2280021 ?auto_2280026 ) ) ( not ( = ?auto_2280021 ?auto_2280027 ) ) ( not ( = ?auto_2280021 ?auto_2280028 ) ) ( not ( = ?auto_2280022 ?auto_2280023 ) ) ( not ( = ?auto_2280022 ?auto_2280024 ) ) ( not ( = ?auto_2280022 ?auto_2280025 ) ) ( not ( = ?auto_2280022 ?auto_2280026 ) ) ( not ( = ?auto_2280022 ?auto_2280027 ) ) ( not ( = ?auto_2280022 ?auto_2280028 ) ) ( not ( = ?auto_2280023 ?auto_2280024 ) ) ( not ( = ?auto_2280023 ?auto_2280025 ) ) ( not ( = ?auto_2280023 ?auto_2280026 ) ) ( not ( = ?auto_2280023 ?auto_2280027 ) ) ( not ( = ?auto_2280023 ?auto_2280028 ) ) ( not ( = ?auto_2280024 ?auto_2280025 ) ) ( not ( = ?auto_2280024 ?auto_2280026 ) ) ( not ( = ?auto_2280024 ?auto_2280027 ) ) ( not ( = ?auto_2280024 ?auto_2280028 ) ) ( not ( = ?auto_2280025 ?auto_2280026 ) ) ( not ( = ?auto_2280025 ?auto_2280027 ) ) ( not ( = ?auto_2280025 ?auto_2280028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280026 ?auto_2280027 ?auto_2280028 )
      ( MAKE-10CRATE-VERIFY ?auto_2280018 ?auto_2280019 ?auto_2280020 ?auto_2280021 ?auto_2280022 ?auto_2280023 ?auto_2280024 ?auto_2280025 ?auto_2280026 ?auto_2280027 ?auto_2280028 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280123 - SURFACE
      ?auto_2280124 - SURFACE
      ?auto_2280125 - SURFACE
      ?auto_2280126 - SURFACE
      ?auto_2280127 - SURFACE
      ?auto_2280128 - SURFACE
      ?auto_2280129 - SURFACE
      ?auto_2280130 - SURFACE
      ?auto_2280131 - SURFACE
      ?auto_2280132 - SURFACE
      ?auto_2280133 - SURFACE
    )
    :vars
    (
      ?auto_2280137 - HOIST
      ?auto_2280134 - PLACE
      ?auto_2280135 - TRUCK
      ?auto_2280136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280137 ?auto_2280134 ) ( SURFACE-AT ?auto_2280132 ?auto_2280134 ) ( CLEAR ?auto_2280132 ) ( IS-CRATE ?auto_2280133 ) ( not ( = ?auto_2280132 ?auto_2280133 ) ) ( AVAILABLE ?auto_2280137 ) ( IN ?auto_2280133 ?auto_2280135 ) ( ON ?auto_2280132 ?auto_2280131 ) ( not ( = ?auto_2280131 ?auto_2280132 ) ) ( not ( = ?auto_2280131 ?auto_2280133 ) ) ( TRUCK-AT ?auto_2280135 ?auto_2280136 ) ( not ( = ?auto_2280136 ?auto_2280134 ) ) ( ON ?auto_2280124 ?auto_2280123 ) ( ON ?auto_2280125 ?auto_2280124 ) ( ON ?auto_2280126 ?auto_2280125 ) ( ON ?auto_2280127 ?auto_2280126 ) ( ON ?auto_2280128 ?auto_2280127 ) ( ON ?auto_2280129 ?auto_2280128 ) ( ON ?auto_2280130 ?auto_2280129 ) ( ON ?auto_2280131 ?auto_2280130 ) ( not ( = ?auto_2280123 ?auto_2280124 ) ) ( not ( = ?auto_2280123 ?auto_2280125 ) ) ( not ( = ?auto_2280123 ?auto_2280126 ) ) ( not ( = ?auto_2280123 ?auto_2280127 ) ) ( not ( = ?auto_2280123 ?auto_2280128 ) ) ( not ( = ?auto_2280123 ?auto_2280129 ) ) ( not ( = ?auto_2280123 ?auto_2280130 ) ) ( not ( = ?auto_2280123 ?auto_2280131 ) ) ( not ( = ?auto_2280123 ?auto_2280132 ) ) ( not ( = ?auto_2280123 ?auto_2280133 ) ) ( not ( = ?auto_2280124 ?auto_2280125 ) ) ( not ( = ?auto_2280124 ?auto_2280126 ) ) ( not ( = ?auto_2280124 ?auto_2280127 ) ) ( not ( = ?auto_2280124 ?auto_2280128 ) ) ( not ( = ?auto_2280124 ?auto_2280129 ) ) ( not ( = ?auto_2280124 ?auto_2280130 ) ) ( not ( = ?auto_2280124 ?auto_2280131 ) ) ( not ( = ?auto_2280124 ?auto_2280132 ) ) ( not ( = ?auto_2280124 ?auto_2280133 ) ) ( not ( = ?auto_2280125 ?auto_2280126 ) ) ( not ( = ?auto_2280125 ?auto_2280127 ) ) ( not ( = ?auto_2280125 ?auto_2280128 ) ) ( not ( = ?auto_2280125 ?auto_2280129 ) ) ( not ( = ?auto_2280125 ?auto_2280130 ) ) ( not ( = ?auto_2280125 ?auto_2280131 ) ) ( not ( = ?auto_2280125 ?auto_2280132 ) ) ( not ( = ?auto_2280125 ?auto_2280133 ) ) ( not ( = ?auto_2280126 ?auto_2280127 ) ) ( not ( = ?auto_2280126 ?auto_2280128 ) ) ( not ( = ?auto_2280126 ?auto_2280129 ) ) ( not ( = ?auto_2280126 ?auto_2280130 ) ) ( not ( = ?auto_2280126 ?auto_2280131 ) ) ( not ( = ?auto_2280126 ?auto_2280132 ) ) ( not ( = ?auto_2280126 ?auto_2280133 ) ) ( not ( = ?auto_2280127 ?auto_2280128 ) ) ( not ( = ?auto_2280127 ?auto_2280129 ) ) ( not ( = ?auto_2280127 ?auto_2280130 ) ) ( not ( = ?auto_2280127 ?auto_2280131 ) ) ( not ( = ?auto_2280127 ?auto_2280132 ) ) ( not ( = ?auto_2280127 ?auto_2280133 ) ) ( not ( = ?auto_2280128 ?auto_2280129 ) ) ( not ( = ?auto_2280128 ?auto_2280130 ) ) ( not ( = ?auto_2280128 ?auto_2280131 ) ) ( not ( = ?auto_2280128 ?auto_2280132 ) ) ( not ( = ?auto_2280128 ?auto_2280133 ) ) ( not ( = ?auto_2280129 ?auto_2280130 ) ) ( not ( = ?auto_2280129 ?auto_2280131 ) ) ( not ( = ?auto_2280129 ?auto_2280132 ) ) ( not ( = ?auto_2280129 ?auto_2280133 ) ) ( not ( = ?auto_2280130 ?auto_2280131 ) ) ( not ( = ?auto_2280130 ?auto_2280132 ) ) ( not ( = ?auto_2280130 ?auto_2280133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280131 ?auto_2280132 ?auto_2280133 )
      ( MAKE-10CRATE-VERIFY ?auto_2280123 ?auto_2280124 ?auto_2280125 ?auto_2280126 ?auto_2280127 ?auto_2280128 ?auto_2280129 ?auto_2280130 ?auto_2280131 ?auto_2280132 ?auto_2280133 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280238 - SURFACE
      ?auto_2280239 - SURFACE
      ?auto_2280240 - SURFACE
      ?auto_2280241 - SURFACE
      ?auto_2280242 - SURFACE
      ?auto_2280243 - SURFACE
      ?auto_2280244 - SURFACE
      ?auto_2280245 - SURFACE
      ?auto_2280246 - SURFACE
      ?auto_2280247 - SURFACE
      ?auto_2280248 - SURFACE
    )
    :vars
    (
      ?auto_2280252 - HOIST
      ?auto_2280250 - PLACE
      ?auto_2280253 - TRUCK
      ?auto_2280251 - PLACE
      ?auto_2280249 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280252 ?auto_2280250 ) ( SURFACE-AT ?auto_2280247 ?auto_2280250 ) ( CLEAR ?auto_2280247 ) ( IS-CRATE ?auto_2280248 ) ( not ( = ?auto_2280247 ?auto_2280248 ) ) ( AVAILABLE ?auto_2280252 ) ( ON ?auto_2280247 ?auto_2280246 ) ( not ( = ?auto_2280246 ?auto_2280247 ) ) ( not ( = ?auto_2280246 ?auto_2280248 ) ) ( TRUCK-AT ?auto_2280253 ?auto_2280251 ) ( not ( = ?auto_2280251 ?auto_2280250 ) ) ( HOIST-AT ?auto_2280249 ?auto_2280251 ) ( LIFTING ?auto_2280249 ?auto_2280248 ) ( not ( = ?auto_2280252 ?auto_2280249 ) ) ( ON ?auto_2280239 ?auto_2280238 ) ( ON ?auto_2280240 ?auto_2280239 ) ( ON ?auto_2280241 ?auto_2280240 ) ( ON ?auto_2280242 ?auto_2280241 ) ( ON ?auto_2280243 ?auto_2280242 ) ( ON ?auto_2280244 ?auto_2280243 ) ( ON ?auto_2280245 ?auto_2280244 ) ( ON ?auto_2280246 ?auto_2280245 ) ( not ( = ?auto_2280238 ?auto_2280239 ) ) ( not ( = ?auto_2280238 ?auto_2280240 ) ) ( not ( = ?auto_2280238 ?auto_2280241 ) ) ( not ( = ?auto_2280238 ?auto_2280242 ) ) ( not ( = ?auto_2280238 ?auto_2280243 ) ) ( not ( = ?auto_2280238 ?auto_2280244 ) ) ( not ( = ?auto_2280238 ?auto_2280245 ) ) ( not ( = ?auto_2280238 ?auto_2280246 ) ) ( not ( = ?auto_2280238 ?auto_2280247 ) ) ( not ( = ?auto_2280238 ?auto_2280248 ) ) ( not ( = ?auto_2280239 ?auto_2280240 ) ) ( not ( = ?auto_2280239 ?auto_2280241 ) ) ( not ( = ?auto_2280239 ?auto_2280242 ) ) ( not ( = ?auto_2280239 ?auto_2280243 ) ) ( not ( = ?auto_2280239 ?auto_2280244 ) ) ( not ( = ?auto_2280239 ?auto_2280245 ) ) ( not ( = ?auto_2280239 ?auto_2280246 ) ) ( not ( = ?auto_2280239 ?auto_2280247 ) ) ( not ( = ?auto_2280239 ?auto_2280248 ) ) ( not ( = ?auto_2280240 ?auto_2280241 ) ) ( not ( = ?auto_2280240 ?auto_2280242 ) ) ( not ( = ?auto_2280240 ?auto_2280243 ) ) ( not ( = ?auto_2280240 ?auto_2280244 ) ) ( not ( = ?auto_2280240 ?auto_2280245 ) ) ( not ( = ?auto_2280240 ?auto_2280246 ) ) ( not ( = ?auto_2280240 ?auto_2280247 ) ) ( not ( = ?auto_2280240 ?auto_2280248 ) ) ( not ( = ?auto_2280241 ?auto_2280242 ) ) ( not ( = ?auto_2280241 ?auto_2280243 ) ) ( not ( = ?auto_2280241 ?auto_2280244 ) ) ( not ( = ?auto_2280241 ?auto_2280245 ) ) ( not ( = ?auto_2280241 ?auto_2280246 ) ) ( not ( = ?auto_2280241 ?auto_2280247 ) ) ( not ( = ?auto_2280241 ?auto_2280248 ) ) ( not ( = ?auto_2280242 ?auto_2280243 ) ) ( not ( = ?auto_2280242 ?auto_2280244 ) ) ( not ( = ?auto_2280242 ?auto_2280245 ) ) ( not ( = ?auto_2280242 ?auto_2280246 ) ) ( not ( = ?auto_2280242 ?auto_2280247 ) ) ( not ( = ?auto_2280242 ?auto_2280248 ) ) ( not ( = ?auto_2280243 ?auto_2280244 ) ) ( not ( = ?auto_2280243 ?auto_2280245 ) ) ( not ( = ?auto_2280243 ?auto_2280246 ) ) ( not ( = ?auto_2280243 ?auto_2280247 ) ) ( not ( = ?auto_2280243 ?auto_2280248 ) ) ( not ( = ?auto_2280244 ?auto_2280245 ) ) ( not ( = ?auto_2280244 ?auto_2280246 ) ) ( not ( = ?auto_2280244 ?auto_2280247 ) ) ( not ( = ?auto_2280244 ?auto_2280248 ) ) ( not ( = ?auto_2280245 ?auto_2280246 ) ) ( not ( = ?auto_2280245 ?auto_2280247 ) ) ( not ( = ?auto_2280245 ?auto_2280248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280246 ?auto_2280247 ?auto_2280248 )
      ( MAKE-10CRATE-VERIFY ?auto_2280238 ?auto_2280239 ?auto_2280240 ?auto_2280241 ?auto_2280242 ?auto_2280243 ?auto_2280244 ?auto_2280245 ?auto_2280246 ?auto_2280247 ?auto_2280248 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280363 - SURFACE
      ?auto_2280364 - SURFACE
      ?auto_2280365 - SURFACE
      ?auto_2280366 - SURFACE
      ?auto_2280367 - SURFACE
      ?auto_2280368 - SURFACE
      ?auto_2280369 - SURFACE
      ?auto_2280370 - SURFACE
      ?auto_2280371 - SURFACE
      ?auto_2280372 - SURFACE
      ?auto_2280373 - SURFACE
    )
    :vars
    (
      ?auto_2280377 - HOIST
      ?auto_2280376 - PLACE
      ?auto_2280379 - TRUCK
      ?auto_2280375 - PLACE
      ?auto_2280378 - HOIST
      ?auto_2280374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280377 ?auto_2280376 ) ( SURFACE-AT ?auto_2280372 ?auto_2280376 ) ( CLEAR ?auto_2280372 ) ( IS-CRATE ?auto_2280373 ) ( not ( = ?auto_2280372 ?auto_2280373 ) ) ( AVAILABLE ?auto_2280377 ) ( ON ?auto_2280372 ?auto_2280371 ) ( not ( = ?auto_2280371 ?auto_2280372 ) ) ( not ( = ?auto_2280371 ?auto_2280373 ) ) ( TRUCK-AT ?auto_2280379 ?auto_2280375 ) ( not ( = ?auto_2280375 ?auto_2280376 ) ) ( HOIST-AT ?auto_2280378 ?auto_2280375 ) ( not ( = ?auto_2280377 ?auto_2280378 ) ) ( AVAILABLE ?auto_2280378 ) ( SURFACE-AT ?auto_2280373 ?auto_2280375 ) ( ON ?auto_2280373 ?auto_2280374 ) ( CLEAR ?auto_2280373 ) ( not ( = ?auto_2280372 ?auto_2280374 ) ) ( not ( = ?auto_2280373 ?auto_2280374 ) ) ( not ( = ?auto_2280371 ?auto_2280374 ) ) ( ON ?auto_2280364 ?auto_2280363 ) ( ON ?auto_2280365 ?auto_2280364 ) ( ON ?auto_2280366 ?auto_2280365 ) ( ON ?auto_2280367 ?auto_2280366 ) ( ON ?auto_2280368 ?auto_2280367 ) ( ON ?auto_2280369 ?auto_2280368 ) ( ON ?auto_2280370 ?auto_2280369 ) ( ON ?auto_2280371 ?auto_2280370 ) ( not ( = ?auto_2280363 ?auto_2280364 ) ) ( not ( = ?auto_2280363 ?auto_2280365 ) ) ( not ( = ?auto_2280363 ?auto_2280366 ) ) ( not ( = ?auto_2280363 ?auto_2280367 ) ) ( not ( = ?auto_2280363 ?auto_2280368 ) ) ( not ( = ?auto_2280363 ?auto_2280369 ) ) ( not ( = ?auto_2280363 ?auto_2280370 ) ) ( not ( = ?auto_2280363 ?auto_2280371 ) ) ( not ( = ?auto_2280363 ?auto_2280372 ) ) ( not ( = ?auto_2280363 ?auto_2280373 ) ) ( not ( = ?auto_2280363 ?auto_2280374 ) ) ( not ( = ?auto_2280364 ?auto_2280365 ) ) ( not ( = ?auto_2280364 ?auto_2280366 ) ) ( not ( = ?auto_2280364 ?auto_2280367 ) ) ( not ( = ?auto_2280364 ?auto_2280368 ) ) ( not ( = ?auto_2280364 ?auto_2280369 ) ) ( not ( = ?auto_2280364 ?auto_2280370 ) ) ( not ( = ?auto_2280364 ?auto_2280371 ) ) ( not ( = ?auto_2280364 ?auto_2280372 ) ) ( not ( = ?auto_2280364 ?auto_2280373 ) ) ( not ( = ?auto_2280364 ?auto_2280374 ) ) ( not ( = ?auto_2280365 ?auto_2280366 ) ) ( not ( = ?auto_2280365 ?auto_2280367 ) ) ( not ( = ?auto_2280365 ?auto_2280368 ) ) ( not ( = ?auto_2280365 ?auto_2280369 ) ) ( not ( = ?auto_2280365 ?auto_2280370 ) ) ( not ( = ?auto_2280365 ?auto_2280371 ) ) ( not ( = ?auto_2280365 ?auto_2280372 ) ) ( not ( = ?auto_2280365 ?auto_2280373 ) ) ( not ( = ?auto_2280365 ?auto_2280374 ) ) ( not ( = ?auto_2280366 ?auto_2280367 ) ) ( not ( = ?auto_2280366 ?auto_2280368 ) ) ( not ( = ?auto_2280366 ?auto_2280369 ) ) ( not ( = ?auto_2280366 ?auto_2280370 ) ) ( not ( = ?auto_2280366 ?auto_2280371 ) ) ( not ( = ?auto_2280366 ?auto_2280372 ) ) ( not ( = ?auto_2280366 ?auto_2280373 ) ) ( not ( = ?auto_2280366 ?auto_2280374 ) ) ( not ( = ?auto_2280367 ?auto_2280368 ) ) ( not ( = ?auto_2280367 ?auto_2280369 ) ) ( not ( = ?auto_2280367 ?auto_2280370 ) ) ( not ( = ?auto_2280367 ?auto_2280371 ) ) ( not ( = ?auto_2280367 ?auto_2280372 ) ) ( not ( = ?auto_2280367 ?auto_2280373 ) ) ( not ( = ?auto_2280367 ?auto_2280374 ) ) ( not ( = ?auto_2280368 ?auto_2280369 ) ) ( not ( = ?auto_2280368 ?auto_2280370 ) ) ( not ( = ?auto_2280368 ?auto_2280371 ) ) ( not ( = ?auto_2280368 ?auto_2280372 ) ) ( not ( = ?auto_2280368 ?auto_2280373 ) ) ( not ( = ?auto_2280368 ?auto_2280374 ) ) ( not ( = ?auto_2280369 ?auto_2280370 ) ) ( not ( = ?auto_2280369 ?auto_2280371 ) ) ( not ( = ?auto_2280369 ?auto_2280372 ) ) ( not ( = ?auto_2280369 ?auto_2280373 ) ) ( not ( = ?auto_2280369 ?auto_2280374 ) ) ( not ( = ?auto_2280370 ?auto_2280371 ) ) ( not ( = ?auto_2280370 ?auto_2280372 ) ) ( not ( = ?auto_2280370 ?auto_2280373 ) ) ( not ( = ?auto_2280370 ?auto_2280374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280371 ?auto_2280372 ?auto_2280373 )
      ( MAKE-10CRATE-VERIFY ?auto_2280363 ?auto_2280364 ?auto_2280365 ?auto_2280366 ?auto_2280367 ?auto_2280368 ?auto_2280369 ?auto_2280370 ?auto_2280371 ?auto_2280372 ?auto_2280373 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280489 - SURFACE
      ?auto_2280490 - SURFACE
      ?auto_2280491 - SURFACE
      ?auto_2280492 - SURFACE
      ?auto_2280493 - SURFACE
      ?auto_2280494 - SURFACE
      ?auto_2280495 - SURFACE
      ?auto_2280496 - SURFACE
      ?auto_2280497 - SURFACE
      ?auto_2280498 - SURFACE
      ?auto_2280499 - SURFACE
    )
    :vars
    (
      ?auto_2280503 - HOIST
      ?auto_2280505 - PLACE
      ?auto_2280500 - PLACE
      ?auto_2280502 - HOIST
      ?auto_2280504 - SURFACE
      ?auto_2280501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280503 ?auto_2280505 ) ( SURFACE-AT ?auto_2280498 ?auto_2280505 ) ( CLEAR ?auto_2280498 ) ( IS-CRATE ?auto_2280499 ) ( not ( = ?auto_2280498 ?auto_2280499 ) ) ( AVAILABLE ?auto_2280503 ) ( ON ?auto_2280498 ?auto_2280497 ) ( not ( = ?auto_2280497 ?auto_2280498 ) ) ( not ( = ?auto_2280497 ?auto_2280499 ) ) ( not ( = ?auto_2280500 ?auto_2280505 ) ) ( HOIST-AT ?auto_2280502 ?auto_2280500 ) ( not ( = ?auto_2280503 ?auto_2280502 ) ) ( AVAILABLE ?auto_2280502 ) ( SURFACE-AT ?auto_2280499 ?auto_2280500 ) ( ON ?auto_2280499 ?auto_2280504 ) ( CLEAR ?auto_2280499 ) ( not ( = ?auto_2280498 ?auto_2280504 ) ) ( not ( = ?auto_2280499 ?auto_2280504 ) ) ( not ( = ?auto_2280497 ?auto_2280504 ) ) ( TRUCK-AT ?auto_2280501 ?auto_2280505 ) ( ON ?auto_2280490 ?auto_2280489 ) ( ON ?auto_2280491 ?auto_2280490 ) ( ON ?auto_2280492 ?auto_2280491 ) ( ON ?auto_2280493 ?auto_2280492 ) ( ON ?auto_2280494 ?auto_2280493 ) ( ON ?auto_2280495 ?auto_2280494 ) ( ON ?auto_2280496 ?auto_2280495 ) ( ON ?auto_2280497 ?auto_2280496 ) ( not ( = ?auto_2280489 ?auto_2280490 ) ) ( not ( = ?auto_2280489 ?auto_2280491 ) ) ( not ( = ?auto_2280489 ?auto_2280492 ) ) ( not ( = ?auto_2280489 ?auto_2280493 ) ) ( not ( = ?auto_2280489 ?auto_2280494 ) ) ( not ( = ?auto_2280489 ?auto_2280495 ) ) ( not ( = ?auto_2280489 ?auto_2280496 ) ) ( not ( = ?auto_2280489 ?auto_2280497 ) ) ( not ( = ?auto_2280489 ?auto_2280498 ) ) ( not ( = ?auto_2280489 ?auto_2280499 ) ) ( not ( = ?auto_2280489 ?auto_2280504 ) ) ( not ( = ?auto_2280490 ?auto_2280491 ) ) ( not ( = ?auto_2280490 ?auto_2280492 ) ) ( not ( = ?auto_2280490 ?auto_2280493 ) ) ( not ( = ?auto_2280490 ?auto_2280494 ) ) ( not ( = ?auto_2280490 ?auto_2280495 ) ) ( not ( = ?auto_2280490 ?auto_2280496 ) ) ( not ( = ?auto_2280490 ?auto_2280497 ) ) ( not ( = ?auto_2280490 ?auto_2280498 ) ) ( not ( = ?auto_2280490 ?auto_2280499 ) ) ( not ( = ?auto_2280490 ?auto_2280504 ) ) ( not ( = ?auto_2280491 ?auto_2280492 ) ) ( not ( = ?auto_2280491 ?auto_2280493 ) ) ( not ( = ?auto_2280491 ?auto_2280494 ) ) ( not ( = ?auto_2280491 ?auto_2280495 ) ) ( not ( = ?auto_2280491 ?auto_2280496 ) ) ( not ( = ?auto_2280491 ?auto_2280497 ) ) ( not ( = ?auto_2280491 ?auto_2280498 ) ) ( not ( = ?auto_2280491 ?auto_2280499 ) ) ( not ( = ?auto_2280491 ?auto_2280504 ) ) ( not ( = ?auto_2280492 ?auto_2280493 ) ) ( not ( = ?auto_2280492 ?auto_2280494 ) ) ( not ( = ?auto_2280492 ?auto_2280495 ) ) ( not ( = ?auto_2280492 ?auto_2280496 ) ) ( not ( = ?auto_2280492 ?auto_2280497 ) ) ( not ( = ?auto_2280492 ?auto_2280498 ) ) ( not ( = ?auto_2280492 ?auto_2280499 ) ) ( not ( = ?auto_2280492 ?auto_2280504 ) ) ( not ( = ?auto_2280493 ?auto_2280494 ) ) ( not ( = ?auto_2280493 ?auto_2280495 ) ) ( not ( = ?auto_2280493 ?auto_2280496 ) ) ( not ( = ?auto_2280493 ?auto_2280497 ) ) ( not ( = ?auto_2280493 ?auto_2280498 ) ) ( not ( = ?auto_2280493 ?auto_2280499 ) ) ( not ( = ?auto_2280493 ?auto_2280504 ) ) ( not ( = ?auto_2280494 ?auto_2280495 ) ) ( not ( = ?auto_2280494 ?auto_2280496 ) ) ( not ( = ?auto_2280494 ?auto_2280497 ) ) ( not ( = ?auto_2280494 ?auto_2280498 ) ) ( not ( = ?auto_2280494 ?auto_2280499 ) ) ( not ( = ?auto_2280494 ?auto_2280504 ) ) ( not ( = ?auto_2280495 ?auto_2280496 ) ) ( not ( = ?auto_2280495 ?auto_2280497 ) ) ( not ( = ?auto_2280495 ?auto_2280498 ) ) ( not ( = ?auto_2280495 ?auto_2280499 ) ) ( not ( = ?auto_2280495 ?auto_2280504 ) ) ( not ( = ?auto_2280496 ?auto_2280497 ) ) ( not ( = ?auto_2280496 ?auto_2280498 ) ) ( not ( = ?auto_2280496 ?auto_2280499 ) ) ( not ( = ?auto_2280496 ?auto_2280504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280497 ?auto_2280498 ?auto_2280499 )
      ( MAKE-10CRATE-VERIFY ?auto_2280489 ?auto_2280490 ?auto_2280491 ?auto_2280492 ?auto_2280493 ?auto_2280494 ?auto_2280495 ?auto_2280496 ?auto_2280497 ?auto_2280498 ?auto_2280499 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280615 - SURFACE
      ?auto_2280616 - SURFACE
      ?auto_2280617 - SURFACE
      ?auto_2280618 - SURFACE
      ?auto_2280619 - SURFACE
      ?auto_2280620 - SURFACE
      ?auto_2280621 - SURFACE
      ?auto_2280622 - SURFACE
      ?auto_2280623 - SURFACE
      ?auto_2280624 - SURFACE
      ?auto_2280625 - SURFACE
    )
    :vars
    (
      ?auto_2280628 - HOIST
      ?auto_2280629 - PLACE
      ?auto_2280630 - PLACE
      ?auto_2280631 - HOIST
      ?auto_2280626 - SURFACE
      ?auto_2280627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280628 ?auto_2280629 ) ( IS-CRATE ?auto_2280625 ) ( not ( = ?auto_2280624 ?auto_2280625 ) ) ( not ( = ?auto_2280623 ?auto_2280624 ) ) ( not ( = ?auto_2280623 ?auto_2280625 ) ) ( not ( = ?auto_2280630 ?auto_2280629 ) ) ( HOIST-AT ?auto_2280631 ?auto_2280630 ) ( not ( = ?auto_2280628 ?auto_2280631 ) ) ( AVAILABLE ?auto_2280631 ) ( SURFACE-AT ?auto_2280625 ?auto_2280630 ) ( ON ?auto_2280625 ?auto_2280626 ) ( CLEAR ?auto_2280625 ) ( not ( = ?auto_2280624 ?auto_2280626 ) ) ( not ( = ?auto_2280625 ?auto_2280626 ) ) ( not ( = ?auto_2280623 ?auto_2280626 ) ) ( TRUCK-AT ?auto_2280627 ?auto_2280629 ) ( SURFACE-AT ?auto_2280623 ?auto_2280629 ) ( CLEAR ?auto_2280623 ) ( LIFTING ?auto_2280628 ?auto_2280624 ) ( IS-CRATE ?auto_2280624 ) ( ON ?auto_2280616 ?auto_2280615 ) ( ON ?auto_2280617 ?auto_2280616 ) ( ON ?auto_2280618 ?auto_2280617 ) ( ON ?auto_2280619 ?auto_2280618 ) ( ON ?auto_2280620 ?auto_2280619 ) ( ON ?auto_2280621 ?auto_2280620 ) ( ON ?auto_2280622 ?auto_2280621 ) ( ON ?auto_2280623 ?auto_2280622 ) ( not ( = ?auto_2280615 ?auto_2280616 ) ) ( not ( = ?auto_2280615 ?auto_2280617 ) ) ( not ( = ?auto_2280615 ?auto_2280618 ) ) ( not ( = ?auto_2280615 ?auto_2280619 ) ) ( not ( = ?auto_2280615 ?auto_2280620 ) ) ( not ( = ?auto_2280615 ?auto_2280621 ) ) ( not ( = ?auto_2280615 ?auto_2280622 ) ) ( not ( = ?auto_2280615 ?auto_2280623 ) ) ( not ( = ?auto_2280615 ?auto_2280624 ) ) ( not ( = ?auto_2280615 ?auto_2280625 ) ) ( not ( = ?auto_2280615 ?auto_2280626 ) ) ( not ( = ?auto_2280616 ?auto_2280617 ) ) ( not ( = ?auto_2280616 ?auto_2280618 ) ) ( not ( = ?auto_2280616 ?auto_2280619 ) ) ( not ( = ?auto_2280616 ?auto_2280620 ) ) ( not ( = ?auto_2280616 ?auto_2280621 ) ) ( not ( = ?auto_2280616 ?auto_2280622 ) ) ( not ( = ?auto_2280616 ?auto_2280623 ) ) ( not ( = ?auto_2280616 ?auto_2280624 ) ) ( not ( = ?auto_2280616 ?auto_2280625 ) ) ( not ( = ?auto_2280616 ?auto_2280626 ) ) ( not ( = ?auto_2280617 ?auto_2280618 ) ) ( not ( = ?auto_2280617 ?auto_2280619 ) ) ( not ( = ?auto_2280617 ?auto_2280620 ) ) ( not ( = ?auto_2280617 ?auto_2280621 ) ) ( not ( = ?auto_2280617 ?auto_2280622 ) ) ( not ( = ?auto_2280617 ?auto_2280623 ) ) ( not ( = ?auto_2280617 ?auto_2280624 ) ) ( not ( = ?auto_2280617 ?auto_2280625 ) ) ( not ( = ?auto_2280617 ?auto_2280626 ) ) ( not ( = ?auto_2280618 ?auto_2280619 ) ) ( not ( = ?auto_2280618 ?auto_2280620 ) ) ( not ( = ?auto_2280618 ?auto_2280621 ) ) ( not ( = ?auto_2280618 ?auto_2280622 ) ) ( not ( = ?auto_2280618 ?auto_2280623 ) ) ( not ( = ?auto_2280618 ?auto_2280624 ) ) ( not ( = ?auto_2280618 ?auto_2280625 ) ) ( not ( = ?auto_2280618 ?auto_2280626 ) ) ( not ( = ?auto_2280619 ?auto_2280620 ) ) ( not ( = ?auto_2280619 ?auto_2280621 ) ) ( not ( = ?auto_2280619 ?auto_2280622 ) ) ( not ( = ?auto_2280619 ?auto_2280623 ) ) ( not ( = ?auto_2280619 ?auto_2280624 ) ) ( not ( = ?auto_2280619 ?auto_2280625 ) ) ( not ( = ?auto_2280619 ?auto_2280626 ) ) ( not ( = ?auto_2280620 ?auto_2280621 ) ) ( not ( = ?auto_2280620 ?auto_2280622 ) ) ( not ( = ?auto_2280620 ?auto_2280623 ) ) ( not ( = ?auto_2280620 ?auto_2280624 ) ) ( not ( = ?auto_2280620 ?auto_2280625 ) ) ( not ( = ?auto_2280620 ?auto_2280626 ) ) ( not ( = ?auto_2280621 ?auto_2280622 ) ) ( not ( = ?auto_2280621 ?auto_2280623 ) ) ( not ( = ?auto_2280621 ?auto_2280624 ) ) ( not ( = ?auto_2280621 ?auto_2280625 ) ) ( not ( = ?auto_2280621 ?auto_2280626 ) ) ( not ( = ?auto_2280622 ?auto_2280623 ) ) ( not ( = ?auto_2280622 ?auto_2280624 ) ) ( not ( = ?auto_2280622 ?auto_2280625 ) ) ( not ( = ?auto_2280622 ?auto_2280626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280623 ?auto_2280624 ?auto_2280625 )
      ( MAKE-10CRATE-VERIFY ?auto_2280615 ?auto_2280616 ?auto_2280617 ?auto_2280618 ?auto_2280619 ?auto_2280620 ?auto_2280621 ?auto_2280622 ?auto_2280623 ?auto_2280624 ?auto_2280625 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280741 - SURFACE
      ?auto_2280742 - SURFACE
      ?auto_2280743 - SURFACE
      ?auto_2280744 - SURFACE
      ?auto_2280745 - SURFACE
      ?auto_2280746 - SURFACE
      ?auto_2280747 - SURFACE
      ?auto_2280748 - SURFACE
      ?auto_2280749 - SURFACE
      ?auto_2280750 - SURFACE
      ?auto_2280751 - SURFACE
    )
    :vars
    (
      ?auto_2280755 - HOIST
      ?auto_2280753 - PLACE
      ?auto_2280756 - PLACE
      ?auto_2280754 - HOIST
      ?auto_2280757 - SURFACE
      ?auto_2280752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280755 ?auto_2280753 ) ( IS-CRATE ?auto_2280751 ) ( not ( = ?auto_2280750 ?auto_2280751 ) ) ( not ( = ?auto_2280749 ?auto_2280750 ) ) ( not ( = ?auto_2280749 ?auto_2280751 ) ) ( not ( = ?auto_2280756 ?auto_2280753 ) ) ( HOIST-AT ?auto_2280754 ?auto_2280756 ) ( not ( = ?auto_2280755 ?auto_2280754 ) ) ( AVAILABLE ?auto_2280754 ) ( SURFACE-AT ?auto_2280751 ?auto_2280756 ) ( ON ?auto_2280751 ?auto_2280757 ) ( CLEAR ?auto_2280751 ) ( not ( = ?auto_2280750 ?auto_2280757 ) ) ( not ( = ?auto_2280751 ?auto_2280757 ) ) ( not ( = ?auto_2280749 ?auto_2280757 ) ) ( TRUCK-AT ?auto_2280752 ?auto_2280753 ) ( SURFACE-AT ?auto_2280749 ?auto_2280753 ) ( CLEAR ?auto_2280749 ) ( IS-CRATE ?auto_2280750 ) ( AVAILABLE ?auto_2280755 ) ( IN ?auto_2280750 ?auto_2280752 ) ( ON ?auto_2280742 ?auto_2280741 ) ( ON ?auto_2280743 ?auto_2280742 ) ( ON ?auto_2280744 ?auto_2280743 ) ( ON ?auto_2280745 ?auto_2280744 ) ( ON ?auto_2280746 ?auto_2280745 ) ( ON ?auto_2280747 ?auto_2280746 ) ( ON ?auto_2280748 ?auto_2280747 ) ( ON ?auto_2280749 ?auto_2280748 ) ( not ( = ?auto_2280741 ?auto_2280742 ) ) ( not ( = ?auto_2280741 ?auto_2280743 ) ) ( not ( = ?auto_2280741 ?auto_2280744 ) ) ( not ( = ?auto_2280741 ?auto_2280745 ) ) ( not ( = ?auto_2280741 ?auto_2280746 ) ) ( not ( = ?auto_2280741 ?auto_2280747 ) ) ( not ( = ?auto_2280741 ?auto_2280748 ) ) ( not ( = ?auto_2280741 ?auto_2280749 ) ) ( not ( = ?auto_2280741 ?auto_2280750 ) ) ( not ( = ?auto_2280741 ?auto_2280751 ) ) ( not ( = ?auto_2280741 ?auto_2280757 ) ) ( not ( = ?auto_2280742 ?auto_2280743 ) ) ( not ( = ?auto_2280742 ?auto_2280744 ) ) ( not ( = ?auto_2280742 ?auto_2280745 ) ) ( not ( = ?auto_2280742 ?auto_2280746 ) ) ( not ( = ?auto_2280742 ?auto_2280747 ) ) ( not ( = ?auto_2280742 ?auto_2280748 ) ) ( not ( = ?auto_2280742 ?auto_2280749 ) ) ( not ( = ?auto_2280742 ?auto_2280750 ) ) ( not ( = ?auto_2280742 ?auto_2280751 ) ) ( not ( = ?auto_2280742 ?auto_2280757 ) ) ( not ( = ?auto_2280743 ?auto_2280744 ) ) ( not ( = ?auto_2280743 ?auto_2280745 ) ) ( not ( = ?auto_2280743 ?auto_2280746 ) ) ( not ( = ?auto_2280743 ?auto_2280747 ) ) ( not ( = ?auto_2280743 ?auto_2280748 ) ) ( not ( = ?auto_2280743 ?auto_2280749 ) ) ( not ( = ?auto_2280743 ?auto_2280750 ) ) ( not ( = ?auto_2280743 ?auto_2280751 ) ) ( not ( = ?auto_2280743 ?auto_2280757 ) ) ( not ( = ?auto_2280744 ?auto_2280745 ) ) ( not ( = ?auto_2280744 ?auto_2280746 ) ) ( not ( = ?auto_2280744 ?auto_2280747 ) ) ( not ( = ?auto_2280744 ?auto_2280748 ) ) ( not ( = ?auto_2280744 ?auto_2280749 ) ) ( not ( = ?auto_2280744 ?auto_2280750 ) ) ( not ( = ?auto_2280744 ?auto_2280751 ) ) ( not ( = ?auto_2280744 ?auto_2280757 ) ) ( not ( = ?auto_2280745 ?auto_2280746 ) ) ( not ( = ?auto_2280745 ?auto_2280747 ) ) ( not ( = ?auto_2280745 ?auto_2280748 ) ) ( not ( = ?auto_2280745 ?auto_2280749 ) ) ( not ( = ?auto_2280745 ?auto_2280750 ) ) ( not ( = ?auto_2280745 ?auto_2280751 ) ) ( not ( = ?auto_2280745 ?auto_2280757 ) ) ( not ( = ?auto_2280746 ?auto_2280747 ) ) ( not ( = ?auto_2280746 ?auto_2280748 ) ) ( not ( = ?auto_2280746 ?auto_2280749 ) ) ( not ( = ?auto_2280746 ?auto_2280750 ) ) ( not ( = ?auto_2280746 ?auto_2280751 ) ) ( not ( = ?auto_2280746 ?auto_2280757 ) ) ( not ( = ?auto_2280747 ?auto_2280748 ) ) ( not ( = ?auto_2280747 ?auto_2280749 ) ) ( not ( = ?auto_2280747 ?auto_2280750 ) ) ( not ( = ?auto_2280747 ?auto_2280751 ) ) ( not ( = ?auto_2280747 ?auto_2280757 ) ) ( not ( = ?auto_2280748 ?auto_2280749 ) ) ( not ( = ?auto_2280748 ?auto_2280750 ) ) ( not ( = ?auto_2280748 ?auto_2280751 ) ) ( not ( = ?auto_2280748 ?auto_2280757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280749 ?auto_2280750 ?auto_2280751 )
      ( MAKE-10CRATE-VERIFY ?auto_2280741 ?auto_2280742 ?auto_2280743 ?auto_2280744 ?auto_2280745 ?auto_2280746 ?auto_2280747 ?auto_2280748 ?auto_2280749 ?auto_2280750 ?auto_2280751 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288005 - SURFACE
      ?auto_2288006 - SURFACE
      ?auto_2288007 - SURFACE
      ?auto_2288008 - SURFACE
      ?auto_2288009 - SURFACE
      ?auto_2288010 - SURFACE
      ?auto_2288011 - SURFACE
      ?auto_2288012 - SURFACE
      ?auto_2288013 - SURFACE
      ?auto_2288014 - SURFACE
      ?auto_2288015 - SURFACE
      ?auto_2288016 - SURFACE
    )
    :vars
    (
      ?auto_2288017 - HOIST
      ?auto_2288018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288017 ?auto_2288018 ) ( SURFACE-AT ?auto_2288015 ?auto_2288018 ) ( CLEAR ?auto_2288015 ) ( LIFTING ?auto_2288017 ?auto_2288016 ) ( IS-CRATE ?auto_2288016 ) ( not ( = ?auto_2288015 ?auto_2288016 ) ) ( ON ?auto_2288006 ?auto_2288005 ) ( ON ?auto_2288007 ?auto_2288006 ) ( ON ?auto_2288008 ?auto_2288007 ) ( ON ?auto_2288009 ?auto_2288008 ) ( ON ?auto_2288010 ?auto_2288009 ) ( ON ?auto_2288011 ?auto_2288010 ) ( ON ?auto_2288012 ?auto_2288011 ) ( ON ?auto_2288013 ?auto_2288012 ) ( ON ?auto_2288014 ?auto_2288013 ) ( ON ?auto_2288015 ?auto_2288014 ) ( not ( = ?auto_2288005 ?auto_2288006 ) ) ( not ( = ?auto_2288005 ?auto_2288007 ) ) ( not ( = ?auto_2288005 ?auto_2288008 ) ) ( not ( = ?auto_2288005 ?auto_2288009 ) ) ( not ( = ?auto_2288005 ?auto_2288010 ) ) ( not ( = ?auto_2288005 ?auto_2288011 ) ) ( not ( = ?auto_2288005 ?auto_2288012 ) ) ( not ( = ?auto_2288005 ?auto_2288013 ) ) ( not ( = ?auto_2288005 ?auto_2288014 ) ) ( not ( = ?auto_2288005 ?auto_2288015 ) ) ( not ( = ?auto_2288005 ?auto_2288016 ) ) ( not ( = ?auto_2288006 ?auto_2288007 ) ) ( not ( = ?auto_2288006 ?auto_2288008 ) ) ( not ( = ?auto_2288006 ?auto_2288009 ) ) ( not ( = ?auto_2288006 ?auto_2288010 ) ) ( not ( = ?auto_2288006 ?auto_2288011 ) ) ( not ( = ?auto_2288006 ?auto_2288012 ) ) ( not ( = ?auto_2288006 ?auto_2288013 ) ) ( not ( = ?auto_2288006 ?auto_2288014 ) ) ( not ( = ?auto_2288006 ?auto_2288015 ) ) ( not ( = ?auto_2288006 ?auto_2288016 ) ) ( not ( = ?auto_2288007 ?auto_2288008 ) ) ( not ( = ?auto_2288007 ?auto_2288009 ) ) ( not ( = ?auto_2288007 ?auto_2288010 ) ) ( not ( = ?auto_2288007 ?auto_2288011 ) ) ( not ( = ?auto_2288007 ?auto_2288012 ) ) ( not ( = ?auto_2288007 ?auto_2288013 ) ) ( not ( = ?auto_2288007 ?auto_2288014 ) ) ( not ( = ?auto_2288007 ?auto_2288015 ) ) ( not ( = ?auto_2288007 ?auto_2288016 ) ) ( not ( = ?auto_2288008 ?auto_2288009 ) ) ( not ( = ?auto_2288008 ?auto_2288010 ) ) ( not ( = ?auto_2288008 ?auto_2288011 ) ) ( not ( = ?auto_2288008 ?auto_2288012 ) ) ( not ( = ?auto_2288008 ?auto_2288013 ) ) ( not ( = ?auto_2288008 ?auto_2288014 ) ) ( not ( = ?auto_2288008 ?auto_2288015 ) ) ( not ( = ?auto_2288008 ?auto_2288016 ) ) ( not ( = ?auto_2288009 ?auto_2288010 ) ) ( not ( = ?auto_2288009 ?auto_2288011 ) ) ( not ( = ?auto_2288009 ?auto_2288012 ) ) ( not ( = ?auto_2288009 ?auto_2288013 ) ) ( not ( = ?auto_2288009 ?auto_2288014 ) ) ( not ( = ?auto_2288009 ?auto_2288015 ) ) ( not ( = ?auto_2288009 ?auto_2288016 ) ) ( not ( = ?auto_2288010 ?auto_2288011 ) ) ( not ( = ?auto_2288010 ?auto_2288012 ) ) ( not ( = ?auto_2288010 ?auto_2288013 ) ) ( not ( = ?auto_2288010 ?auto_2288014 ) ) ( not ( = ?auto_2288010 ?auto_2288015 ) ) ( not ( = ?auto_2288010 ?auto_2288016 ) ) ( not ( = ?auto_2288011 ?auto_2288012 ) ) ( not ( = ?auto_2288011 ?auto_2288013 ) ) ( not ( = ?auto_2288011 ?auto_2288014 ) ) ( not ( = ?auto_2288011 ?auto_2288015 ) ) ( not ( = ?auto_2288011 ?auto_2288016 ) ) ( not ( = ?auto_2288012 ?auto_2288013 ) ) ( not ( = ?auto_2288012 ?auto_2288014 ) ) ( not ( = ?auto_2288012 ?auto_2288015 ) ) ( not ( = ?auto_2288012 ?auto_2288016 ) ) ( not ( = ?auto_2288013 ?auto_2288014 ) ) ( not ( = ?auto_2288013 ?auto_2288015 ) ) ( not ( = ?auto_2288013 ?auto_2288016 ) ) ( not ( = ?auto_2288014 ?auto_2288015 ) ) ( not ( = ?auto_2288014 ?auto_2288016 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2288015 ?auto_2288016 )
      ( MAKE-11CRATE-VERIFY ?auto_2288005 ?auto_2288006 ?auto_2288007 ?auto_2288008 ?auto_2288009 ?auto_2288010 ?auto_2288011 ?auto_2288012 ?auto_2288013 ?auto_2288014 ?auto_2288015 ?auto_2288016 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288114 - SURFACE
      ?auto_2288115 - SURFACE
      ?auto_2288116 - SURFACE
      ?auto_2288117 - SURFACE
      ?auto_2288118 - SURFACE
      ?auto_2288119 - SURFACE
      ?auto_2288120 - SURFACE
      ?auto_2288121 - SURFACE
      ?auto_2288122 - SURFACE
      ?auto_2288123 - SURFACE
      ?auto_2288124 - SURFACE
      ?auto_2288125 - SURFACE
    )
    :vars
    (
      ?auto_2288128 - HOIST
      ?auto_2288126 - PLACE
      ?auto_2288127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288128 ?auto_2288126 ) ( SURFACE-AT ?auto_2288124 ?auto_2288126 ) ( CLEAR ?auto_2288124 ) ( IS-CRATE ?auto_2288125 ) ( not ( = ?auto_2288124 ?auto_2288125 ) ) ( TRUCK-AT ?auto_2288127 ?auto_2288126 ) ( AVAILABLE ?auto_2288128 ) ( IN ?auto_2288125 ?auto_2288127 ) ( ON ?auto_2288124 ?auto_2288123 ) ( not ( = ?auto_2288123 ?auto_2288124 ) ) ( not ( = ?auto_2288123 ?auto_2288125 ) ) ( ON ?auto_2288115 ?auto_2288114 ) ( ON ?auto_2288116 ?auto_2288115 ) ( ON ?auto_2288117 ?auto_2288116 ) ( ON ?auto_2288118 ?auto_2288117 ) ( ON ?auto_2288119 ?auto_2288118 ) ( ON ?auto_2288120 ?auto_2288119 ) ( ON ?auto_2288121 ?auto_2288120 ) ( ON ?auto_2288122 ?auto_2288121 ) ( ON ?auto_2288123 ?auto_2288122 ) ( not ( = ?auto_2288114 ?auto_2288115 ) ) ( not ( = ?auto_2288114 ?auto_2288116 ) ) ( not ( = ?auto_2288114 ?auto_2288117 ) ) ( not ( = ?auto_2288114 ?auto_2288118 ) ) ( not ( = ?auto_2288114 ?auto_2288119 ) ) ( not ( = ?auto_2288114 ?auto_2288120 ) ) ( not ( = ?auto_2288114 ?auto_2288121 ) ) ( not ( = ?auto_2288114 ?auto_2288122 ) ) ( not ( = ?auto_2288114 ?auto_2288123 ) ) ( not ( = ?auto_2288114 ?auto_2288124 ) ) ( not ( = ?auto_2288114 ?auto_2288125 ) ) ( not ( = ?auto_2288115 ?auto_2288116 ) ) ( not ( = ?auto_2288115 ?auto_2288117 ) ) ( not ( = ?auto_2288115 ?auto_2288118 ) ) ( not ( = ?auto_2288115 ?auto_2288119 ) ) ( not ( = ?auto_2288115 ?auto_2288120 ) ) ( not ( = ?auto_2288115 ?auto_2288121 ) ) ( not ( = ?auto_2288115 ?auto_2288122 ) ) ( not ( = ?auto_2288115 ?auto_2288123 ) ) ( not ( = ?auto_2288115 ?auto_2288124 ) ) ( not ( = ?auto_2288115 ?auto_2288125 ) ) ( not ( = ?auto_2288116 ?auto_2288117 ) ) ( not ( = ?auto_2288116 ?auto_2288118 ) ) ( not ( = ?auto_2288116 ?auto_2288119 ) ) ( not ( = ?auto_2288116 ?auto_2288120 ) ) ( not ( = ?auto_2288116 ?auto_2288121 ) ) ( not ( = ?auto_2288116 ?auto_2288122 ) ) ( not ( = ?auto_2288116 ?auto_2288123 ) ) ( not ( = ?auto_2288116 ?auto_2288124 ) ) ( not ( = ?auto_2288116 ?auto_2288125 ) ) ( not ( = ?auto_2288117 ?auto_2288118 ) ) ( not ( = ?auto_2288117 ?auto_2288119 ) ) ( not ( = ?auto_2288117 ?auto_2288120 ) ) ( not ( = ?auto_2288117 ?auto_2288121 ) ) ( not ( = ?auto_2288117 ?auto_2288122 ) ) ( not ( = ?auto_2288117 ?auto_2288123 ) ) ( not ( = ?auto_2288117 ?auto_2288124 ) ) ( not ( = ?auto_2288117 ?auto_2288125 ) ) ( not ( = ?auto_2288118 ?auto_2288119 ) ) ( not ( = ?auto_2288118 ?auto_2288120 ) ) ( not ( = ?auto_2288118 ?auto_2288121 ) ) ( not ( = ?auto_2288118 ?auto_2288122 ) ) ( not ( = ?auto_2288118 ?auto_2288123 ) ) ( not ( = ?auto_2288118 ?auto_2288124 ) ) ( not ( = ?auto_2288118 ?auto_2288125 ) ) ( not ( = ?auto_2288119 ?auto_2288120 ) ) ( not ( = ?auto_2288119 ?auto_2288121 ) ) ( not ( = ?auto_2288119 ?auto_2288122 ) ) ( not ( = ?auto_2288119 ?auto_2288123 ) ) ( not ( = ?auto_2288119 ?auto_2288124 ) ) ( not ( = ?auto_2288119 ?auto_2288125 ) ) ( not ( = ?auto_2288120 ?auto_2288121 ) ) ( not ( = ?auto_2288120 ?auto_2288122 ) ) ( not ( = ?auto_2288120 ?auto_2288123 ) ) ( not ( = ?auto_2288120 ?auto_2288124 ) ) ( not ( = ?auto_2288120 ?auto_2288125 ) ) ( not ( = ?auto_2288121 ?auto_2288122 ) ) ( not ( = ?auto_2288121 ?auto_2288123 ) ) ( not ( = ?auto_2288121 ?auto_2288124 ) ) ( not ( = ?auto_2288121 ?auto_2288125 ) ) ( not ( = ?auto_2288122 ?auto_2288123 ) ) ( not ( = ?auto_2288122 ?auto_2288124 ) ) ( not ( = ?auto_2288122 ?auto_2288125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288123 ?auto_2288124 ?auto_2288125 )
      ( MAKE-11CRATE-VERIFY ?auto_2288114 ?auto_2288115 ?auto_2288116 ?auto_2288117 ?auto_2288118 ?auto_2288119 ?auto_2288120 ?auto_2288121 ?auto_2288122 ?auto_2288123 ?auto_2288124 ?auto_2288125 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288235 - SURFACE
      ?auto_2288236 - SURFACE
      ?auto_2288237 - SURFACE
      ?auto_2288238 - SURFACE
      ?auto_2288239 - SURFACE
      ?auto_2288240 - SURFACE
      ?auto_2288241 - SURFACE
      ?auto_2288242 - SURFACE
      ?auto_2288243 - SURFACE
      ?auto_2288244 - SURFACE
      ?auto_2288245 - SURFACE
      ?auto_2288246 - SURFACE
    )
    :vars
    (
      ?auto_2288247 - HOIST
      ?auto_2288250 - PLACE
      ?auto_2288248 - TRUCK
      ?auto_2288249 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288247 ?auto_2288250 ) ( SURFACE-AT ?auto_2288245 ?auto_2288250 ) ( CLEAR ?auto_2288245 ) ( IS-CRATE ?auto_2288246 ) ( not ( = ?auto_2288245 ?auto_2288246 ) ) ( AVAILABLE ?auto_2288247 ) ( IN ?auto_2288246 ?auto_2288248 ) ( ON ?auto_2288245 ?auto_2288244 ) ( not ( = ?auto_2288244 ?auto_2288245 ) ) ( not ( = ?auto_2288244 ?auto_2288246 ) ) ( TRUCK-AT ?auto_2288248 ?auto_2288249 ) ( not ( = ?auto_2288249 ?auto_2288250 ) ) ( ON ?auto_2288236 ?auto_2288235 ) ( ON ?auto_2288237 ?auto_2288236 ) ( ON ?auto_2288238 ?auto_2288237 ) ( ON ?auto_2288239 ?auto_2288238 ) ( ON ?auto_2288240 ?auto_2288239 ) ( ON ?auto_2288241 ?auto_2288240 ) ( ON ?auto_2288242 ?auto_2288241 ) ( ON ?auto_2288243 ?auto_2288242 ) ( ON ?auto_2288244 ?auto_2288243 ) ( not ( = ?auto_2288235 ?auto_2288236 ) ) ( not ( = ?auto_2288235 ?auto_2288237 ) ) ( not ( = ?auto_2288235 ?auto_2288238 ) ) ( not ( = ?auto_2288235 ?auto_2288239 ) ) ( not ( = ?auto_2288235 ?auto_2288240 ) ) ( not ( = ?auto_2288235 ?auto_2288241 ) ) ( not ( = ?auto_2288235 ?auto_2288242 ) ) ( not ( = ?auto_2288235 ?auto_2288243 ) ) ( not ( = ?auto_2288235 ?auto_2288244 ) ) ( not ( = ?auto_2288235 ?auto_2288245 ) ) ( not ( = ?auto_2288235 ?auto_2288246 ) ) ( not ( = ?auto_2288236 ?auto_2288237 ) ) ( not ( = ?auto_2288236 ?auto_2288238 ) ) ( not ( = ?auto_2288236 ?auto_2288239 ) ) ( not ( = ?auto_2288236 ?auto_2288240 ) ) ( not ( = ?auto_2288236 ?auto_2288241 ) ) ( not ( = ?auto_2288236 ?auto_2288242 ) ) ( not ( = ?auto_2288236 ?auto_2288243 ) ) ( not ( = ?auto_2288236 ?auto_2288244 ) ) ( not ( = ?auto_2288236 ?auto_2288245 ) ) ( not ( = ?auto_2288236 ?auto_2288246 ) ) ( not ( = ?auto_2288237 ?auto_2288238 ) ) ( not ( = ?auto_2288237 ?auto_2288239 ) ) ( not ( = ?auto_2288237 ?auto_2288240 ) ) ( not ( = ?auto_2288237 ?auto_2288241 ) ) ( not ( = ?auto_2288237 ?auto_2288242 ) ) ( not ( = ?auto_2288237 ?auto_2288243 ) ) ( not ( = ?auto_2288237 ?auto_2288244 ) ) ( not ( = ?auto_2288237 ?auto_2288245 ) ) ( not ( = ?auto_2288237 ?auto_2288246 ) ) ( not ( = ?auto_2288238 ?auto_2288239 ) ) ( not ( = ?auto_2288238 ?auto_2288240 ) ) ( not ( = ?auto_2288238 ?auto_2288241 ) ) ( not ( = ?auto_2288238 ?auto_2288242 ) ) ( not ( = ?auto_2288238 ?auto_2288243 ) ) ( not ( = ?auto_2288238 ?auto_2288244 ) ) ( not ( = ?auto_2288238 ?auto_2288245 ) ) ( not ( = ?auto_2288238 ?auto_2288246 ) ) ( not ( = ?auto_2288239 ?auto_2288240 ) ) ( not ( = ?auto_2288239 ?auto_2288241 ) ) ( not ( = ?auto_2288239 ?auto_2288242 ) ) ( not ( = ?auto_2288239 ?auto_2288243 ) ) ( not ( = ?auto_2288239 ?auto_2288244 ) ) ( not ( = ?auto_2288239 ?auto_2288245 ) ) ( not ( = ?auto_2288239 ?auto_2288246 ) ) ( not ( = ?auto_2288240 ?auto_2288241 ) ) ( not ( = ?auto_2288240 ?auto_2288242 ) ) ( not ( = ?auto_2288240 ?auto_2288243 ) ) ( not ( = ?auto_2288240 ?auto_2288244 ) ) ( not ( = ?auto_2288240 ?auto_2288245 ) ) ( not ( = ?auto_2288240 ?auto_2288246 ) ) ( not ( = ?auto_2288241 ?auto_2288242 ) ) ( not ( = ?auto_2288241 ?auto_2288243 ) ) ( not ( = ?auto_2288241 ?auto_2288244 ) ) ( not ( = ?auto_2288241 ?auto_2288245 ) ) ( not ( = ?auto_2288241 ?auto_2288246 ) ) ( not ( = ?auto_2288242 ?auto_2288243 ) ) ( not ( = ?auto_2288242 ?auto_2288244 ) ) ( not ( = ?auto_2288242 ?auto_2288245 ) ) ( not ( = ?auto_2288242 ?auto_2288246 ) ) ( not ( = ?auto_2288243 ?auto_2288244 ) ) ( not ( = ?auto_2288243 ?auto_2288245 ) ) ( not ( = ?auto_2288243 ?auto_2288246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288244 ?auto_2288245 ?auto_2288246 )
      ( MAKE-11CRATE-VERIFY ?auto_2288235 ?auto_2288236 ?auto_2288237 ?auto_2288238 ?auto_2288239 ?auto_2288240 ?auto_2288241 ?auto_2288242 ?auto_2288243 ?auto_2288244 ?auto_2288245 ?auto_2288246 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288367 - SURFACE
      ?auto_2288368 - SURFACE
      ?auto_2288369 - SURFACE
      ?auto_2288370 - SURFACE
      ?auto_2288371 - SURFACE
      ?auto_2288372 - SURFACE
      ?auto_2288373 - SURFACE
      ?auto_2288374 - SURFACE
      ?auto_2288375 - SURFACE
      ?auto_2288376 - SURFACE
      ?auto_2288377 - SURFACE
      ?auto_2288378 - SURFACE
    )
    :vars
    (
      ?auto_2288383 - HOIST
      ?auto_2288379 - PLACE
      ?auto_2288382 - TRUCK
      ?auto_2288381 - PLACE
      ?auto_2288380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288383 ?auto_2288379 ) ( SURFACE-AT ?auto_2288377 ?auto_2288379 ) ( CLEAR ?auto_2288377 ) ( IS-CRATE ?auto_2288378 ) ( not ( = ?auto_2288377 ?auto_2288378 ) ) ( AVAILABLE ?auto_2288383 ) ( ON ?auto_2288377 ?auto_2288376 ) ( not ( = ?auto_2288376 ?auto_2288377 ) ) ( not ( = ?auto_2288376 ?auto_2288378 ) ) ( TRUCK-AT ?auto_2288382 ?auto_2288381 ) ( not ( = ?auto_2288381 ?auto_2288379 ) ) ( HOIST-AT ?auto_2288380 ?auto_2288381 ) ( LIFTING ?auto_2288380 ?auto_2288378 ) ( not ( = ?auto_2288383 ?auto_2288380 ) ) ( ON ?auto_2288368 ?auto_2288367 ) ( ON ?auto_2288369 ?auto_2288368 ) ( ON ?auto_2288370 ?auto_2288369 ) ( ON ?auto_2288371 ?auto_2288370 ) ( ON ?auto_2288372 ?auto_2288371 ) ( ON ?auto_2288373 ?auto_2288372 ) ( ON ?auto_2288374 ?auto_2288373 ) ( ON ?auto_2288375 ?auto_2288374 ) ( ON ?auto_2288376 ?auto_2288375 ) ( not ( = ?auto_2288367 ?auto_2288368 ) ) ( not ( = ?auto_2288367 ?auto_2288369 ) ) ( not ( = ?auto_2288367 ?auto_2288370 ) ) ( not ( = ?auto_2288367 ?auto_2288371 ) ) ( not ( = ?auto_2288367 ?auto_2288372 ) ) ( not ( = ?auto_2288367 ?auto_2288373 ) ) ( not ( = ?auto_2288367 ?auto_2288374 ) ) ( not ( = ?auto_2288367 ?auto_2288375 ) ) ( not ( = ?auto_2288367 ?auto_2288376 ) ) ( not ( = ?auto_2288367 ?auto_2288377 ) ) ( not ( = ?auto_2288367 ?auto_2288378 ) ) ( not ( = ?auto_2288368 ?auto_2288369 ) ) ( not ( = ?auto_2288368 ?auto_2288370 ) ) ( not ( = ?auto_2288368 ?auto_2288371 ) ) ( not ( = ?auto_2288368 ?auto_2288372 ) ) ( not ( = ?auto_2288368 ?auto_2288373 ) ) ( not ( = ?auto_2288368 ?auto_2288374 ) ) ( not ( = ?auto_2288368 ?auto_2288375 ) ) ( not ( = ?auto_2288368 ?auto_2288376 ) ) ( not ( = ?auto_2288368 ?auto_2288377 ) ) ( not ( = ?auto_2288368 ?auto_2288378 ) ) ( not ( = ?auto_2288369 ?auto_2288370 ) ) ( not ( = ?auto_2288369 ?auto_2288371 ) ) ( not ( = ?auto_2288369 ?auto_2288372 ) ) ( not ( = ?auto_2288369 ?auto_2288373 ) ) ( not ( = ?auto_2288369 ?auto_2288374 ) ) ( not ( = ?auto_2288369 ?auto_2288375 ) ) ( not ( = ?auto_2288369 ?auto_2288376 ) ) ( not ( = ?auto_2288369 ?auto_2288377 ) ) ( not ( = ?auto_2288369 ?auto_2288378 ) ) ( not ( = ?auto_2288370 ?auto_2288371 ) ) ( not ( = ?auto_2288370 ?auto_2288372 ) ) ( not ( = ?auto_2288370 ?auto_2288373 ) ) ( not ( = ?auto_2288370 ?auto_2288374 ) ) ( not ( = ?auto_2288370 ?auto_2288375 ) ) ( not ( = ?auto_2288370 ?auto_2288376 ) ) ( not ( = ?auto_2288370 ?auto_2288377 ) ) ( not ( = ?auto_2288370 ?auto_2288378 ) ) ( not ( = ?auto_2288371 ?auto_2288372 ) ) ( not ( = ?auto_2288371 ?auto_2288373 ) ) ( not ( = ?auto_2288371 ?auto_2288374 ) ) ( not ( = ?auto_2288371 ?auto_2288375 ) ) ( not ( = ?auto_2288371 ?auto_2288376 ) ) ( not ( = ?auto_2288371 ?auto_2288377 ) ) ( not ( = ?auto_2288371 ?auto_2288378 ) ) ( not ( = ?auto_2288372 ?auto_2288373 ) ) ( not ( = ?auto_2288372 ?auto_2288374 ) ) ( not ( = ?auto_2288372 ?auto_2288375 ) ) ( not ( = ?auto_2288372 ?auto_2288376 ) ) ( not ( = ?auto_2288372 ?auto_2288377 ) ) ( not ( = ?auto_2288372 ?auto_2288378 ) ) ( not ( = ?auto_2288373 ?auto_2288374 ) ) ( not ( = ?auto_2288373 ?auto_2288375 ) ) ( not ( = ?auto_2288373 ?auto_2288376 ) ) ( not ( = ?auto_2288373 ?auto_2288377 ) ) ( not ( = ?auto_2288373 ?auto_2288378 ) ) ( not ( = ?auto_2288374 ?auto_2288375 ) ) ( not ( = ?auto_2288374 ?auto_2288376 ) ) ( not ( = ?auto_2288374 ?auto_2288377 ) ) ( not ( = ?auto_2288374 ?auto_2288378 ) ) ( not ( = ?auto_2288375 ?auto_2288376 ) ) ( not ( = ?auto_2288375 ?auto_2288377 ) ) ( not ( = ?auto_2288375 ?auto_2288378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288376 ?auto_2288377 ?auto_2288378 )
      ( MAKE-11CRATE-VERIFY ?auto_2288367 ?auto_2288368 ?auto_2288369 ?auto_2288370 ?auto_2288371 ?auto_2288372 ?auto_2288373 ?auto_2288374 ?auto_2288375 ?auto_2288376 ?auto_2288377 ?auto_2288378 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288510 - SURFACE
      ?auto_2288511 - SURFACE
      ?auto_2288512 - SURFACE
      ?auto_2288513 - SURFACE
      ?auto_2288514 - SURFACE
      ?auto_2288515 - SURFACE
      ?auto_2288516 - SURFACE
      ?auto_2288517 - SURFACE
      ?auto_2288518 - SURFACE
      ?auto_2288519 - SURFACE
      ?auto_2288520 - SURFACE
      ?auto_2288521 - SURFACE
    )
    :vars
    (
      ?auto_2288524 - HOIST
      ?auto_2288525 - PLACE
      ?auto_2288527 - TRUCK
      ?auto_2288526 - PLACE
      ?auto_2288522 - HOIST
      ?auto_2288523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288524 ?auto_2288525 ) ( SURFACE-AT ?auto_2288520 ?auto_2288525 ) ( CLEAR ?auto_2288520 ) ( IS-CRATE ?auto_2288521 ) ( not ( = ?auto_2288520 ?auto_2288521 ) ) ( AVAILABLE ?auto_2288524 ) ( ON ?auto_2288520 ?auto_2288519 ) ( not ( = ?auto_2288519 ?auto_2288520 ) ) ( not ( = ?auto_2288519 ?auto_2288521 ) ) ( TRUCK-AT ?auto_2288527 ?auto_2288526 ) ( not ( = ?auto_2288526 ?auto_2288525 ) ) ( HOIST-AT ?auto_2288522 ?auto_2288526 ) ( not ( = ?auto_2288524 ?auto_2288522 ) ) ( AVAILABLE ?auto_2288522 ) ( SURFACE-AT ?auto_2288521 ?auto_2288526 ) ( ON ?auto_2288521 ?auto_2288523 ) ( CLEAR ?auto_2288521 ) ( not ( = ?auto_2288520 ?auto_2288523 ) ) ( not ( = ?auto_2288521 ?auto_2288523 ) ) ( not ( = ?auto_2288519 ?auto_2288523 ) ) ( ON ?auto_2288511 ?auto_2288510 ) ( ON ?auto_2288512 ?auto_2288511 ) ( ON ?auto_2288513 ?auto_2288512 ) ( ON ?auto_2288514 ?auto_2288513 ) ( ON ?auto_2288515 ?auto_2288514 ) ( ON ?auto_2288516 ?auto_2288515 ) ( ON ?auto_2288517 ?auto_2288516 ) ( ON ?auto_2288518 ?auto_2288517 ) ( ON ?auto_2288519 ?auto_2288518 ) ( not ( = ?auto_2288510 ?auto_2288511 ) ) ( not ( = ?auto_2288510 ?auto_2288512 ) ) ( not ( = ?auto_2288510 ?auto_2288513 ) ) ( not ( = ?auto_2288510 ?auto_2288514 ) ) ( not ( = ?auto_2288510 ?auto_2288515 ) ) ( not ( = ?auto_2288510 ?auto_2288516 ) ) ( not ( = ?auto_2288510 ?auto_2288517 ) ) ( not ( = ?auto_2288510 ?auto_2288518 ) ) ( not ( = ?auto_2288510 ?auto_2288519 ) ) ( not ( = ?auto_2288510 ?auto_2288520 ) ) ( not ( = ?auto_2288510 ?auto_2288521 ) ) ( not ( = ?auto_2288510 ?auto_2288523 ) ) ( not ( = ?auto_2288511 ?auto_2288512 ) ) ( not ( = ?auto_2288511 ?auto_2288513 ) ) ( not ( = ?auto_2288511 ?auto_2288514 ) ) ( not ( = ?auto_2288511 ?auto_2288515 ) ) ( not ( = ?auto_2288511 ?auto_2288516 ) ) ( not ( = ?auto_2288511 ?auto_2288517 ) ) ( not ( = ?auto_2288511 ?auto_2288518 ) ) ( not ( = ?auto_2288511 ?auto_2288519 ) ) ( not ( = ?auto_2288511 ?auto_2288520 ) ) ( not ( = ?auto_2288511 ?auto_2288521 ) ) ( not ( = ?auto_2288511 ?auto_2288523 ) ) ( not ( = ?auto_2288512 ?auto_2288513 ) ) ( not ( = ?auto_2288512 ?auto_2288514 ) ) ( not ( = ?auto_2288512 ?auto_2288515 ) ) ( not ( = ?auto_2288512 ?auto_2288516 ) ) ( not ( = ?auto_2288512 ?auto_2288517 ) ) ( not ( = ?auto_2288512 ?auto_2288518 ) ) ( not ( = ?auto_2288512 ?auto_2288519 ) ) ( not ( = ?auto_2288512 ?auto_2288520 ) ) ( not ( = ?auto_2288512 ?auto_2288521 ) ) ( not ( = ?auto_2288512 ?auto_2288523 ) ) ( not ( = ?auto_2288513 ?auto_2288514 ) ) ( not ( = ?auto_2288513 ?auto_2288515 ) ) ( not ( = ?auto_2288513 ?auto_2288516 ) ) ( not ( = ?auto_2288513 ?auto_2288517 ) ) ( not ( = ?auto_2288513 ?auto_2288518 ) ) ( not ( = ?auto_2288513 ?auto_2288519 ) ) ( not ( = ?auto_2288513 ?auto_2288520 ) ) ( not ( = ?auto_2288513 ?auto_2288521 ) ) ( not ( = ?auto_2288513 ?auto_2288523 ) ) ( not ( = ?auto_2288514 ?auto_2288515 ) ) ( not ( = ?auto_2288514 ?auto_2288516 ) ) ( not ( = ?auto_2288514 ?auto_2288517 ) ) ( not ( = ?auto_2288514 ?auto_2288518 ) ) ( not ( = ?auto_2288514 ?auto_2288519 ) ) ( not ( = ?auto_2288514 ?auto_2288520 ) ) ( not ( = ?auto_2288514 ?auto_2288521 ) ) ( not ( = ?auto_2288514 ?auto_2288523 ) ) ( not ( = ?auto_2288515 ?auto_2288516 ) ) ( not ( = ?auto_2288515 ?auto_2288517 ) ) ( not ( = ?auto_2288515 ?auto_2288518 ) ) ( not ( = ?auto_2288515 ?auto_2288519 ) ) ( not ( = ?auto_2288515 ?auto_2288520 ) ) ( not ( = ?auto_2288515 ?auto_2288521 ) ) ( not ( = ?auto_2288515 ?auto_2288523 ) ) ( not ( = ?auto_2288516 ?auto_2288517 ) ) ( not ( = ?auto_2288516 ?auto_2288518 ) ) ( not ( = ?auto_2288516 ?auto_2288519 ) ) ( not ( = ?auto_2288516 ?auto_2288520 ) ) ( not ( = ?auto_2288516 ?auto_2288521 ) ) ( not ( = ?auto_2288516 ?auto_2288523 ) ) ( not ( = ?auto_2288517 ?auto_2288518 ) ) ( not ( = ?auto_2288517 ?auto_2288519 ) ) ( not ( = ?auto_2288517 ?auto_2288520 ) ) ( not ( = ?auto_2288517 ?auto_2288521 ) ) ( not ( = ?auto_2288517 ?auto_2288523 ) ) ( not ( = ?auto_2288518 ?auto_2288519 ) ) ( not ( = ?auto_2288518 ?auto_2288520 ) ) ( not ( = ?auto_2288518 ?auto_2288521 ) ) ( not ( = ?auto_2288518 ?auto_2288523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288519 ?auto_2288520 ?auto_2288521 )
      ( MAKE-11CRATE-VERIFY ?auto_2288510 ?auto_2288511 ?auto_2288512 ?auto_2288513 ?auto_2288514 ?auto_2288515 ?auto_2288516 ?auto_2288517 ?auto_2288518 ?auto_2288519 ?auto_2288520 ?auto_2288521 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288654 - SURFACE
      ?auto_2288655 - SURFACE
      ?auto_2288656 - SURFACE
      ?auto_2288657 - SURFACE
      ?auto_2288658 - SURFACE
      ?auto_2288659 - SURFACE
      ?auto_2288660 - SURFACE
      ?auto_2288661 - SURFACE
      ?auto_2288662 - SURFACE
      ?auto_2288663 - SURFACE
      ?auto_2288664 - SURFACE
      ?auto_2288665 - SURFACE
    )
    :vars
    (
      ?auto_2288671 - HOIST
      ?auto_2288668 - PLACE
      ?auto_2288667 - PLACE
      ?auto_2288669 - HOIST
      ?auto_2288666 - SURFACE
      ?auto_2288670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288671 ?auto_2288668 ) ( SURFACE-AT ?auto_2288664 ?auto_2288668 ) ( CLEAR ?auto_2288664 ) ( IS-CRATE ?auto_2288665 ) ( not ( = ?auto_2288664 ?auto_2288665 ) ) ( AVAILABLE ?auto_2288671 ) ( ON ?auto_2288664 ?auto_2288663 ) ( not ( = ?auto_2288663 ?auto_2288664 ) ) ( not ( = ?auto_2288663 ?auto_2288665 ) ) ( not ( = ?auto_2288667 ?auto_2288668 ) ) ( HOIST-AT ?auto_2288669 ?auto_2288667 ) ( not ( = ?auto_2288671 ?auto_2288669 ) ) ( AVAILABLE ?auto_2288669 ) ( SURFACE-AT ?auto_2288665 ?auto_2288667 ) ( ON ?auto_2288665 ?auto_2288666 ) ( CLEAR ?auto_2288665 ) ( not ( = ?auto_2288664 ?auto_2288666 ) ) ( not ( = ?auto_2288665 ?auto_2288666 ) ) ( not ( = ?auto_2288663 ?auto_2288666 ) ) ( TRUCK-AT ?auto_2288670 ?auto_2288668 ) ( ON ?auto_2288655 ?auto_2288654 ) ( ON ?auto_2288656 ?auto_2288655 ) ( ON ?auto_2288657 ?auto_2288656 ) ( ON ?auto_2288658 ?auto_2288657 ) ( ON ?auto_2288659 ?auto_2288658 ) ( ON ?auto_2288660 ?auto_2288659 ) ( ON ?auto_2288661 ?auto_2288660 ) ( ON ?auto_2288662 ?auto_2288661 ) ( ON ?auto_2288663 ?auto_2288662 ) ( not ( = ?auto_2288654 ?auto_2288655 ) ) ( not ( = ?auto_2288654 ?auto_2288656 ) ) ( not ( = ?auto_2288654 ?auto_2288657 ) ) ( not ( = ?auto_2288654 ?auto_2288658 ) ) ( not ( = ?auto_2288654 ?auto_2288659 ) ) ( not ( = ?auto_2288654 ?auto_2288660 ) ) ( not ( = ?auto_2288654 ?auto_2288661 ) ) ( not ( = ?auto_2288654 ?auto_2288662 ) ) ( not ( = ?auto_2288654 ?auto_2288663 ) ) ( not ( = ?auto_2288654 ?auto_2288664 ) ) ( not ( = ?auto_2288654 ?auto_2288665 ) ) ( not ( = ?auto_2288654 ?auto_2288666 ) ) ( not ( = ?auto_2288655 ?auto_2288656 ) ) ( not ( = ?auto_2288655 ?auto_2288657 ) ) ( not ( = ?auto_2288655 ?auto_2288658 ) ) ( not ( = ?auto_2288655 ?auto_2288659 ) ) ( not ( = ?auto_2288655 ?auto_2288660 ) ) ( not ( = ?auto_2288655 ?auto_2288661 ) ) ( not ( = ?auto_2288655 ?auto_2288662 ) ) ( not ( = ?auto_2288655 ?auto_2288663 ) ) ( not ( = ?auto_2288655 ?auto_2288664 ) ) ( not ( = ?auto_2288655 ?auto_2288665 ) ) ( not ( = ?auto_2288655 ?auto_2288666 ) ) ( not ( = ?auto_2288656 ?auto_2288657 ) ) ( not ( = ?auto_2288656 ?auto_2288658 ) ) ( not ( = ?auto_2288656 ?auto_2288659 ) ) ( not ( = ?auto_2288656 ?auto_2288660 ) ) ( not ( = ?auto_2288656 ?auto_2288661 ) ) ( not ( = ?auto_2288656 ?auto_2288662 ) ) ( not ( = ?auto_2288656 ?auto_2288663 ) ) ( not ( = ?auto_2288656 ?auto_2288664 ) ) ( not ( = ?auto_2288656 ?auto_2288665 ) ) ( not ( = ?auto_2288656 ?auto_2288666 ) ) ( not ( = ?auto_2288657 ?auto_2288658 ) ) ( not ( = ?auto_2288657 ?auto_2288659 ) ) ( not ( = ?auto_2288657 ?auto_2288660 ) ) ( not ( = ?auto_2288657 ?auto_2288661 ) ) ( not ( = ?auto_2288657 ?auto_2288662 ) ) ( not ( = ?auto_2288657 ?auto_2288663 ) ) ( not ( = ?auto_2288657 ?auto_2288664 ) ) ( not ( = ?auto_2288657 ?auto_2288665 ) ) ( not ( = ?auto_2288657 ?auto_2288666 ) ) ( not ( = ?auto_2288658 ?auto_2288659 ) ) ( not ( = ?auto_2288658 ?auto_2288660 ) ) ( not ( = ?auto_2288658 ?auto_2288661 ) ) ( not ( = ?auto_2288658 ?auto_2288662 ) ) ( not ( = ?auto_2288658 ?auto_2288663 ) ) ( not ( = ?auto_2288658 ?auto_2288664 ) ) ( not ( = ?auto_2288658 ?auto_2288665 ) ) ( not ( = ?auto_2288658 ?auto_2288666 ) ) ( not ( = ?auto_2288659 ?auto_2288660 ) ) ( not ( = ?auto_2288659 ?auto_2288661 ) ) ( not ( = ?auto_2288659 ?auto_2288662 ) ) ( not ( = ?auto_2288659 ?auto_2288663 ) ) ( not ( = ?auto_2288659 ?auto_2288664 ) ) ( not ( = ?auto_2288659 ?auto_2288665 ) ) ( not ( = ?auto_2288659 ?auto_2288666 ) ) ( not ( = ?auto_2288660 ?auto_2288661 ) ) ( not ( = ?auto_2288660 ?auto_2288662 ) ) ( not ( = ?auto_2288660 ?auto_2288663 ) ) ( not ( = ?auto_2288660 ?auto_2288664 ) ) ( not ( = ?auto_2288660 ?auto_2288665 ) ) ( not ( = ?auto_2288660 ?auto_2288666 ) ) ( not ( = ?auto_2288661 ?auto_2288662 ) ) ( not ( = ?auto_2288661 ?auto_2288663 ) ) ( not ( = ?auto_2288661 ?auto_2288664 ) ) ( not ( = ?auto_2288661 ?auto_2288665 ) ) ( not ( = ?auto_2288661 ?auto_2288666 ) ) ( not ( = ?auto_2288662 ?auto_2288663 ) ) ( not ( = ?auto_2288662 ?auto_2288664 ) ) ( not ( = ?auto_2288662 ?auto_2288665 ) ) ( not ( = ?auto_2288662 ?auto_2288666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288663 ?auto_2288664 ?auto_2288665 )
      ( MAKE-11CRATE-VERIFY ?auto_2288654 ?auto_2288655 ?auto_2288656 ?auto_2288657 ?auto_2288658 ?auto_2288659 ?auto_2288660 ?auto_2288661 ?auto_2288662 ?auto_2288663 ?auto_2288664 ?auto_2288665 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288798 - SURFACE
      ?auto_2288799 - SURFACE
      ?auto_2288800 - SURFACE
      ?auto_2288801 - SURFACE
      ?auto_2288802 - SURFACE
      ?auto_2288803 - SURFACE
      ?auto_2288804 - SURFACE
      ?auto_2288805 - SURFACE
      ?auto_2288806 - SURFACE
      ?auto_2288807 - SURFACE
      ?auto_2288808 - SURFACE
      ?auto_2288809 - SURFACE
    )
    :vars
    (
      ?auto_2288813 - HOIST
      ?auto_2288812 - PLACE
      ?auto_2288810 - PLACE
      ?auto_2288814 - HOIST
      ?auto_2288811 - SURFACE
      ?auto_2288815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288813 ?auto_2288812 ) ( IS-CRATE ?auto_2288809 ) ( not ( = ?auto_2288808 ?auto_2288809 ) ) ( not ( = ?auto_2288807 ?auto_2288808 ) ) ( not ( = ?auto_2288807 ?auto_2288809 ) ) ( not ( = ?auto_2288810 ?auto_2288812 ) ) ( HOIST-AT ?auto_2288814 ?auto_2288810 ) ( not ( = ?auto_2288813 ?auto_2288814 ) ) ( AVAILABLE ?auto_2288814 ) ( SURFACE-AT ?auto_2288809 ?auto_2288810 ) ( ON ?auto_2288809 ?auto_2288811 ) ( CLEAR ?auto_2288809 ) ( not ( = ?auto_2288808 ?auto_2288811 ) ) ( not ( = ?auto_2288809 ?auto_2288811 ) ) ( not ( = ?auto_2288807 ?auto_2288811 ) ) ( TRUCK-AT ?auto_2288815 ?auto_2288812 ) ( SURFACE-AT ?auto_2288807 ?auto_2288812 ) ( CLEAR ?auto_2288807 ) ( LIFTING ?auto_2288813 ?auto_2288808 ) ( IS-CRATE ?auto_2288808 ) ( ON ?auto_2288799 ?auto_2288798 ) ( ON ?auto_2288800 ?auto_2288799 ) ( ON ?auto_2288801 ?auto_2288800 ) ( ON ?auto_2288802 ?auto_2288801 ) ( ON ?auto_2288803 ?auto_2288802 ) ( ON ?auto_2288804 ?auto_2288803 ) ( ON ?auto_2288805 ?auto_2288804 ) ( ON ?auto_2288806 ?auto_2288805 ) ( ON ?auto_2288807 ?auto_2288806 ) ( not ( = ?auto_2288798 ?auto_2288799 ) ) ( not ( = ?auto_2288798 ?auto_2288800 ) ) ( not ( = ?auto_2288798 ?auto_2288801 ) ) ( not ( = ?auto_2288798 ?auto_2288802 ) ) ( not ( = ?auto_2288798 ?auto_2288803 ) ) ( not ( = ?auto_2288798 ?auto_2288804 ) ) ( not ( = ?auto_2288798 ?auto_2288805 ) ) ( not ( = ?auto_2288798 ?auto_2288806 ) ) ( not ( = ?auto_2288798 ?auto_2288807 ) ) ( not ( = ?auto_2288798 ?auto_2288808 ) ) ( not ( = ?auto_2288798 ?auto_2288809 ) ) ( not ( = ?auto_2288798 ?auto_2288811 ) ) ( not ( = ?auto_2288799 ?auto_2288800 ) ) ( not ( = ?auto_2288799 ?auto_2288801 ) ) ( not ( = ?auto_2288799 ?auto_2288802 ) ) ( not ( = ?auto_2288799 ?auto_2288803 ) ) ( not ( = ?auto_2288799 ?auto_2288804 ) ) ( not ( = ?auto_2288799 ?auto_2288805 ) ) ( not ( = ?auto_2288799 ?auto_2288806 ) ) ( not ( = ?auto_2288799 ?auto_2288807 ) ) ( not ( = ?auto_2288799 ?auto_2288808 ) ) ( not ( = ?auto_2288799 ?auto_2288809 ) ) ( not ( = ?auto_2288799 ?auto_2288811 ) ) ( not ( = ?auto_2288800 ?auto_2288801 ) ) ( not ( = ?auto_2288800 ?auto_2288802 ) ) ( not ( = ?auto_2288800 ?auto_2288803 ) ) ( not ( = ?auto_2288800 ?auto_2288804 ) ) ( not ( = ?auto_2288800 ?auto_2288805 ) ) ( not ( = ?auto_2288800 ?auto_2288806 ) ) ( not ( = ?auto_2288800 ?auto_2288807 ) ) ( not ( = ?auto_2288800 ?auto_2288808 ) ) ( not ( = ?auto_2288800 ?auto_2288809 ) ) ( not ( = ?auto_2288800 ?auto_2288811 ) ) ( not ( = ?auto_2288801 ?auto_2288802 ) ) ( not ( = ?auto_2288801 ?auto_2288803 ) ) ( not ( = ?auto_2288801 ?auto_2288804 ) ) ( not ( = ?auto_2288801 ?auto_2288805 ) ) ( not ( = ?auto_2288801 ?auto_2288806 ) ) ( not ( = ?auto_2288801 ?auto_2288807 ) ) ( not ( = ?auto_2288801 ?auto_2288808 ) ) ( not ( = ?auto_2288801 ?auto_2288809 ) ) ( not ( = ?auto_2288801 ?auto_2288811 ) ) ( not ( = ?auto_2288802 ?auto_2288803 ) ) ( not ( = ?auto_2288802 ?auto_2288804 ) ) ( not ( = ?auto_2288802 ?auto_2288805 ) ) ( not ( = ?auto_2288802 ?auto_2288806 ) ) ( not ( = ?auto_2288802 ?auto_2288807 ) ) ( not ( = ?auto_2288802 ?auto_2288808 ) ) ( not ( = ?auto_2288802 ?auto_2288809 ) ) ( not ( = ?auto_2288802 ?auto_2288811 ) ) ( not ( = ?auto_2288803 ?auto_2288804 ) ) ( not ( = ?auto_2288803 ?auto_2288805 ) ) ( not ( = ?auto_2288803 ?auto_2288806 ) ) ( not ( = ?auto_2288803 ?auto_2288807 ) ) ( not ( = ?auto_2288803 ?auto_2288808 ) ) ( not ( = ?auto_2288803 ?auto_2288809 ) ) ( not ( = ?auto_2288803 ?auto_2288811 ) ) ( not ( = ?auto_2288804 ?auto_2288805 ) ) ( not ( = ?auto_2288804 ?auto_2288806 ) ) ( not ( = ?auto_2288804 ?auto_2288807 ) ) ( not ( = ?auto_2288804 ?auto_2288808 ) ) ( not ( = ?auto_2288804 ?auto_2288809 ) ) ( not ( = ?auto_2288804 ?auto_2288811 ) ) ( not ( = ?auto_2288805 ?auto_2288806 ) ) ( not ( = ?auto_2288805 ?auto_2288807 ) ) ( not ( = ?auto_2288805 ?auto_2288808 ) ) ( not ( = ?auto_2288805 ?auto_2288809 ) ) ( not ( = ?auto_2288805 ?auto_2288811 ) ) ( not ( = ?auto_2288806 ?auto_2288807 ) ) ( not ( = ?auto_2288806 ?auto_2288808 ) ) ( not ( = ?auto_2288806 ?auto_2288809 ) ) ( not ( = ?auto_2288806 ?auto_2288811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288807 ?auto_2288808 ?auto_2288809 )
      ( MAKE-11CRATE-VERIFY ?auto_2288798 ?auto_2288799 ?auto_2288800 ?auto_2288801 ?auto_2288802 ?auto_2288803 ?auto_2288804 ?auto_2288805 ?auto_2288806 ?auto_2288807 ?auto_2288808 ?auto_2288809 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288942 - SURFACE
      ?auto_2288943 - SURFACE
      ?auto_2288944 - SURFACE
      ?auto_2288945 - SURFACE
      ?auto_2288946 - SURFACE
      ?auto_2288947 - SURFACE
      ?auto_2288948 - SURFACE
      ?auto_2288949 - SURFACE
      ?auto_2288950 - SURFACE
      ?auto_2288951 - SURFACE
      ?auto_2288952 - SURFACE
      ?auto_2288953 - SURFACE
    )
    :vars
    (
      ?auto_2288956 - HOIST
      ?auto_2288958 - PLACE
      ?auto_2288957 - PLACE
      ?auto_2288955 - HOIST
      ?auto_2288959 - SURFACE
      ?auto_2288954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288956 ?auto_2288958 ) ( IS-CRATE ?auto_2288953 ) ( not ( = ?auto_2288952 ?auto_2288953 ) ) ( not ( = ?auto_2288951 ?auto_2288952 ) ) ( not ( = ?auto_2288951 ?auto_2288953 ) ) ( not ( = ?auto_2288957 ?auto_2288958 ) ) ( HOIST-AT ?auto_2288955 ?auto_2288957 ) ( not ( = ?auto_2288956 ?auto_2288955 ) ) ( AVAILABLE ?auto_2288955 ) ( SURFACE-AT ?auto_2288953 ?auto_2288957 ) ( ON ?auto_2288953 ?auto_2288959 ) ( CLEAR ?auto_2288953 ) ( not ( = ?auto_2288952 ?auto_2288959 ) ) ( not ( = ?auto_2288953 ?auto_2288959 ) ) ( not ( = ?auto_2288951 ?auto_2288959 ) ) ( TRUCK-AT ?auto_2288954 ?auto_2288958 ) ( SURFACE-AT ?auto_2288951 ?auto_2288958 ) ( CLEAR ?auto_2288951 ) ( IS-CRATE ?auto_2288952 ) ( AVAILABLE ?auto_2288956 ) ( IN ?auto_2288952 ?auto_2288954 ) ( ON ?auto_2288943 ?auto_2288942 ) ( ON ?auto_2288944 ?auto_2288943 ) ( ON ?auto_2288945 ?auto_2288944 ) ( ON ?auto_2288946 ?auto_2288945 ) ( ON ?auto_2288947 ?auto_2288946 ) ( ON ?auto_2288948 ?auto_2288947 ) ( ON ?auto_2288949 ?auto_2288948 ) ( ON ?auto_2288950 ?auto_2288949 ) ( ON ?auto_2288951 ?auto_2288950 ) ( not ( = ?auto_2288942 ?auto_2288943 ) ) ( not ( = ?auto_2288942 ?auto_2288944 ) ) ( not ( = ?auto_2288942 ?auto_2288945 ) ) ( not ( = ?auto_2288942 ?auto_2288946 ) ) ( not ( = ?auto_2288942 ?auto_2288947 ) ) ( not ( = ?auto_2288942 ?auto_2288948 ) ) ( not ( = ?auto_2288942 ?auto_2288949 ) ) ( not ( = ?auto_2288942 ?auto_2288950 ) ) ( not ( = ?auto_2288942 ?auto_2288951 ) ) ( not ( = ?auto_2288942 ?auto_2288952 ) ) ( not ( = ?auto_2288942 ?auto_2288953 ) ) ( not ( = ?auto_2288942 ?auto_2288959 ) ) ( not ( = ?auto_2288943 ?auto_2288944 ) ) ( not ( = ?auto_2288943 ?auto_2288945 ) ) ( not ( = ?auto_2288943 ?auto_2288946 ) ) ( not ( = ?auto_2288943 ?auto_2288947 ) ) ( not ( = ?auto_2288943 ?auto_2288948 ) ) ( not ( = ?auto_2288943 ?auto_2288949 ) ) ( not ( = ?auto_2288943 ?auto_2288950 ) ) ( not ( = ?auto_2288943 ?auto_2288951 ) ) ( not ( = ?auto_2288943 ?auto_2288952 ) ) ( not ( = ?auto_2288943 ?auto_2288953 ) ) ( not ( = ?auto_2288943 ?auto_2288959 ) ) ( not ( = ?auto_2288944 ?auto_2288945 ) ) ( not ( = ?auto_2288944 ?auto_2288946 ) ) ( not ( = ?auto_2288944 ?auto_2288947 ) ) ( not ( = ?auto_2288944 ?auto_2288948 ) ) ( not ( = ?auto_2288944 ?auto_2288949 ) ) ( not ( = ?auto_2288944 ?auto_2288950 ) ) ( not ( = ?auto_2288944 ?auto_2288951 ) ) ( not ( = ?auto_2288944 ?auto_2288952 ) ) ( not ( = ?auto_2288944 ?auto_2288953 ) ) ( not ( = ?auto_2288944 ?auto_2288959 ) ) ( not ( = ?auto_2288945 ?auto_2288946 ) ) ( not ( = ?auto_2288945 ?auto_2288947 ) ) ( not ( = ?auto_2288945 ?auto_2288948 ) ) ( not ( = ?auto_2288945 ?auto_2288949 ) ) ( not ( = ?auto_2288945 ?auto_2288950 ) ) ( not ( = ?auto_2288945 ?auto_2288951 ) ) ( not ( = ?auto_2288945 ?auto_2288952 ) ) ( not ( = ?auto_2288945 ?auto_2288953 ) ) ( not ( = ?auto_2288945 ?auto_2288959 ) ) ( not ( = ?auto_2288946 ?auto_2288947 ) ) ( not ( = ?auto_2288946 ?auto_2288948 ) ) ( not ( = ?auto_2288946 ?auto_2288949 ) ) ( not ( = ?auto_2288946 ?auto_2288950 ) ) ( not ( = ?auto_2288946 ?auto_2288951 ) ) ( not ( = ?auto_2288946 ?auto_2288952 ) ) ( not ( = ?auto_2288946 ?auto_2288953 ) ) ( not ( = ?auto_2288946 ?auto_2288959 ) ) ( not ( = ?auto_2288947 ?auto_2288948 ) ) ( not ( = ?auto_2288947 ?auto_2288949 ) ) ( not ( = ?auto_2288947 ?auto_2288950 ) ) ( not ( = ?auto_2288947 ?auto_2288951 ) ) ( not ( = ?auto_2288947 ?auto_2288952 ) ) ( not ( = ?auto_2288947 ?auto_2288953 ) ) ( not ( = ?auto_2288947 ?auto_2288959 ) ) ( not ( = ?auto_2288948 ?auto_2288949 ) ) ( not ( = ?auto_2288948 ?auto_2288950 ) ) ( not ( = ?auto_2288948 ?auto_2288951 ) ) ( not ( = ?auto_2288948 ?auto_2288952 ) ) ( not ( = ?auto_2288948 ?auto_2288953 ) ) ( not ( = ?auto_2288948 ?auto_2288959 ) ) ( not ( = ?auto_2288949 ?auto_2288950 ) ) ( not ( = ?auto_2288949 ?auto_2288951 ) ) ( not ( = ?auto_2288949 ?auto_2288952 ) ) ( not ( = ?auto_2288949 ?auto_2288953 ) ) ( not ( = ?auto_2288949 ?auto_2288959 ) ) ( not ( = ?auto_2288950 ?auto_2288951 ) ) ( not ( = ?auto_2288950 ?auto_2288952 ) ) ( not ( = ?auto_2288950 ?auto_2288953 ) ) ( not ( = ?auto_2288950 ?auto_2288959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288951 ?auto_2288952 ?auto_2288953 )
      ( MAKE-11CRATE-VERIFY ?auto_2288942 ?auto_2288943 ?auto_2288944 ?auto_2288945 ?auto_2288946 ?auto_2288947 ?auto_2288948 ?auto_2288949 ?auto_2288950 ?auto_2288951 ?auto_2288952 ?auto_2288953 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298233 - SURFACE
      ?auto_2298234 - SURFACE
      ?auto_2298235 - SURFACE
      ?auto_2298236 - SURFACE
      ?auto_2298237 - SURFACE
      ?auto_2298238 - SURFACE
      ?auto_2298239 - SURFACE
      ?auto_2298240 - SURFACE
      ?auto_2298241 - SURFACE
      ?auto_2298242 - SURFACE
      ?auto_2298243 - SURFACE
      ?auto_2298244 - SURFACE
      ?auto_2298245 - SURFACE
    )
    :vars
    (
      ?auto_2298247 - HOIST
      ?auto_2298246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298247 ?auto_2298246 ) ( SURFACE-AT ?auto_2298244 ?auto_2298246 ) ( CLEAR ?auto_2298244 ) ( LIFTING ?auto_2298247 ?auto_2298245 ) ( IS-CRATE ?auto_2298245 ) ( not ( = ?auto_2298244 ?auto_2298245 ) ) ( ON ?auto_2298234 ?auto_2298233 ) ( ON ?auto_2298235 ?auto_2298234 ) ( ON ?auto_2298236 ?auto_2298235 ) ( ON ?auto_2298237 ?auto_2298236 ) ( ON ?auto_2298238 ?auto_2298237 ) ( ON ?auto_2298239 ?auto_2298238 ) ( ON ?auto_2298240 ?auto_2298239 ) ( ON ?auto_2298241 ?auto_2298240 ) ( ON ?auto_2298242 ?auto_2298241 ) ( ON ?auto_2298243 ?auto_2298242 ) ( ON ?auto_2298244 ?auto_2298243 ) ( not ( = ?auto_2298233 ?auto_2298234 ) ) ( not ( = ?auto_2298233 ?auto_2298235 ) ) ( not ( = ?auto_2298233 ?auto_2298236 ) ) ( not ( = ?auto_2298233 ?auto_2298237 ) ) ( not ( = ?auto_2298233 ?auto_2298238 ) ) ( not ( = ?auto_2298233 ?auto_2298239 ) ) ( not ( = ?auto_2298233 ?auto_2298240 ) ) ( not ( = ?auto_2298233 ?auto_2298241 ) ) ( not ( = ?auto_2298233 ?auto_2298242 ) ) ( not ( = ?auto_2298233 ?auto_2298243 ) ) ( not ( = ?auto_2298233 ?auto_2298244 ) ) ( not ( = ?auto_2298233 ?auto_2298245 ) ) ( not ( = ?auto_2298234 ?auto_2298235 ) ) ( not ( = ?auto_2298234 ?auto_2298236 ) ) ( not ( = ?auto_2298234 ?auto_2298237 ) ) ( not ( = ?auto_2298234 ?auto_2298238 ) ) ( not ( = ?auto_2298234 ?auto_2298239 ) ) ( not ( = ?auto_2298234 ?auto_2298240 ) ) ( not ( = ?auto_2298234 ?auto_2298241 ) ) ( not ( = ?auto_2298234 ?auto_2298242 ) ) ( not ( = ?auto_2298234 ?auto_2298243 ) ) ( not ( = ?auto_2298234 ?auto_2298244 ) ) ( not ( = ?auto_2298234 ?auto_2298245 ) ) ( not ( = ?auto_2298235 ?auto_2298236 ) ) ( not ( = ?auto_2298235 ?auto_2298237 ) ) ( not ( = ?auto_2298235 ?auto_2298238 ) ) ( not ( = ?auto_2298235 ?auto_2298239 ) ) ( not ( = ?auto_2298235 ?auto_2298240 ) ) ( not ( = ?auto_2298235 ?auto_2298241 ) ) ( not ( = ?auto_2298235 ?auto_2298242 ) ) ( not ( = ?auto_2298235 ?auto_2298243 ) ) ( not ( = ?auto_2298235 ?auto_2298244 ) ) ( not ( = ?auto_2298235 ?auto_2298245 ) ) ( not ( = ?auto_2298236 ?auto_2298237 ) ) ( not ( = ?auto_2298236 ?auto_2298238 ) ) ( not ( = ?auto_2298236 ?auto_2298239 ) ) ( not ( = ?auto_2298236 ?auto_2298240 ) ) ( not ( = ?auto_2298236 ?auto_2298241 ) ) ( not ( = ?auto_2298236 ?auto_2298242 ) ) ( not ( = ?auto_2298236 ?auto_2298243 ) ) ( not ( = ?auto_2298236 ?auto_2298244 ) ) ( not ( = ?auto_2298236 ?auto_2298245 ) ) ( not ( = ?auto_2298237 ?auto_2298238 ) ) ( not ( = ?auto_2298237 ?auto_2298239 ) ) ( not ( = ?auto_2298237 ?auto_2298240 ) ) ( not ( = ?auto_2298237 ?auto_2298241 ) ) ( not ( = ?auto_2298237 ?auto_2298242 ) ) ( not ( = ?auto_2298237 ?auto_2298243 ) ) ( not ( = ?auto_2298237 ?auto_2298244 ) ) ( not ( = ?auto_2298237 ?auto_2298245 ) ) ( not ( = ?auto_2298238 ?auto_2298239 ) ) ( not ( = ?auto_2298238 ?auto_2298240 ) ) ( not ( = ?auto_2298238 ?auto_2298241 ) ) ( not ( = ?auto_2298238 ?auto_2298242 ) ) ( not ( = ?auto_2298238 ?auto_2298243 ) ) ( not ( = ?auto_2298238 ?auto_2298244 ) ) ( not ( = ?auto_2298238 ?auto_2298245 ) ) ( not ( = ?auto_2298239 ?auto_2298240 ) ) ( not ( = ?auto_2298239 ?auto_2298241 ) ) ( not ( = ?auto_2298239 ?auto_2298242 ) ) ( not ( = ?auto_2298239 ?auto_2298243 ) ) ( not ( = ?auto_2298239 ?auto_2298244 ) ) ( not ( = ?auto_2298239 ?auto_2298245 ) ) ( not ( = ?auto_2298240 ?auto_2298241 ) ) ( not ( = ?auto_2298240 ?auto_2298242 ) ) ( not ( = ?auto_2298240 ?auto_2298243 ) ) ( not ( = ?auto_2298240 ?auto_2298244 ) ) ( not ( = ?auto_2298240 ?auto_2298245 ) ) ( not ( = ?auto_2298241 ?auto_2298242 ) ) ( not ( = ?auto_2298241 ?auto_2298243 ) ) ( not ( = ?auto_2298241 ?auto_2298244 ) ) ( not ( = ?auto_2298241 ?auto_2298245 ) ) ( not ( = ?auto_2298242 ?auto_2298243 ) ) ( not ( = ?auto_2298242 ?auto_2298244 ) ) ( not ( = ?auto_2298242 ?auto_2298245 ) ) ( not ( = ?auto_2298243 ?auto_2298244 ) ) ( not ( = ?auto_2298243 ?auto_2298245 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2298244 ?auto_2298245 )
      ( MAKE-12CRATE-VERIFY ?auto_2298233 ?auto_2298234 ?auto_2298235 ?auto_2298236 ?auto_2298237 ?auto_2298238 ?auto_2298239 ?auto_2298240 ?auto_2298241 ?auto_2298242 ?auto_2298243 ?auto_2298244 ?auto_2298245 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298358 - SURFACE
      ?auto_2298359 - SURFACE
      ?auto_2298360 - SURFACE
      ?auto_2298361 - SURFACE
      ?auto_2298362 - SURFACE
      ?auto_2298363 - SURFACE
      ?auto_2298364 - SURFACE
      ?auto_2298365 - SURFACE
      ?auto_2298366 - SURFACE
      ?auto_2298367 - SURFACE
      ?auto_2298368 - SURFACE
      ?auto_2298369 - SURFACE
      ?auto_2298370 - SURFACE
    )
    :vars
    (
      ?auto_2298372 - HOIST
      ?auto_2298373 - PLACE
      ?auto_2298371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298372 ?auto_2298373 ) ( SURFACE-AT ?auto_2298369 ?auto_2298373 ) ( CLEAR ?auto_2298369 ) ( IS-CRATE ?auto_2298370 ) ( not ( = ?auto_2298369 ?auto_2298370 ) ) ( TRUCK-AT ?auto_2298371 ?auto_2298373 ) ( AVAILABLE ?auto_2298372 ) ( IN ?auto_2298370 ?auto_2298371 ) ( ON ?auto_2298369 ?auto_2298368 ) ( not ( = ?auto_2298368 ?auto_2298369 ) ) ( not ( = ?auto_2298368 ?auto_2298370 ) ) ( ON ?auto_2298359 ?auto_2298358 ) ( ON ?auto_2298360 ?auto_2298359 ) ( ON ?auto_2298361 ?auto_2298360 ) ( ON ?auto_2298362 ?auto_2298361 ) ( ON ?auto_2298363 ?auto_2298362 ) ( ON ?auto_2298364 ?auto_2298363 ) ( ON ?auto_2298365 ?auto_2298364 ) ( ON ?auto_2298366 ?auto_2298365 ) ( ON ?auto_2298367 ?auto_2298366 ) ( ON ?auto_2298368 ?auto_2298367 ) ( not ( = ?auto_2298358 ?auto_2298359 ) ) ( not ( = ?auto_2298358 ?auto_2298360 ) ) ( not ( = ?auto_2298358 ?auto_2298361 ) ) ( not ( = ?auto_2298358 ?auto_2298362 ) ) ( not ( = ?auto_2298358 ?auto_2298363 ) ) ( not ( = ?auto_2298358 ?auto_2298364 ) ) ( not ( = ?auto_2298358 ?auto_2298365 ) ) ( not ( = ?auto_2298358 ?auto_2298366 ) ) ( not ( = ?auto_2298358 ?auto_2298367 ) ) ( not ( = ?auto_2298358 ?auto_2298368 ) ) ( not ( = ?auto_2298358 ?auto_2298369 ) ) ( not ( = ?auto_2298358 ?auto_2298370 ) ) ( not ( = ?auto_2298359 ?auto_2298360 ) ) ( not ( = ?auto_2298359 ?auto_2298361 ) ) ( not ( = ?auto_2298359 ?auto_2298362 ) ) ( not ( = ?auto_2298359 ?auto_2298363 ) ) ( not ( = ?auto_2298359 ?auto_2298364 ) ) ( not ( = ?auto_2298359 ?auto_2298365 ) ) ( not ( = ?auto_2298359 ?auto_2298366 ) ) ( not ( = ?auto_2298359 ?auto_2298367 ) ) ( not ( = ?auto_2298359 ?auto_2298368 ) ) ( not ( = ?auto_2298359 ?auto_2298369 ) ) ( not ( = ?auto_2298359 ?auto_2298370 ) ) ( not ( = ?auto_2298360 ?auto_2298361 ) ) ( not ( = ?auto_2298360 ?auto_2298362 ) ) ( not ( = ?auto_2298360 ?auto_2298363 ) ) ( not ( = ?auto_2298360 ?auto_2298364 ) ) ( not ( = ?auto_2298360 ?auto_2298365 ) ) ( not ( = ?auto_2298360 ?auto_2298366 ) ) ( not ( = ?auto_2298360 ?auto_2298367 ) ) ( not ( = ?auto_2298360 ?auto_2298368 ) ) ( not ( = ?auto_2298360 ?auto_2298369 ) ) ( not ( = ?auto_2298360 ?auto_2298370 ) ) ( not ( = ?auto_2298361 ?auto_2298362 ) ) ( not ( = ?auto_2298361 ?auto_2298363 ) ) ( not ( = ?auto_2298361 ?auto_2298364 ) ) ( not ( = ?auto_2298361 ?auto_2298365 ) ) ( not ( = ?auto_2298361 ?auto_2298366 ) ) ( not ( = ?auto_2298361 ?auto_2298367 ) ) ( not ( = ?auto_2298361 ?auto_2298368 ) ) ( not ( = ?auto_2298361 ?auto_2298369 ) ) ( not ( = ?auto_2298361 ?auto_2298370 ) ) ( not ( = ?auto_2298362 ?auto_2298363 ) ) ( not ( = ?auto_2298362 ?auto_2298364 ) ) ( not ( = ?auto_2298362 ?auto_2298365 ) ) ( not ( = ?auto_2298362 ?auto_2298366 ) ) ( not ( = ?auto_2298362 ?auto_2298367 ) ) ( not ( = ?auto_2298362 ?auto_2298368 ) ) ( not ( = ?auto_2298362 ?auto_2298369 ) ) ( not ( = ?auto_2298362 ?auto_2298370 ) ) ( not ( = ?auto_2298363 ?auto_2298364 ) ) ( not ( = ?auto_2298363 ?auto_2298365 ) ) ( not ( = ?auto_2298363 ?auto_2298366 ) ) ( not ( = ?auto_2298363 ?auto_2298367 ) ) ( not ( = ?auto_2298363 ?auto_2298368 ) ) ( not ( = ?auto_2298363 ?auto_2298369 ) ) ( not ( = ?auto_2298363 ?auto_2298370 ) ) ( not ( = ?auto_2298364 ?auto_2298365 ) ) ( not ( = ?auto_2298364 ?auto_2298366 ) ) ( not ( = ?auto_2298364 ?auto_2298367 ) ) ( not ( = ?auto_2298364 ?auto_2298368 ) ) ( not ( = ?auto_2298364 ?auto_2298369 ) ) ( not ( = ?auto_2298364 ?auto_2298370 ) ) ( not ( = ?auto_2298365 ?auto_2298366 ) ) ( not ( = ?auto_2298365 ?auto_2298367 ) ) ( not ( = ?auto_2298365 ?auto_2298368 ) ) ( not ( = ?auto_2298365 ?auto_2298369 ) ) ( not ( = ?auto_2298365 ?auto_2298370 ) ) ( not ( = ?auto_2298366 ?auto_2298367 ) ) ( not ( = ?auto_2298366 ?auto_2298368 ) ) ( not ( = ?auto_2298366 ?auto_2298369 ) ) ( not ( = ?auto_2298366 ?auto_2298370 ) ) ( not ( = ?auto_2298367 ?auto_2298368 ) ) ( not ( = ?auto_2298367 ?auto_2298369 ) ) ( not ( = ?auto_2298367 ?auto_2298370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2298368 ?auto_2298369 ?auto_2298370 )
      ( MAKE-12CRATE-VERIFY ?auto_2298358 ?auto_2298359 ?auto_2298360 ?auto_2298361 ?auto_2298362 ?auto_2298363 ?auto_2298364 ?auto_2298365 ?auto_2298366 ?auto_2298367 ?auto_2298368 ?auto_2298369 ?auto_2298370 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298496 - SURFACE
      ?auto_2298497 - SURFACE
      ?auto_2298498 - SURFACE
      ?auto_2298499 - SURFACE
      ?auto_2298500 - SURFACE
      ?auto_2298501 - SURFACE
      ?auto_2298502 - SURFACE
      ?auto_2298503 - SURFACE
      ?auto_2298504 - SURFACE
      ?auto_2298505 - SURFACE
      ?auto_2298506 - SURFACE
      ?auto_2298507 - SURFACE
      ?auto_2298508 - SURFACE
    )
    :vars
    (
      ?auto_2298509 - HOIST
      ?auto_2298510 - PLACE
      ?auto_2298512 - TRUCK
      ?auto_2298511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298509 ?auto_2298510 ) ( SURFACE-AT ?auto_2298507 ?auto_2298510 ) ( CLEAR ?auto_2298507 ) ( IS-CRATE ?auto_2298508 ) ( not ( = ?auto_2298507 ?auto_2298508 ) ) ( AVAILABLE ?auto_2298509 ) ( IN ?auto_2298508 ?auto_2298512 ) ( ON ?auto_2298507 ?auto_2298506 ) ( not ( = ?auto_2298506 ?auto_2298507 ) ) ( not ( = ?auto_2298506 ?auto_2298508 ) ) ( TRUCK-AT ?auto_2298512 ?auto_2298511 ) ( not ( = ?auto_2298511 ?auto_2298510 ) ) ( ON ?auto_2298497 ?auto_2298496 ) ( ON ?auto_2298498 ?auto_2298497 ) ( ON ?auto_2298499 ?auto_2298498 ) ( ON ?auto_2298500 ?auto_2298499 ) ( ON ?auto_2298501 ?auto_2298500 ) ( ON ?auto_2298502 ?auto_2298501 ) ( ON ?auto_2298503 ?auto_2298502 ) ( ON ?auto_2298504 ?auto_2298503 ) ( ON ?auto_2298505 ?auto_2298504 ) ( ON ?auto_2298506 ?auto_2298505 ) ( not ( = ?auto_2298496 ?auto_2298497 ) ) ( not ( = ?auto_2298496 ?auto_2298498 ) ) ( not ( = ?auto_2298496 ?auto_2298499 ) ) ( not ( = ?auto_2298496 ?auto_2298500 ) ) ( not ( = ?auto_2298496 ?auto_2298501 ) ) ( not ( = ?auto_2298496 ?auto_2298502 ) ) ( not ( = ?auto_2298496 ?auto_2298503 ) ) ( not ( = ?auto_2298496 ?auto_2298504 ) ) ( not ( = ?auto_2298496 ?auto_2298505 ) ) ( not ( = ?auto_2298496 ?auto_2298506 ) ) ( not ( = ?auto_2298496 ?auto_2298507 ) ) ( not ( = ?auto_2298496 ?auto_2298508 ) ) ( not ( = ?auto_2298497 ?auto_2298498 ) ) ( not ( = ?auto_2298497 ?auto_2298499 ) ) ( not ( = ?auto_2298497 ?auto_2298500 ) ) ( not ( = ?auto_2298497 ?auto_2298501 ) ) ( not ( = ?auto_2298497 ?auto_2298502 ) ) ( not ( = ?auto_2298497 ?auto_2298503 ) ) ( not ( = ?auto_2298497 ?auto_2298504 ) ) ( not ( = ?auto_2298497 ?auto_2298505 ) ) ( not ( = ?auto_2298497 ?auto_2298506 ) ) ( not ( = ?auto_2298497 ?auto_2298507 ) ) ( not ( = ?auto_2298497 ?auto_2298508 ) ) ( not ( = ?auto_2298498 ?auto_2298499 ) ) ( not ( = ?auto_2298498 ?auto_2298500 ) ) ( not ( = ?auto_2298498 ?auto_2298501 ) ) ( not ( = ?auto_2298498 ?auto_2298502 ) ) ( not ( = ?auto_2298498 ?auto_2298503 ) ) ( not ( = ?auto_2298498 ?auto_2298504 ) ) ( not ( = ?auto_2298498 ?auto_2298505 ) ) ( not ( = ?auto_2298498 ?auto_2298506 ) ) ( not ( = ?auto_2298498 ?auto_2298507 ) ) ( not ( = ?auto_2298498 ?auto_2298508 ) ) ( not ( = ?auto_2298499 ?auto_2298500 ) ) ( not ( = ?auto_2298499 ?auto_2298501 ) ) ( not ( = ?auto_2298499 ?auto_2298502 ) ) ( not ( = ?auto_2298499 ?auto_2298503 ) ) ( not ( = ?auto_2298499 ?auto_2298504 ) ) ( not ( = ?auto_2298499 ?auto_2298505 ) ) ( not ( = ?auto_2298499 ?auto_2298506 ) ) ( not ( = ?auto_2298499 ?auto_2298507 ) ) ( not ( = ?auto_2298499 ?auto_2298508 ) ) ( not ( = ?auto_2298500 ?auto_2298501 ) ) ( not ( = ?auto_2298500 ?auto_2298502 ) ) ( not ( = ?auto_2298500 ?auto_2298503 ) ) ( not ( = ?auto_2298500 ?auto_2298504 ) ) ( not ( = ?auto_2298500 ?auto_2298505 ) ) ( not ( = ?auto_2298500 ?auto_2298506 ) ) ( not ( = ?auto_2298500 ?auto_2298507 ) ) ( not ( = ?auto_2298500 ?auto_2298508 ) ) ( not ( = ?auto_2298501 ?auto_2298502 ) ) ( not ( = ?auto_2298501 ?auto_2298503 ) ) ( not ( = ?auto_2298501 ?auto_2298504 ) ) ( not ( = ?auto_2298501 ?auto_2298505 ) ) ( not ( = ?auto_2298501 ?auto_2298506 ) ) ( not ( = ?auto_2298501 ?auto_2298507 ) ) ( not ( = ?auto_2298501 ?auto_2298508 ) ) ( not ( = ?auto_2298502 ?auto_2298503 ) ) ( not ( = ?auto_2298502 ?auto_2298504 ) ) ( not ( = ?auto_2298502 ?auto_2298505 ) ) ( not ( = ?auto_2298502 ?auto_2298506 ) ) ( not ( = ?auto_2298502 ?auto_2298507 ) ) ( not ( = ?auto_2298502 ?auto_2298508 ) ) ( not ( = ?auto_2298503 ?auto_2298504 ) ) ( not ( = ?auto_2298503 ?auto_2298505 ) ) ( not ( = ?auto_2298503 ?auto_2298506 ) ) ( not ( = ?auto_2298503 ?auto_2298507 ) ) ( not ( = ?auto_2298503 ?auto_2298508 ) ) ( not ( = ?auto_2298504 ?auto_2298505 ) ) ( not ( = ?auto_2298504 ?auto_2298506 ) ) ( not ( = ?auto_2298504 ?auto_2298507 ) ) ( not ( = ?auto_2298504 ?auto_2298508 ) ) ( not ( = ?auto_2298505 ?auto_2298506 ) ) ( not ( = ?auto_2298505 ?auto_2298507 ) ) ( not ( = ?auto_2298505 ?auto_2298508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2298506 ?auto_2298507 ?auto_2298508 )
      ( MAKE-12CRATE-VERIFY ?auto_2298496 ?auto_2298497 ?auto_2298498 ?auto_2298499 ?auto_2298500 ?auto_2298501 ?auto_2298502 ?auto_2298503 ?auto_2298504 ?auto_2298505 ?auto_2298506 ?auto_2298507 ?auto_2298508 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298646 - SURFACE
      ?auto_2298647 - SURFACE
      ?auto_2298648 - SURFACE
      ?auto_2298649 - SURFACE
      ?auto_2298650 - SURFACE
      ?auto_2298651 - SURFACE
      ?auto_2298652 - SURFACE
      ?auto_2298653 - SURFACE
      ?auto_2298654 - SURFACE
      ?auto_2298655 - SURFACE
      ?auto_2298656 - SURFACE
      ?auto_2298657 - SURFACE
      ?auto_2298658 - SURFACE
    )
    :vars
    (
      ?auto_2298662 - HOIST
      ?auto_2298659 - PLACE
      ?auto_2298660 - TRUCK
      ?auto_2298663 - PLACE
      ?auto_2298661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298662 ?auto_2298659 ) ( SURFACE-AT ?auto_2298657 ?auto_2298659 ) ( CLEAR ?auto_2298657 ) ( IS-CRATE ?auto_2298658 ) ( not ( = ?auto_2298657 ?auto_2298658 ) ) ( AVAILABLE ?auto_2298662 ) ( ON ?auto_2298657 ?auto_2298656 ) ( not ( = ?auto_2298656 ?auto_2298657 ) ) ( not ( = ?auto_2298656 ?auto_2298658 ) ) ( TRUCK-AT ?auto_2298660 ?auto_2298663 ) ( not ( = ?auto_2298663 ?auto_2298659 ) ) ( HOIST-AT ?auto_2298661 ?auto_2298663 ) ( LIFTING ?auto_2298661 ?auto_2298658 ) ( not ( = ?auto_2298662 ?auto_2298661 ) ) ( ON ?auto_2298647 ?auto_2298646 ) ( ON ?auto_2298648 ?auto_2298647 ) ( ON ?auto_2298649 ?auto_2298648 ) ( ON ?auto_2298650 ?auto_2298649 ) ( ON ?auto_2298651 ?auto_2298650 ) ( ON ?auto_2298652 ?auto_2298651 ) ( ON ?auto_2298653 ?auto_2298652 ) ( ON ?auto_2298654 ?auto_2298653 ) ( ON ?auto_2298655 ?auto_2298654 ) ( ON ?auto_2298656 ?auto_2298655 ) ( not ( = ?auto_2298646 ?auto_2298647 ) ) ( not ( = ?auto_2298646 ?auto_2298648 ) ) ( not ( = ?auto_2298646 ?auto_2298649 ) ) ( not ( = ?auto_2298646 ?auto_2298650 ) ) ( not ( = ?auto_2298646 ?auto_2298651 ) ) ( not ( = ?auto_2298646 ?auto_2298652 ) ) ( not ( = ?auto_2298646 ?auto_2298653 ) ) ( not ( = ?auto_2298646 ?auto_2298654 ) ) ( not ( = ?auto_2298646 ?auto_2298655 ) ) ( not ( = ?auto_2298646 ?auto_2298656 ) ) ( not ( = ?auto_2298646 ?auto_2298657 ) ) ( not ( = ?auto_2298646 ?auto_2298658 ) ) ( not ( = ?auto_2298647 ?auto_2298648 ) ) ( not ( = ?auto_2298647 ?auto_2298649 ) ) ( not ( = ?auto_2298647 ?auto_2298650 ) ) ( not ( = ?auto_2298647 ?auto_2298651 ) ) ( not ( = ?auto_2298647 ?auto_2298652 ) ) ( not ( = ?auto_2298647 ?auto_2298653 ) ) ( not ( = ?auto_2298647 ?auto_2298654 ) ) ( not ( = ?auto_2298647 ?auto_2298655 ) ) ( not ( = ?auto_2298647 ?auto_2298656 ) ) ( not ( = ?auto_2298647 ?auto_2298657 ) ) ( not ( = ?auto_2298647 ?auto_2298658 ) ) ( not ( = ?auto_2298648 ?auto_2298649 ) ) ( not ( = ?auto_2298648 ?auto_2298650 ) ) ( not ( = ?auto_2298648 ?auto_2298651 ) ) ( not ( = ?auto_2298648 ?auto_2298652 ) ) ( not ( = ?auto_2298648 ?auto_2298653 ) ) ( not ( = ?auto_2298648 ?auto_2298654 ) ) ( not ( = ?auto_2298648 ?auto_2298655 ) ) ( not ( = ?auto_2298648 ?auto_2298656 ) ) ( not ( = ?auto_2298648 ?auto_2298657 ) ) ( not ( = ?auto_2298648 ?auto_2298658 ) ) ( not ( = ?auto_2298649 ?auto_2298650 ) ) ( not ( = ?auto_2298649 ?auto_2298651 ) ) ( not ( = ?auto_2298649 ?auto_2298652 ) ) ( not ( = ?auto_2298649 ?auto_2298653 ) ) ( not ( = ?auto_2298649 ?auto_2298654 ) ) ( not ( = ?auto_2298649 ?auto_2298655 ) ) ( not ( = ?auto_2298649 ?auto_2298656 ) ) ( not ( = ?auto_2298649 ?auto_2298657 ) ) ( not ( = ?auto_2298649 ?auto_2298658 ) ) ( not ( = ?auto_2298650 ?auto_2298651 ) ) ( not ( = ?auto_2298650 ?auto_2298652 ) ) ( not ( = ?auto_2298650 ?auto_2298653 ) ) ( not ( = ?auto_2298650 ?auto_2298654 ) ) ( not ( = ?auto_2298650 ?auto_2298655 ) ) ( not ( = ?auto_2298650 ?auto_2298656 ) ) ( not ( = ?auto_2298650 ?auto_2298657 ) ) ( not ( = ?auto_2298650 ?auto_2298658 ) ) ( not ( = ?auto_2298651 ?auto_2298652 ) ) ( not ( = ?auto_2298651 ?auto_2298653 ) ) ( not ( = ?auto_2298651 ?auto_2298654 ) ) ( not ( = ?auto_2298651 ?auto_2298655 ) ) ( not ( = ?auto_2298651 ?auto_2298656 ) ) ( not ( = ?auto_2298651 ?auto_2298657 ) ) ( not ( = ?auto_2298651 ?auto_2298658 ) ) ( not ( = ?auto_2298652 ?auto_2298653 ) ) ( not ( = ?auto_2298652 ?auto_2298654 ) ) ( not ( = ?auto_2298652 ?auto_2298655 ) ) ( not ( = ?auto_2298652 ?auto_2298656 ) ) ( not ( = ?auto_2298652 ?auto_2298657 ) ) ( not ( = ?auto_2298652 ?auto_2298658 ) ) ( not ( = ?auto_2298653 ?auto_2298654 ) ) ( not ( = ?auto_2298653 ?auto_2298655 ) ) ( not ( = ?auto_2298653 ?auto_2298656 ) ) ( not ( = ?auto_2298653 ?auto_2298657 ) ) ( not ( = ?auto_2298653 ?auto_2298658 ) ) ( not ( = ?auto_2298654 ?auto_2298655 ) ) ( not ( = ?auto_2298654 ?auto_2298656 ) ) ( not ( = ?auto_2298654 ?auto_2298657 ) ) ( not ( = ?auto_2298654 ?auto_2298658 ) ) ( not ( = ?auto_2298655 ?auto_2298656 ) ) ( not ( = ?auto_2298655 ?auto_2298657 ) ) ( not ( = ?auto_2298655 ?auto_2298658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2298656 ?auto_2298657 ?auto_2298658 )
      ( MAKE-12CRATE-VERIFY ?auto_2298646 ?auto_2298647 ?auto_2298648 ?auto_2298649 ?auto_2298650 ?auto_2298651 ?auto_2298652 ?auto_2298653 ?auto_2298654 ?auto_2298655 ?auto_2298656 ?auto_2298657 ?auto_2298658 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298808 - SURFACE
      ?auto_2298809 - SURFACE
      ?auto_2298810 - SURFACE
      ?auto_2298811 - SURFACE
      ?auto_2298812 - SURFACE
      ?auto_2298813 - SURFACE
      ?auto_2298814 - SURFACE
      ?auto_2298815 - SURFACE
      ?auto_2298816 - SURFACE
      ?auto_2298817 - SURFACE
      ?auto_2298818 - SURFACE
      ?auto_2298819 - SURFACE
      ?auto_2298820 - SURFACE
    )
    :vars
    (
      ?auto_2298825 - HOIST
      ?auto_2298826 - PLACE
      ?auto_2298824 - TRUCK
      ?auto_2298823 - PLACE
      ?auto_2298821 - HOIST
      ?auto_2298822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298825 ?auto_2298826 ) ( SURFACE-AT ?auto_2298819 ?auto_2298826 ) ( CLEAR ?auto_2298819 ) ( IS-CRATE ?auto_2298820 ) ( not ( = ?auto_2298819 ?auto_2298820 ) ) ( AVAILABLE ?auto_2298825 ) ( ON ?auto_2298819 ?auto_2298818 ) ( not ( = ?auto_2298818 ?auto_2298819 ) ) ( not ( = ?auto_2298818 ?auto_2298820 ) ) ( TRUCK-AT ?auto_2298824 ?auto_2298823 ) ( not ( = ?auto_2298823 ?auto_2298826 ) ) ( HOIST-AT ?auto_2298821 ?auto_2298823 ) ( not ( = ?auto_2298825 ?auto_2298821 ) ) ( AVAILABLE ?auto_2298821 ) ( SURFACE-AT ?auto_2298820 ?auto_2298823 ) ( ON ?auto_2298820 ?auto_2298822 ) ( CLEAR ?auto_2298820 ) ( not ( = ?auto_2298819 ?auto_2298822 ) ) ( not ( = ?auto_2298820 ?auto_2298822 ) ) ( not ( = ?auto_2298818 ?auto_2298822 ) ) ( ON ?auto_2298809 ?auto_2298808 ) ( ON ?auto_2298810 ?auto_2298809 ) ( ON ?auto_2298811 ?auto_2298810 ) ( ON ?auto_2298812 ?auto_2298811 ) ( ON ?auto_2298813 ?auto_2298812 ) ( ON ?auto_2298814 ?auto_2298813 ) ( ON ?auto_2298815 ?auto_2298814 ) ( ON ?auto_2298816 ?auto_2298815 ) ( ON ?auto_2298817 ?auto_2298816 ) ( ON ?auto_2298818 ?auto_2298817 ) ( not ( = ?auto_2298808 ?auto_2298809 ) ) ( not ( = ?auto_2298808 ?auto_2298810 ) ) ( not ( = ?auto_2298808 ?auto_2298811 ) ) ( not ( = ?auto_2298808 ?auto_2298812 ) ) ( not ( = ?auto_2298808 ?auto_2298813 ) ) ( not ( = ?auto_2298808 ?auto_2298814 ) ) ( not ( = ?auto_2298808 ?auto_2298815 ) ) ( not ( = ?auto_2298808 ?auto_2298816 ) ) ( not ( = ?auto_2298808 ?auto_2298817 ) ) ( not ( = ?auto_2298808 ?auto_2298818 ) ) ( not ( = ?auto_2298808 ?auto_2298819 ) ) ( not ( = ?auto_2298808 ?auto_2298820 ) ) ( not ( = ?auto_2298808 ?auto_2298822 ) ) ( not ( = ?auto_2298809 ?auto_2298810 ) ) ( not ( = ?auto_2298809 ?auto_2298811 ) ) ( not ( = ?auto_2298809 ?auto_2298812 ) ) ( not ( = ?auto_2298809 ?auto_2298813 ) ) ( not ( = ?auto_2298809 ?auto_2298814 ) ) ( not ( = ?auto_2298809 ?auto_2298815 ) ) ( not ( = ?auto_2298809 ?auto_2298816 ) ) ( not ( = ?auto_2298809 ?auto_2298817 ) ) ( not ( = ?auto_2298809 ?auto_2298818 ) ) ( not ( = ?auto_2298809 ?auto_2298819 ) ) ( not ( = ?auto_2298809 ?auto_2298820 ) ) ( not ( = ?auto_2298809 ?auto_2298822 ) ) ( not ( = ?auto_2298810 ?auto_2298811 ) ) ( not ( = ?auto_2298810 ?auto_2298812 ) ) ( not ( = ?auto_2298810 ?auto_2298813 ) ) ( not ( = ?auto_2298810 ?auto_2298814 ) ) ( not ( = ?auto_2298810 ?auto_2298815 ) ) ( not ( = ?auto_2298810 ?auto_2298816 ) ) ( not ( = ?auto_2298810 ?auto_2298817 ) ) ( not ( = ?auto_2298810 ?auto_2298818 ) ) ( not ( = ?auto_2298810 ?auto_2298819 ) ) ( not ( = ?auto_2298810 ?auto_2298820 ) ) ( not ( = ?auto_2298810 ?auto_2298822 ) ) ( not ( = ?auto_2298811 ?auto_2298812 ) ) ( not ( = ?auto_2298811 ?auto_2298813 ) ) ( not ( = ?auto_2298811 ?auto_2298814 ) ) ( not ( = ?auto_2298811 ?auto_2298815 ) ) ( not ( = ?auto_2298811 ?auto_2298816 ) ) ( not ( = ?auto_2298811 ?auto_2298817 ) ) ( not ( = ?auto_2298811 ?auto_2298818 ) ) ( not ( = ?auto_2298811 ?auto_2298819 ) ) ( not ( = ?auto_2298811 ?auto_2298820 ) ) ( not ( = ?auto_2298811 ?auto_2298822 ) ) ( not ( = ?auto_2298812 ?auto_2298813 ) ) ( not ( = ?auto_2298812 ?auto_2298814 ) ) ( not ( = ?auto_2298812 ?auto_2298815 ) ) ( not ( = ?auto_2298812 ?auto_2298816 ) ) ( not ( = ?auto_2298812 ?auto_2298817 ) ) ( not ( = ?auto_2298812 ?auto_2298818 ) ) ( not ( = ?auto_2298812 ?auto_2298819 ) ) ( not ( = ?auto_2298812 ?auto_2298820 ) ) ( not ( = ?auto_2298812 ?auto_2298822 ) ) ( not ( = ?auto_2298813 ?auto_2298814 ) ) ( not ( = ?auto_2298813 ?auto_2298815 ) ) ( not ( = ?auto_2298813 ?auto_2298816 ) ) ( not ( = ?auto_2298813 ?auto_2298817 ) ) ( not ( = ?auto_2298813 ?auto_2298818 ) ) ( not ( = ?auto_2298813 ?auto_2298819 ) ) ( not ( = ?auto_2298813 ?auto_2298820 ) ) ( not ( = ?auto_2298813 ?auto_2298822 ) ) ( not ( = ?auto_2298814 ?auto_2298815 ) ) ( not ( = ?auto_2298814 ?auto_2298816 ) ) ( not ( = ?auto_2298814 ?auto_2298817 ) ) ( not ( = ?auto_2298814 ?auto_2298818 ) ) ( not ( = ?auto_2298814 ?auto_2298819 ) ) ( not ( = ?auto_2298814 ?auto_2298820 ) ) ( not ( = ?auto_2298814 ?auto_2298822 ) ) ( not ( = ?auto_2298815 ?auto_2298816 ) ) ( not ( = ?auto_2298815 ?auto_2298817 ) ) ( not ( = ?auto_2298815 ?auto_2298818 ) ) ( not ( = ?auto_2298815 ?auto_2298819 ) ) ( not ( = ?auto_2298815 ?auto_2298820 ) ) ( not ( = ?auto_2298815 ?auto_2298822 ) ) ( not ( = ?auto_2298816 ?auto_2298817 ) ) ( not ( = ?auto_2298816 ?auto_2298818 ) ) ( not ( = ?auto_2298816 ?auto_2298819 ) ) ( not ( = ?auto_2298816 ?auto_2298820 ) ) ( not ( = ?auto_2298816 ?auto_2298822 ) ) ( not ( = ?auto_2298817 ?auto_2298818 ) ) ( not ( = ?auto_2298817 ?auto_2298819 ) ) ( not ( = ?auto_2298817 ?auto_2298820 ) ) ( not ( = ?auto_2298817 ?auto_2298822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2298818 ?auto_2298819 ?auto_2298820 )
      ( MAKE-12CRATE-VERIFY ?auto_2298808 ?auto_2298809 ?auto_2298810 ?auto_2298811 ?auto_2298812 ?auto_2298813 ?auto_2298814 ?auto_2298815 ?auto_2298816 ?auto_2298817 ?auto_2298818 ?auto_2298819 ?auto_2298820 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298971 - SURFACE
      ?auto_2298972 - SURFACE
      ?auto_2298973 - SURFACE
      ?auto_2298974 - SURFACE
      ?auto_2298975 - SURFACE
      ?auto_2298976 - SURFACE
      ?auto_2298977 - SURFACE
      ?auto_2298978 - SURFACE
      ?auto_2298979 - SURFACE
      ?auto_2298980 - SURFACE
      ?auto_2298981 - SURFACE
      ?auto_2298982 - SURFACE
      ?auto_2298983 - SURFACE
    )
    :vars
    (
      ?auto_2298989 - HOIST
      ?auto_2298988 - PLACE
      ?auto_2298984 - PLACE
      ?auto_2298985 - HOIST
      ?auto_2298987 - SURFACE
      ?auto_2298986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298989 ?auto_2298988 ) ( SURFACE-AT ?auto_2298982 ?auto_2298988 ) ( CLEAR ?auto_2298982 ) ( IS-CRATE ?auto_2298983 ) ( not ( = ?auto_2298982 ?auto_2298983 ) ) ( AVAILABLE ?auto_2298989 ) ( ON ?auto_2298982 ?auto_2298981 ) ( not ( = ?auto_2298981 ?auto_2298982 ) ) ( not ( = ?auto_2298981 ?auto_2298983 ) ) ( not ( = ?auto_2298984 ?auto_2298988 ) ) ( HOIST-AT ?auto_2298985 ?auto_2298984 ) ( not ( = ?auto_2298989 ?auto_2298985 ) ) ( AVAILABLE ?auto_2298985 ) ( SURFACE-AT ?auto_2298983 ?auto_2298984 ) ( ON ?auto_2298983 ?auto_2298987 ) ( CLEAR ?auto_2298983 ) ( not ( = ?auto_2298982 ?auto_2298987 ) ) ( not ( = ?auto_2298983 ?auto_2298987 ) ) ( not ( = ?auto_2298981 ?auto_2298987 ) ) ( TRUCK-AT ?auto_2298986 ?auto_2298988 ) ( ON ?auto_2298972 ?auto_2298971 ) ( ON ?auto_2298973 ?auto_2298972 ) ( ON ?auto_2298974 ?auto_2298973 ) ( ON ?auto_2298975 ?auto_2298974 ) ( ON ?auto_2298976 ?auto_2298975 ) ( ON ?auto_2298977 ?auto_2298976 ) ( ON ?auto_2298978 ?auto_2298977 ) ( ON ?auto_2298979 ?auto_2298978 ) ( ON ?auto_2298980 ?auto_2298979 ) ( ON ?auto_2298981 ?auto_2298980 ) ( not ( = ?auto_2298971 ?auto_2298972 ) ) ( not ( = ?auto_2298971 ?auto_2298973 ) ) ( not ( = ?auto_2298971 ?auto_2298974 ) ) ( not ( = ?auto_2298971 ?auto_2298975 ) ) ( not ( = ?auto_2298971 ?auto_2298976 ) ) ( not ( = ?auto_2298971 ?auto_2298977 ) ) ( not ( = ?auto_2298971 ?auto_2298978 ) ) ( not ( = ?auto_2298971 ?auto_2298979 ) ) ( not ( = ?auto_2298971 ?auto_2298980 ) ) ( not ( = ?auto_2298971 ?auto_2298981 ) ) ( not ( = ?auto_2298971 ?auto_2298982 ) ) ( not ( = ?auto_2298971 ?auto_2298983 ) ) ( not ( = ?auto_2298971 ?auto_2298987 ) ) ( not ( = ?auto_2298972 ?auto_2298973 ) ) ( not ( = ?auto_2298972 ?auto_2298974 ) ) ( not ( = ?auto_2298972 ?auto_2298975 ) ) ( not ( = ?auto_2298972 ?auto_2298976 ) ) ( not ( = ?auto_2298972 ?auto_2298977 ) ) ( not ( = ?auto_2298972 ?auto_2298978 ) ) ( not ( = ?auto_2298972 ?auto_2298979 ) ) ( not ( = ?auto_2298972 ?auto_2298980 ) ) ( not ( = ?auto_2298972 ?auto_2298981 ) ) ( not ( = ?auto_2298972 ?auto_2298982 ) ) ( not ( = ?auto_2298972 ?auto_2298983 ) ) ( not ( = ?auto_2298972 ?auto_2298987 ) ) ( not ( = ?auto_2298973 ?auto_2298974 ) ) ( not ( = ?auto_2298973 ?auto_2298975 ) ) ( not ( = ?auto_2298973 ?auto_2298976 ) ) ( not ( = ?auto_2298973 ?auto_2298977 ) ) ( not ( = ?auto_2298973 ?auto_2298978 ) ) ( not ( = ?auto_2298973 ?auto_2298979 ) ) ( not ( = ?auto_2298973 ?auto_2298980 ) ) ( not ( = ?auto_2298973 ?auto_2298981 ) ) ( not ( = ?auto_2298973 ?auto_2298982 ) ) ( not ( = ?auto_2298973 ?auto_2298983 ) ) ( not ( = ?auto_2298973 ?auto_2298987 ) ) ( not ( = ?auto_2298974 ?auto_2298975 ) ) ( not ( = ?auto_2298974 ?auto_2298976 ) ) ( not ( = ?auto_2298974 ?auto_2298977 ) ) ( not ( = ?auto_2298974 ?auto_2298978 ) ) ( not ( = ?auto_2298974 ?auto_2298979 ) ) ( not ( = ?auto_2298974 ?auto_2298980 ) ) ( not ( = ?auto_2298974 ?auto_2298981 ) ) ( not ( = ?auto_2298974 ?auto_2298982 ) ) ( not ( = ?auto_2298974 ?auto_2298983 ) ) ( not ( = ?auto_2298974 ?auto_2298987 ) ) ( not ( = ?auto_2298975 ?auto_2298976 ) ) ( not ( = ?auto_2298975 ?auto_2298977 ) ) ( not ( = ?auto_2298975 ?auto_2298978 ) ) ( not ( = ?auto_2298975 ?auto_2298979 ) ) ( not ( = ?auto_2298975 ?auto_2298980 ) ) ( not ( = ?auto_2298975 ?auto_2298981 ) ) ( not ( = ?auto_2298975 ?auto_2298982 ) ) ( not ( = ?auto_2298975 ?auto_2298983 ) ) ( not ( = ?auto_2298975 ?auto_2298987 ) ) ( not ( = ?auto_2298976 ?auto_2298977 ) ) ( not ( = ?auto_2298976 ?auto_2298978 ) ) ( not ( = ?auto_2298976 ?auto_2298979 ) ) ( not ( = ?auto_2298976 ?auto_2298980 ) ) ( not ( = ?auto_2298976 ?auto_2298981 ) ) ( not ( = ?auto_2298976 ?auto_2298982 ) ) ( not ( = ?auto_2298976 ?auto_2298983 ) ) ( not ( = ?auto_2298976 ?auto_2298987 ) ) ( not ( = ?auto_2298977 ?auto_2298978 ) ) ( not ( = ?auto_2298977 ?auto_2298979 ) ) ( not ( = ?auto_2298977 ?auto_2298980 ) ) ( not ( = ?auto_2298977 ?auto_2298981 ) ) ( not ( = ?auto_2298977 ?auto_2298982 ) ) ( not ( = ?auto_2298977 ?auto_2298983 ) ) ( not ( = ?auto_2298977 ?auto_2298987 ) ) ( not ( = ?auto_2298978 ?auto_2298979 ) ) ( not ( = ?auto_2298978 ?auto_2298980 ) ) ( not ( = ?auto_2298978 ?auto_2298981 ) ) ( not ( = ?auto_2298978 ?auto_2298982 ) ) ( not ( = ?auto_2298978 ?auto_2298983 ) ) ( not ( = ?auto_2298978 ?auto_2298987 ) ) ( not ( = ?auto_2298979 ?auto_2298980 ) ) ( not ( = ?auto_2298979 ?auto_2298981 ) ) ( not ( = ?auto_2298979 ?auto_2298982 ) ) ( not ( = ?auto_2298979 ?auto_2298983 ) ) ( not ( = ?auto_2298979 ?auto_2298987 ) ) ( not ( = ?auto_2298980 ?auto_2298981 ) ) ( not ( = ?auto_2298980 ?auto_2298982 ) ) ( not ( = ?auto_2298980 ?auto_2298983 ) ) ( not ( = ?auto_2298980 ?auto_2298987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2298981 ?auto_2298982 ?auto_2298983 )
      ( MAKE-12CRATE-VERIFY ?auto_2298971 ?auto_2298972 ?auto_2298973 ?auto_2298974 ?auto_2298975 ?auto_2298976 ?auto_2298977 ?auto_2298978 ?auto_2298979 ?auto_2298980 ?auto_2298981 ?auto_2298982 ?auto_2298983 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299134 - SURFACE
      ?auto_2299135 - SURFACE
      ?auto_2299136 - SURFACE
      ?auto_2299137 - SURFACE
      ?auto_2299138 - SURFACE
      ?auto_2299139 - SURFACE
      ?auto_2299140 - SURFACE
      ?auto_2299141 - SURFACE
      ?auto_2299142 - SURFACE
      ?auto_2299143 - SURFACE
      ?auto_2299144 - SURFACE
      ?auto_2299145 - SURFACE
      ?auto_2299146 - SURFACE
    )
    :vars
    (
      ?auto_2299148 - HOIST
      ?auto_2299147 - PLACE
      ?auto_2299151 - PLACE
      ?auto_2299149 - HOIST
      ?auto_2299152 - SURFACE
      ?auto_2299150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299148 ?auto_2299147 ) ( IS-CRATE ?auto_2299146 ) ( not ( = ?auto_2299145 ?auto_2299146 ) ) ( not ( = ?auto_2299144 ?auto_2299145 ) ) ( not ( = ?auto_2299144 ?auto_2299146 ) ) ( not ( = ?auto_2299151 ?auto_2299147 ) ) ( HOIST-AT ?auto_2299149 ?auto_2299151 ) ( not ( = ?auto_2299148 ?auto_2299149 ) ) ( AVAILABLE ?auto_2299149 ) ( SURFACE-AT ?auto_2299146 ?auto_2299151 ) ( ON ?auto_2299146 ?auto_2299152 ) ( CLEAR ?auto_2299146 ) ( not ( = ?auto_2299145 ?auto_2299152 ) ) ( not ( = ?auto_2299146 ?auto_2299152 ) ) ( not ( = ?auto_2299144 ?auto_2299152 ) ) ( TRUCK-AT ?auto_2299150 ?auto_2299147 ) ( SURFACE-AT ?auto_2299144 ?auto_2299147 ) ( CLEAR ?auto_2299144 ) ( LIFTING ?auto_2299148 ?auto_2299145 ) ( IS-CRATE ?auto_2299145 ) ( ON ?auto_2299135 ?auto_2299134 ) ( ON ?auto_2299136 ?auto_2299135 ) ( ON ?auto_2299137 ?auto_2299136 ) ( ON ?auto_2299138 ?auto_2299137 ) ( ON ?auto_2299139 ?auto_2299138 ) ( ON ?auto_2299140 ?auto_2299139 ) ( ON ?auto_2299141 ?auto_2299140 ) ( ON ?auto_2299142 ?auto_2299141 ) ( ON ?auto_2299143 ?auto_2299142 ) ( ON ?auto_2299144 ?auto_2299143 ) ( not ( = ?auto_2299134 ?auto_2299135 ) ) ( not ( = ?auto_2299134 ?auto_2299136 ) ) ( not ( = ?auto_2299134 ?auto_2299137 ) ) ( not ( = ?auto_2299134 ?auto_2299138 ) ) ( not ( = ?auto_2299134 ?auto_2299139 ) ) ( not ( = ?auto_2299134 ?auto_2299140 ) ) ( not ( = ?auto_2299134 ?auto_2299141 ) ) ( not ( = ?auto_2299134 ?auto_2299142 ) ) ( not ( = ?auto_2299134 ?auto_2299143 ) ) ( not ( = ?auto_2299134 ?auto_2299144 ) ) ( not ( = ?auto_2299134 ?auto_2299145 ) ) ( not ( = ?auto_2299134 ?auto_2299146 ) ) ( not ( = ?auto_2299134 ?auto_2299152 ) ) ( not ( = ?auto_2299135 ?auto_2299136 ) ) ( not ( = ?auto_2299135 ?auto_2299137 ) ) ( not ( = ?auto_2299135 ?auto_2299138 ) ) ( not ( = ?auto_2299135 ?auto_2299139 ) ) ( not ( = ?auto_2299135 ?auto_2299140 ) ) ( not ( = ?auto_2299135 ?auto_2299141 ) ) ( not ( = ?auto_2299135 ?auto_2299142 ) ) ( not ( = ?auto_2299135 ?auto_2299143 ) ) ( not ( = ?auto_2299135 ?auto_2299144 ) ) ( not ( = ?auto_2299135 ?auto_2299145 ) ) ( not ( = ?auto_2299135 ?auto_2299146 ) ) ( not ( = ?auto_2299135 ?auto_2299152 ) ) ( not ( = ?auto_2299136 ?auto_2299137 ) ) ( not ( = ?auto_2299136 ?auto_2299138 ) ) ( not ( = ?auto_2299136 ?auto_2299139 ) ) ( not ( = ?auto_2299136 ?auto_2299140 ) ) ( not ( = ?auto_2299136 ?auto_2299141 ) ) ( not ( = ?auto_2299136 ?auto_2299142 ) ) ( not ( = ?auto_2299136 ?auto_2299143 ) ) ( not ( = ?auto_2299136 ?auto_2299144 ) ) ( not ( = ?auto_2299136 ?auto_2299145 ) ) ( not ( = ?auto_2299136 ?auto_2299146 ) ) ( not ( = ?auto_2299136 ?auto_2299152 ) ) ( not ( = ?auto_2299137 ?auto_2299138 ) ) ( not ( = ?auto_2299137 ?auto_2299139 ) ) ( not ( = ?auto_2299137 ?auto_2299140 ) ) ( not ( = ?auto_2299137 ?auto_2299141 ) ) ( not ( = ?auto_2299137 ?auto_2299142 ) ) ( not ( = ?auto_2299137 ?auto_2299143 ) ) ( not ( = ?auto_2299137 ?auto_2299144 ) ) ( not ( = ?auto_2299137 ?auto_2299145 ) ) ( not ( = ?auto_2299137 ?auto_2299146 ) ) ( not ( = ?auto_2299137 ?auto_2299152 ) ) ( not ( = ?auto_2299138 ?auto_2299139 ) ) ( not ( = ?auto_2299138 ?auto_2299140 ) ) ( not ( = ?auto_2299138 ?auto_2299141 ) ) ( not ( = ?auto_2299138 ?auto_2299142 ) ) ( not ( = ?auto_2299138 ?auto_2299143 ) ) ( not ( = ?auto_2299138 ?auto_2299144 ) ) ( not ( = ?auto_2299138 ?auto_2299145 ) ) ( not ( = ?auto_2299138 ?auto_2299146 ) ) ( not ( = ?auto_2299138 ?auto_2299152 ) ) ( not ( = ?auto_2299139 ?auto_2299140 ) ) ( not ( = ?auto_2299139 ?auto_2299141 ) ) ( not ( = ?auto_2299139 ?auto_2299142 ) ) ( not ( = ?auto_2299139 ?auto_2299143 ) ) ( not ( = ?auto_2299139 ?auto_2299144 ) ) ( not ( = ?auto_2299139 ?auto_2299145 ) ) ( not ( = ?auto_2299139 ?auto_2299146 ) ) ( not ( = ?auto_2299139 ?auto_2299152 ) ) ( not ( = ?auto_2299140 ?auto_2299141 ) ) ( not ( = ?auto_2299140 ?auto_2299142 ) ) ( not ( = ?auto_2299140 ?auto_2299143 ) ) ( not ( = ?auto_2299140 ?auto_2299144 ) ) ( not ( = ?auto_2299140 ?auto_2299145 ) ) ( not ( = ?auto_2299140 ?auto_2299146 ) ) ( not ( = ?auto_2299140 ?auto_2299152 ) ) ( not ( = ?auto_2299141 ?auto_2299142 ) ) ( not ( = ?auto_2299141 ?auto_2299143 ) ) ( not ( = ?auto_2299141 ?auto_2299144 ) ) ( not ( = ?auto_2299141 ?auto_2299145 ) ) ( not ( = ?auto_2299141 ?auto_2299146 ) ) ( not ( = ?auto_2299141 ?auto_2299152 ) ) ( not ( = ?auto_2299142 ?auto_2299143 ) ) ( not ( = ?auto_2299142 ?auto_2299144 ) ) ( not ( = ?auto_2299142 ?auto_2299145 ) ) ( not ( = ?auto_2299142 ?auto_2299146 ) ) ( not ( = ?auto_2299142 ?auto_2299152 ) ) ( not ( = ?auto_2299143 ?auto_2299144 ) ) ( not ( = ?auto_2299143 ?auto_2299145 ) ) ( not ( = ?auto_2299143 ?auto_2299146 ) ) ( not ( = ?auto_2299143 ?auto_2299152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299144 ?auto_2299145 ?auto_2299146 )
      ( MAKE-12CRATE-VERIFY ?auto_2299134 ?auto_2299135 ?auto_2299136 ?auto_2299137 ?auto_2299138 ?auto_2299139 ?auto_2299140 ?auto_2299141 ?auto_2299142 ?auto_2299143 ?auto_2299144 ?auto_2299145 ?auto_2299146 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299297 - SURFACE
      ?auto_2299298 - SURFACE
      ?auto_2299299 - SURFACE
      ?auto_2299300 - SURFACE
      ?auto_2299301 - SURFACE
      ?auto_2299302 - SURFACE
      ?auto_2299303 - SURFACE
      ?auto_2299304 - SURFACE
      ?auto_2299305 - SURFACE
      ?auto_2299306 - SURFACE
      ?auto_2299307 - SURFACE
      ?auto_2299308 - SURFACE
      ?auto_2299309 - SURFACE
    )
    :vars
    (
      ?auto_2299313 - HOIST
      ?auto_2299312 - PLACE
      ?auto_2299311 - PLACE
      ?auto_2299310 - HOIST
      ?auto_2299314 - SURFACE
      ?auto_2299315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299313 ?auto_2299312 ) ( IS-CRATE ?auto_2299309 ) ( not ( = ?auto_2299308 ?auto_2299309 ) ) ( not ( = ?auto_2299307 ?auto_2299308 ) ) ( not ( = ?auto_2299307 ?auto_2299309 ) ) ( not ( = ?auto_2299311 ?auto_2299312 ) ) ( HOIST-AT ?auto_2299310 ?auto_2299311 ) ( not ( = ?auto_2299313 ?auto_2299310 ) ) ( AVAILABLE ?auto_2299310 ) ( SURFACE-AT ?auto_2299309 ?auto_2299311 ) ( ON ?auto_2299309 ?auto_2299314 ) ( CLEAR ?auto_2299309 ) ( not ( = ?auto_2299308 ?auto_2299314 ) ) ( not ( = ?auto_2299309 ?auto_2299314 ) ) ( not ( = ?auto_2299307 ?auto_2299314 ) ) ( TRUCK-AT ?auto_2299315 ?auto_2299312 ) ( SURFACE-AT ?auto_2299307 ?auto_2299312 ) ( CLEAR ?auto_2299307 ) ( IS-CRATE ?auto_2299308 ) ( AVAILABLE ?auto_2299313 ) ( IN ?auto_2299308 ?auto_2299315 ) ( ON ?auto_2299298 ?auto_2299297 ) ( ON ?auto_2299299 ?auto_2299298 ) ( ON ?auto_2299300 ?auto_2299299 ) ( ON ?auto_2299301 ?auto_2299300 ) ( ON ?auto_2299302 ?auto_2299301 ) ( ON ?auto_2299303 ?auto_2299302 ) ( ON ?auto_2299304 ?auto_2299303 ) ( ON ?auto_2299305 ?auto_2299304 ) ( ON ?auto_2299306 ?auto_2299305 ) ( ON ?auto_2299307 ?auto_2299306 ) ( not ( = ?auto_2299297 ?auto_2299298 ) ) ( not ( = ?auto_2299297 ?auto_2299299 ) ) ( not ( = ?auto_2299297 ?auto_2299300 ) ) ( not ( = ?auto_2299297 ?auto_2299301 ) ) ( not ( = ?auto_2299297 ?auto_2299302 ) ) ( not ( = ?auto_2299297 ?auto_2299303 ) ) ( not ( = ?auto_2299297 ?auto_2299304 ) ) ( not ( = ?auto_2299297 ?auto_2299305 ) ) ( not ( = ?auto_2299297 ?auto_2299306 ) ) ( not ( = ?auto_2299297 ?auto_2299307 ) ) ( not ( = ?auto_2299297 ?auto_2299308 ) ) ( not ( = ?auto_2299297 ?auto_2299309 ) ) ( not ( = ?auto_2299297 ?auto_2299314 ) ) ( not ( = ?auto_2299298 ?auto_2299299 ) ) ( not ( = ?auto_2299298 ?auto_2299300 ) ) ( not ( = ?auto_2299298 ?auto_2299301 ) ) ( not ( = ?auto_2299298 ?auto_2299302 ) ) ( not ( = ?auto_2299298 ?auto_2299303 ) ) ( not ( = ?auto_2299298 ?auto_2299304 ) ) ( not ( = ?auto_2299298 ?auto_2299305 ) ) ( not ( = ?auto_2299298 ?auto_2299306 ) ) ( not ( = ?auto_2299298 ?auto_2299307 ) ) ( not ( = ?auto_2299298 ?auto_2299308 ) ) ( not ( = ?auto_2299298 ?auto_2299309 ) ) ( not ( = ?auto_2299298 ?auto_2299314 ) ) ( not ( = ?auto_2299299 ?auto_2299300 ) ) ( not ( = ?auto_2299299 ?auto_2299301 ) ) ( not ( = ?auto_2299299 ?auto_2299302 ) ) ( not ( = ?auto_2299299 ?auto_2299303 ) ) ( not ( = ?auto_2299299 ?auto_2299304 ) ) ( not ( = ?auto_2299299 ?auto_2299305 ) ) ( not ( = ?auto_2299299 ?auto_2299306 ) ) ( not ( = ?auto_2299299 ?auto_2299307 ) ) ( not ( = ?auto_2299299 ?auto_2299308 ) ) ( not ( = ?auto_2299299 ?auto_2299309 ) ) ( not ( = ?auto_2299299 ?auto_2299314 ) ) ( not ( = ?auto_2299300 ?auto_2299301 ) ) ( not ( = ?auto_2299300 ?auto_2299302 ) ) ( not ( = ?auto_2299300 ?auto_2299303 ) ) ( not ( = ?auto_2299300 ?auto_2299304 ) ) ( not ( = ?auto_2299300 ?auto_2299305 ) ) ( not ( = ?auto_2299300 ?auto_2299306 ) ) ( not ( = ?auto_2299300 ?auto_2299307 ) ) ( not ( = ?auto_2299300 ?auto_2299308 ) ) ( not ( = ?auto_2299300 ?auto_2299309 ) ) ( not ( = ?auto_2299300 ?auto_2299314 ) ) ( not ( = ?auto_2299301 ?auto_2299302 ) ) ( not ( = ?auto_2299301 ?auto_2299303 ) ) ( not ( = ?auto_2299301 ?auto_2299304 ) ) ( not ( = ?auto_2299301 ?auto_2299305 ) ) ( not ( = ?auto_2299301 ?auto_2299306 ) ) ( not ( = ?auto_2299301 ?auto_2299307 ) ) ( not ( = ?auto_2299301 ?auto_2299308 ) ) ( not ( = ?auto_2299301 ?auto_2299309 ) ) ( not ( = ?auto_2299301 ?auto_2299314 ) ) ( not ( = ?auto_2299302 ?auto_2299303 ) ) ( not ( = ?auto_2299302 ?auto_2299304 ) ) ( not ( = ?auto_2299302 ?auto_2299305 ) ) ( not ( = ?auto_2299302 ?auto_2299306 ) ) ( not ( = ?auto_2299302 ?auto_2299307 ) ) ( not ( = ?auto_2299302 ?auto_2299308 ) ) ( not ( = ?auto_2299302 ?auto_2299309 ) ) ( not ( = ?auto_2299302 ?auto_2299314 ) ) ( not ( = ?auto_2299303 ?auto_2299304 ) ) ( not ( = ?auto_2299303 ?auto_2299305 ) ) ( not ( = ?auto_2299303 ?auto_2299306 ) ) ( not ( = ?auto_2299303 ?auto_2299307 ) ) ( not ( = ?auto_2299303 ?auto_2299308 ) ) ( not ( = ?auto_2299303 ?auto_2299309 ) ) ( not ( = ?auto_2299303 ?auto_2299314 ) ) ( not ( = ?auto_2299304 ?auto_2299305 ) ) ( not ( = ?auto_2299304 ?auto_2299306 ) ) ( not ( = ?auto_2299304 ?auto_2299307 ) ) ( not ( = ?auto_2299304 ?auto_2299308 ) ) ( not ( = ?auto_2299304 ?auto_2299309 ) ) ( not ( = ?auto_2299304 ?auto_2299314 ) ) ( not ( = ?auto_2299305 ?auto_2299306 ) ) ( not ( = ?auto_2299305 ?auto_2299307 ) ) ( not ( = ?auto_2299305 ?auto_2299308 ) ) ( not ( = ?auto_2299305 ?auto_2299309 ) ) ( not ( = ?auto_2299305 ?auto_2299314 ) ) ( not ( = ?auto_2299306 ?auto_2299307 ) ) ( not ( = ?auto_2299306 ?auto_2299308 ) ) ( not ( = ?auto_2299306 ?auto_2299309 ) ) ( not ( = ?auto_2299306 ?auto_2299314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299307 ?auto_2299308 ?auto_2299309 )
      ( MAKE-12CRATE-VERIFY ?auto_2299297 ?auto_2299298 ?auto_2299299 ?auto_2299300 ?auto_2299301 ?auto_2299302 ?auto_2299303 ?auto_2299304 ?auto_2299305 ?auto_2299306 ?auto_2299307 ?auto_2299308 ?auto_2299309 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2310876 - SURFACE
      ?auto_2310877 - SURFACE
      ?auto_2310878 - SURFACE
      ?auto_2310879 - SURFACE
      ?auto_2310880 - SURFACE
      ?auto_2310881 - SURFACE
      ?auto_2310882 - SURFACE
      ?auto_2310883 - SURFACE
      ?auto_2310884 - SURFACE
      ?auto_2310885 - SURFACE
      ?auto_2310886 - SURFACE
      ?auto_2310887 - SURFACE
      ?auto_2310888 - SURFACE
      ?auto_2310889 - SURFACE
    )
    :vars
    (
      ?auto_2310890 - HOIST
      ?auto_2310891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2310890 ?auto_2310891 ) ( SURFACE-AT ?auto_2310888 ?auto_2310891 ) ( CLEAR ?auto_2310888 ) ( LIFTING ?auto_2310890 ?auto_2310889 ) ( IS-CRATE ?auto_2310889 ) ( not ( = ?auto_2310888 ?auto_2310889 ) ) ( ON ?auto_2310877 ?auto_2310876 ) ( ON ?auto_2310878 ?auto_2310877 ) ( ON ?auto_2310879 ?auto_2310878 ) ( ON ?auto_2310880 ?auto_2310879 ) ( ON ?auto_2310881 ?auto_2310880 ) ( ON ?auto_2310882 ?auto_2310881 ) ( ON ?auto_2310883 ?auto_2310882 ) ( ON ?auto_2310884 ?auto_2310883 ) ( ON ?auto_2310885 ?auto_2310884 ) ( ON ?auto_2310886 ?auto_2310885 ) ( ON ?auto_2310887 ?auto_2310886 ) ( ON ?auto_2310888 ?auto_2310887 ) ( not ( = ?auto_2310876 ?auto_2310877 ) ) ( not ( = ?auto_2310876 ?auto_2310878 ) ) ( not ( = ?auto_2310876 ?auto_2310879 ) ) ( not ( = ?auto_2310876 ?auto_2310880 ) ) ( not ( = ?auto_2310876 ?auto_2310881 ) ) ( not ( = ?auto_2310876 ?auto_2310882 ) ) ( not ( = ?auto_2310876 ?auto_2310883 ) ) ( not ( = ?auto_2310876 ?auto_2310884 ) ) ( not ( = ?auto_2310876 ?auto_2310885 ) ) ( not ( = ?auto_2310876 ?auto_2310886 ) ) ( not ( = ?auto_2310876 ?auto_2310887 ) ) ( not ( = ?auto_2310876 ?auto_2310888 ) ) ( not ( = ?auto_2310876 ?auto_2310889 ) ) ( not ( = ?auto_2310877 ?auto_2310878 ) ) ( not ( = ?auto_2310877 ?auto_2310879 ) ) ( not ( = ?auto_2310877 ?auto_2310880 ) ) ( not ( = ?auto_2310877 ?auto_2310881 ) ) ( not ( = ?auto_2310877 ?auto_2310882 ) ) ( not ( = ?auto_2310877 ?auto_2310883 ) ) ( not ( = ?auto_2310877 ?auto_2310884 ) ) ( not ( = ?auto_2310877 ?auto_2310885 ) ) ( not ( = ?auto_2310877 ?auto_2310886 ) ) ( not ( = ?auto_2310877 ?auto_2310887 ) ) ( not ( = ?auto_2310877 ?auto_2310888 ) ) ( not ( = ?auto_2310877 ?auto_2310889 ) ) ( not ( = ?auto_2310878 ?auto_2310879 ) ) ( not ( = ?auto_2310878 ?auto_2310880 ) ) ( not ( = ?auto_2310878 ?auto_2310881 ) ) ( not ( = ?auto_2310878 ?auto_2310882 ) ) ( not ( = ?auto_2310878 ?auto_2310883 ) ) ( not ( = ?auto_2310878 ?auto_2310884 ) ) ( not ( = ?auto_2310878 ?auto_2310885 ) ) ( not ( = ?auto_2310878 ?auto_2310886 ) ) ( not ( = ?auto_2310878 ?auto_2310887 ) ) ( not ( = ?auto_2310878 ?auto_2310888 ) ) ( not ( = ?auto_2310878 ?auto_2310889 ) ) ( not ( = ?auto_2310879 ?auto_2310880 ) ) ( not ( = ?auto_2310879 ?auto_2310881 ) ) ( not ( = ?auto_2310879 ?auto_2310882 ) ) ( not ( = ?auto_2310879 ?auto_2310883 ) ) ( not ( = ?auto_2310879 ?auto_2310884 ) ) ( not ( = ?auto_2310879 ?auto_2310885 ) ) ( not ( = ?auto_2310879 ?auto_2310886 ) ) ( not ( = ?auto_2310879 ?auto_2310887 ) ) ( not ( = ?auto_2310879 ?auto_2310888 ) ) ( not ( = ?auto_2310879 ?auto_2310889 ) ) ( not ( = ?auto_2310880 ?auto_2310881 ) ) ( not ( = ?auto_2310880 ?auto_2310882 ) ) ( not ( = ?auto_2310880 ?auto_2310883 ) ) ( not ( = ?auto_2310880 ?auto_2310884 ) ) ( not ( = ?auto_2310880 ?auto_2310885 ) ) ( not ( = ?auto_2310880 ?auto_2310886 ) ) ( not ( = ?auto_2310880 ?auto_2310887 ) ) ( not ( = ?auto_2310880 ?auto_2310888 ) ) ( not ( = ?auto_2310880 ?auto_2310889 ) ) ( not ( = ?auto_2310881 ?auto_2310882 ) ) ( not ( = ?auto_2310881 ?auto_2310883 ) ) ( not ( = ?auto_2310881 ?auto_2310884 ) ) ( not ( = ?auto_2310881 ?auto_2310885 ) ) ( not ( = ?auto_2310881 ?auto_2310886 ) ) ( not ( = ?auto_2310881 ?auto_2310887 ) ) ( not ( = ?auto_2310881 ?auto_2310888 ) ) ( not ( = ?auto_2310881 ?auto_2310889 ) ) ( not ( = ?auto_2310882 ?auto_2310883 ) ) ( not ( = ?auto_2310882 ?auto_2310884 ) ) ( not ( = ?auto_2310882 ?auto_2310885 ) ) ( not ( = ?auto_2310882 ?auto_2310886 ) ) ( not ( = ?auto_2310882 ?auto_2310887 ) ) ( not ( = ?auto_2310882 ?auto_2310888 ) ) ( not ( = ?auto_2310882 ?auto_2310889 ) ) ( not ( = ?auto_2310883 ?auto_2310884 ) ) ( not ( = ?auto_2310883 ?auto_2310885 ) ) ( not ( = ?auto_2310883 ?auto_2310886 ) ) ( not ( = ?auto_2310883 ?auto_2310887 ) ) ( not ( = ?auto_2310883 ?auto_2310888 ) ) ( not ( = ?auto_2310883 ?auto_2310889 ) ) ( not ( = ?auto_2310884 ?auto_2310885 ) ) ( not ( = ?auto_2310884 ?auto_2310886 ) ) ( not ( = ?auto_2310884 ?auto_2310887 ) ) ( not ( = ?auto_2310884 ?auto_2310888 ) ) ( not ( = ?auto_2310884 ?auto_2310889 ) ) ( not ( = ?auto_2310885 ?auto_2310886 ) ) ( not ( = ?auto_2310885 ?auto_2310887 ) ) ( not ( = ?auto_2310885 ?auto_2310888 ) ) ( not ( = ?auto_2310885 ?auto_2310889 ) ) ( not ( = ?auto_2310886 ?auto_2310887 ) ) ( not ( = ?auto_2310886 ?auto_2310888 ) ) ( not ( = ?auto_2310886 ?auto_2310889 ) ) ( not ( = ?auto_2310887 ?auto_2310888 ) ) ( not ( = ?auto_2310887 ?auto_2310889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2310888 ?auto_2310889 )
      ( MAKE-13CRATE-VERIFY ?auto_2310876 ?auto_2310877 ?auto_2310878 ?auto_2310879 ?auto_2310880 ?auto_2310881 ?auto_2310882 ?auto_2310883 ?auto_2310884 ?auto_2310885 ?auto_2310886 ?auto_2310887 ?auto_2310888 ?auto_2310889 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311018 - SURFACE
      ?auto_2311019 - SURFACE
      ?auto_2311020 - SURFACE
      ?auto_2311021 - SURFACE
      ?auto_2311022 - SURFACE
      ?auto_2311023 - SURFACE
      ?auto_2311024 - SURFACE
      ?auto_2311025 - SURFACE
      ?auto_2311026 - SURFACE
      ?auto_2311027 - SURFACE
      ?auto_2311028 - SURFACE
      ?auto_2311029 - SURFACE
      ?auto_2311030 - SURFACE
      ?auto_2311031 - SURFACE
    )
    :vars
    (
      ?auto_2311033 - HOIST
      ?auto_2311034 - PLACE
      ?auto_2311032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311033 ?auto_2311034 ) ( SURFACE-AT ?auto_2311030 ?auto_2311034 ) ( CLEAR ?auto_2311030 ) ( IS-CRATE ?auto_2311031 ) ( not ( = ?auto_2311030 ?auto_2311031 ) ) ( TRUCK-AT ?auto_2311032 ?auto_2311034 ) ( AVAILABLE ?auto_2311033 ) ( IN ?auto_2311031 ?auto_2311032 ) ( ON ?auto_2311030 ?auto_2311029 ) ( not ( = ?auto_2311029 ?auto_2311030 ) ) ( not ( = ?auto_2311029 ?auto_2311031 ) ) ( ON ?auto_2311019 ?auto_2311018 ) ( ON ?auto_2311020 ?auto_2311019 ) ( ON ?auto_2311021 ?auto_2311020 ) ( ON ?auto_2311022 ?auto_2311021 ) ( ON ?auto_2311023 ?auto_2311022 ) ( ON ?auto_2311024 ?auto_2311023 ) ( ON ?auto_2311025 ?auto_2311024 ) ( ON ?auto_2311026 ?auto_2311025 ) ( ON ?auto_2311027 ?auto_2311026 ) ( ON ?auto_2311028 ?auto_2311027 ) ( ON ?auto_2311029 ?auto_2311028 ) ( not ( = ?auto_2311018 ?auto_2311019 ) ) ( not ( = ?auto_2311018 ?auto_2311020 ) ) ( not ( = ?auto_2311018 ?auto_2311021 ) ) ( not ( = ?auto_2311018 ?auto_2311022 ) ) ( not ( = ?auto_2311018 ?auto_2311023 ) ) ( not ( = ?auto_2311018 ?auto_2311024 ) ) ( not ( = ?auto_2311018 ?auto_2311025 ) ) ( not ( = ?auto_2311018 ?auto_2311026 ) ) ( not ( = ?auto_2311018 ?auto_2311027 ) ) ( not ( = ?auto_2311018 ?auto_2311028 ) ) ( not ( = ?auto_2311018 ?auto_2311029 ) ) ( not ( = ?auto_2311018 ?auto_2311030 ) ) ( not ( = ?auto_2311018 ?auto_2311031 ) ) ( not ( = ?auto_2311019 ?auto_2311020 ) ) ( not ( = ?auto_2311019 ?auto_2311021 ) ) ( not ( = ?auto_2311019 ?auto_2311022 ) ) ( not ( = ?auto_2311019 ?auto_2311023 ) ) ( not ( = ?auto_2311019 ?auto_2311024 ) ) ( not ( = ?auto_2311019 ?auto_2311025 ) ) ( not ( = ?auto_2311019 ?auto_2311026 ) ) ( not ( = ?auto_2311019 ?auto_2311027 ) ) ( not ( = ?auto_2311019 ?auto_2311028 ) ) ( not ( = ?auto_2311019 ?auto_2311029 ) ) ( not ( = ?auto_2311019 ?auto_2311030 ) ) ( not ( = ?auto_2311019 ?auto_2311031 ) ) ( not ( = ?auto_2311020 ?auto_2311021 ) ) ( not ( = ?auto_2311020 ?auto_2311022 ) ) ( not ( = ?auto_2311020 ?auto_2311023 ) ) ( not ( = ?auto_2311020 ?auto_2311024 ) ) ( not ( = ?auto_2311020 ?auto_2311025 ) ) ( not ( = ?auto_2311020 ?auto_2311026 ) ) ( not ( = ?auto_2311020 ?auto_2311027 ) ) ( not ( = ?auto_2311020 ?auto_2311028 ) ) ( not ( = ?auto_2311020 ?auto_2311029 ) ) ( not ( = ?auto_2311020 ?auto_2311030 ) ) ( not ( = ?auto_2311020 ?auto_2311031 ) ) ( not ( = ?auto_2311021 ?auto_2311022 ) ) ( not ( = ?auto_2311021 ?auto_2311023 ) ) ( not ( = ?auto_2311021 ?auto_2311024 ) ) ( not ( = ?auto_2311021 ?auto_2311025 ) ) ( not ( = ?auto_2311021 ?auto_2311026 ) ) ( not ( = ?auto_2311021 ?auto_2311027 ) ) ( not ( = ?auto_2311021 ?auto_2311028 ) ) ( not ( = ?auto_2311021 ?auto_2311029 ) ) ( not ( = ?auto_2311021 ?auto_2311030 ) ) ( not ( = ?auto_2311021 ?auto_2311031 ) ) ( not ( = ?auto_2311022 ?auto_2311023 ) ) ( not ( = ?auto_2311022 ?auto_2311024 ) ) ( not ( = ?auto_2311022 ?auto_2311025 ) ) ( not ( = ?auto_2311022 ?auto_2311026 ) ) ( not ( = ?auto_2311022 ?auto_2311027 ) ) ( not ( = ?auto_2311022 ?auto_2311028 ) ) ( not ( = ?auto_2311022 ?auto_2311029 ) ) ( not ( = ?auto_2311022 ?auto_2311030 ) ) ( not ( = ?auto_2311022 ?auto_2311031 ) ) ( not ( = ?auto_2311023 ?auto_2311024 ) ) ( not ( = ?auto_2311023 ?auto_2311025 ) ) ( not ( = ?auto_2311023 ?auto_2311026 ) ) ( not ( = ?auto_2311023 ?auto_2311027 ) ) ( not ( = ?auto_2311023 ?auto_2311028 ) ) ( not ( = ?auto_2311023 ?auto_2311029 ) ) ( not ( = ?auto_2311023 ?auto_2311030 ) ) ( not ( = ?auto_2311023 ?auto_2311031 ) ) ( not ( = ?auto_2311024 ?auto_2311025 ) ) ( not ( = ?auto_2311024 ?auto_2311026 ) ) ( not ( = ?auto_2311024 ?auto_2311027 ) ) ( not ( = ?auto_2311024 ?auto_2311028 ) ) ( not ( = ?auto_2311024 ?auto_2311029 ) ) ( not ( = ?auto_2311024 ?auto_2311030 ) ) ( not ( = ?auto_2311024 ?auto_2311031 ) ) ( not ( = ?auto_2311025 ?auto_2311026 ) ) ( not ( = ?auto_2311025 ?auto_2311027 ) ) ( not ( = ?auto_2311025 ?auto_2311028 ) ) ( not ( = ?auto_2311025 ?auto_2311029 ) ) ( not ( = ?auto_2311025 ?auto_2311030 ) ) ( not ( = ?auto_2311025 ?auto_2311031 ) ) ( not ( = ?auto_2311026 ?auto_2311027 ) ) ( not ( = ?auto_2311026 ?auto_2311028 ) ) ( not ( = ?auto_2311026 ?auto_2311029 ) ) ( not ( = ?auto_2311026 ?auto_2311030 ) ) ( not ( = ?auto_2311026 ?auto_2311031 ) ) ( not ( = ?auto_2311027 ?auto_2311028 ) ) ( not ( = ?auto_2311027 ?auto_2311029 ) ) ( not ( = ?auto_2311027 ?auto_2311030 ) ) ( not ( = ?auto_2311027 ?auto_2311031 ) ) ( not ( = ?auto_2311028 ?auto_2311029 ) ) ( not ( = ?auto_2311028 ?auto_2311030 ) ) ( not ( = ?auto_2311028 ?auto_2311031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311029 ?auto_2311030 ?auto_2311031 )
      ( MAKE-13CRATE-VERIFY ?auto_2311018 ?auto_2311019 ?auto_2311020 ?auto_2311021 ?auto_2311022 ?auto_2311023 ?auto_2311024 ?auto_2311025 ?auto_2311026 ?auto_2311027 ?auto_2311028 ?auto_2311029 ?auto_2311030 ?auto_2311031 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311174 - SURFACE
      ?auto_2311175 - SURFACE
      ?auto_2311176 - SURFACE
      ?auto_2311177 - SURFACE
      ?auto_2311178 - SURFACE
      ?auto_2311179 - SURFACE
      ?auto_2311180 - SURFACE
      ?auto_2311181 - SURFACE
      ?auto_2311182 - SURFACE
      ?auto_2311183 - SURFACE
      ?auto_2311184 - SURFACE
      ?auto_2311185 - SURFACE
      ?auto_2311186 - SURFACE
      ?auto_2311187 - SURFACE
    )
    :vars
    (
      ?auto_2311190 - HOIST
      ?auto_2311189 - PLACE
      ?auto_2311188 - TRUCK
      ?auto_2311191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311190 ?auto_2311189 ) ( SURFACE-AT ?auto_2311186 ?auto_2311189 ) ( CLEAR ?auto_2311186 ) ( IS-CRATE ?auto_2311187 ) ( not ( = ?auto_2311186 ?auto_2311187 ) ) ( AVAILABLE ?auto_2311190 ) ( IN ?auto_2311187 ?auto_2311188 ) ( ON ?auto_2311186 ?auto_2311185 ) ( not ( = ?auto_2311185 ?auto_2311186 ) ) ( not ( = ?auto_2311185 ?auto_2311187 ) ) ( TRUCK-AT ?auto_2311188 ?auto_2311191 ) ( not ( = ?auto_2311191 ?auto_2311189 ) ) ( ON ?auto_2311175 ?auto_2311174 ) ( ON ?auto_2311176 ?auto_2311175 ) ( ON ?auto_2311177 ?auto_2311176 ) ( ON ?auto_2311178 ?auto_2311177 ) ( ON ?auto_2311179 ?auto_2311178 ) ( ON ?auto_2311180 ?auto_2311179 ) ( ON ?auto_2311181 ?auto_2311180 ) ( ON ?auto_2311182 ?auto_2311181 ) ( ON ?auto_2311183 ?auto_2311182 ) ( ON ?auto_2311184 ?auto_2311183 ) ( ON ?auto_2311185 ?auto_2311184 ) ( not ( = ?auto_2311174 ?auto_2311175 ) ) ( not ( = ?auto_2311174 ?auto_2311176 ) ) ( not ( = ?auto_2311174 ?auto_2311177 ) ) ( not ( = ?auto_2311174 ?auto_2311178 ) ) ( not ( = ?auto_2311174 ?auto_2311179 ) ) ( not ( = ?auto_2311174 ?auto_2311180 ) ) ( not ( = ?auto_2311174 ?auto_2311181 ) ) ( not ( = ?auto_2311174 ?auto_2311182 ) ) ( not ( = ?auto_2311174 ?auto_2311183 ) ) ( not ( = ?auto_2311174 ?auto_2311184 ) ) ( not ( = ?auto_2311174 ?auto_2311185 ) ) ( not ( = ?auto_2311174 ?auto_2311186 ) ) ( not ( = ?auto_2311174 ?auto_2311187 ) ) ( not ( = ?auto_2311175 ?auto_2311176 ) ) ( not ( = ?auto_2311175 ?auto_2311177 ) ) ( not ( = ?auto_2311175 ?auto_2311178 ) ) ( not ( = ?auto_2311175 ?auto_2311179 ) ) ( not ( = ?auto_2311175 ?auto_2311180 ) ) ( not ( = ?auto_2311175 ?auto_2311181 ) ) ( not ( = ?auto_2311175 ?auto_2311182 ) ) ( not ( = ?auto_2311175 ?auto_2311183 ) ) ( not ( = ?auto_2311175 ?auto_2311184 ) ) ( not ( = ?auto_2311175 ?auto_2311185 ) ) ( not ( = ?auto_2311175 ?auto_2311186 ) ) ( not ( = ?auto_2311175 ?auto_2311187 ) ) ( not ( = ?auto_2311176 ?auto_2311177 ) ) ( not ( = ?auto_2311176 ?auto_2311178 ) ) ( not ( = ?auto_2311176 ?auto_2311179 ) ) ( not ( = ?auto_2311176 ?auto_2311180 ) ) ( not ( = ?auto_2311176 ?auto_2311181 ) ) ( not ( = ?auto_2311176 ?auto_2311182 ) ) ( not ( = ?auto_2311176 ?auto_2311183 ) ) ( not ( = ?auto_2311176 ?auto_2311184 ) ) ( not ( = ?auto_2311176 ?auto_2311185 ) ) ( not ( = ?auto_2311176 ?auto_2311186 ) ) ( not ( = ?auto_2311176 ?auto_2311187 ) ) ( not ( = ?auto_2311177 ?auto_2311178 ) ) ( not ( = ?auto_2311177 ?auto_2311179 ) ) ( not ( = ?auto_2311177 ?auto_2311180 ) ) ( not ( = ?auto_2311177 ?auto_2311181 ) ) ( not ( = ?auto_2311177 ?auto_2311182 ) ) ( not ( = ?auto_2311177 ?auto_2311183 ) ) ( not ( = ?auto_2311177 ?auto_2311184 ) ) ( not ( = ?auto_2311177 ?auto_2311185 ) ) ( not ( = ?auto_2311177 ?auto_2311186 ) ) ( not ( = ?auto_2311177 ?auto_2311187 ) ) ( not ( = ?auto_2311178 ?auto_2311179 ) ) ( not ( = ?auto_2311178 ?auto_2311180 ) ) ( not ( = ?auto_2311178 ?auto_2311181 ) ) ( not ( = ?auto_2311178 ?auto_2311182 ) ) ( not ( = ?auto_2311178 ?auto_2311183 ) ) ( not ( = ?auto_2311178 ?auto_2311184 ) ) ( not ( = ?auto_2311178 ?auto_2311185 ) ) ( not ( = ?auto_2311178 ?auto_2311186 ) ) ( not ( = ?auto_2311178 ?auto_2311187 ) ) ( not ( = ?auto_2311179 ?auto_2311180 ) ) ( not ( = ?auto_2311179 ?auto_2311181 ) ) ( not ( = ?auto_2311179 ?auto_2311182 ) ) ( not ( = ?auto_2311179 ?auto_2311183 ) ) ( not ( = ?auto_2311179 ?auto_2311184 ) ) ( not ( = ?auto_2311179 ?auto_2311185 ) ) ( not ( = ?auto_2311179 ?auto_2311186 ) ) ( not ( = ?auto_2311179 ?auto_2311187 ) ) ( not ( = ?auto_2311180 ?auto_2311181 ) ) ( not ( = ?auto_2311180 ?auto_2311182 ) ) ( not ( = ?auto_2311180 ?auto_2311183 ) ) ( not ( = ?auto_2311180 ?auto_2311184 ) ) ( not ( = ?auto_2311180 ?auto_2311185 ) ) ( not ( = ?auto_2311180 ?auto_2311186 ) ) ( not ( = ?auto_2311180 ?auto_2311187 ) ) ( not ( = ?auto_2311181 ?auto_2311182 ) ) ( not ( = ?auto_2311181 ?auto_2311183 ) ) ( not ( = ?auto_2311181 ?auto_2311184 ) ) ( not ( = ?auto_2311181 ?auto_2311185 ) ) ( not ( = ?auto_2311181 ?auto_2311186 ) ) ( not ( = ?auto_2311181 ?auto_2311187 ) ) ( not ( = ?auto_2311182 ?auto_2311183 ) ) ( not ( = ?auto_2311182 ?auto_2311184 ) ) ( not ( = ?auto_2311182 ?auto_2311185 ) ) ( not ( = ?auto_2311182 ?auto_2311186 ) ) ( not ( = ?auto_2311182 ?auto_2311187 ) ) ( not ( = ?auto_2311183 ?auto_2311184 ) ) ( not ( = ?auto_2311183 ?auto_2311185 ) ) ( not ( = ?auto_2311183 ?auto_2311186 ) ) ( not ( = ?auto_2311183 ?auto_2311187 ) ) ( not ( = ?auto_2311184 ?auto_2311185 ) ) ( not ( = ?auto_2311184 ?auto_2311186 ) ) ( not ( = ?auto_2311184 ?auto_2311187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311185 ?auto_2311186 ?auto_2311187 )
      ( MAKE-13CRATE-VERIFY ?auto_2311174 ?auto_2311175 ?auto_2311176 ?auto_2311177 ?auto_2311178 ?auto_2311179 ?auto_2311180 ?auto_2311181 ?auto_2311182 ?auto_2311183 ?auto_2311184 ?auto_2311185 ?auto_2311186 ?auto_2311187 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311343 - SURFACE
      ?auto_2311344 - SURFACE
      ?auto_2311345 - SURFACE
      ?auto_2311346 - SURFACE
      ?auto_2311347 - SURFACE
      ?auto_2311348 - SURFACE
      ?auto_2311349 - SURFACE
      ?auto_2311350 - SURFACE
      ?auto_2311351 - SURFACE
      ?auto_2311352 - SURFACE
      ?auto_2311353 - SURFACE
      ?auto_2311354 - SURFACE
      ?auto_2311355 - SURFACE
      ?auto_2311356 - SURFACE
    )
    :vars
    (
      ?auto_2311359 - HOIST
      ?auto_2311360 - PLACE
      ?auto_2311357 - TRUCK
      ?auto_2311358 - PLACE
      ?auto_2311361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311359 ?auto_2311360 ) ( SURFACE-AT ?auto_2311355 ?auto_2311360 ) ( CLEAR ?auto_2311355 ) ( IS-CRATE ?auto_2311356 ) ( not ( = ?auto_2311355 ?auto_2311356 ) ) ( AVAILABLE ?auto_2311359 ) ( ON ?auto_2311355 ?auto_2311354 ) ( not ( = ?auto_2311354 ?auto_2311355 ) ) ( not ( = ?auto_2311354 ?auto_2311356 ) ) ( TRUCK-AT ?auto_2311357 ?auto_2311358 ) ( not ( = ?auto_2311358 ?auto_2311360 ) ) ( HOIST-AT ?auto_2311361 ?auto_2311358 ) ( LIFTING ?auto_2311361 ?auto_2311356 ) ( not ( = ?auto_2311359 ?auto_2311361 ) ) ( ON ?auto_2311344 ?auto_2311343 ) ( ON ?auto_2311345 ?auto_2311344 ) ( ON ?auto_2311346 ?auto_2311345 ) ( ON ?auto_2311347 ?auto_2311346 ) ( ON ?auto_2311348 ?auto_2311347 ) ( ON ?auto_2311349 ?auto_2311348 ) ( ON ?auto_2311350 ?auto_2311349 ) ( ON ?auto_2311351 ?auto_2311350 ) ( ON ?auto_2311352 ?auto_2311351 ) ( ON ?auto_2311353 ?auto_2311352 ) ( ON ?auto_2311354 ?auto_2311353 ) ( not ( = ?auto_2311343 ?auto_2311344 ) ) ( not ( = ?auto_2311343 ?auto_2311345 ) ) ( not ( = ?auto_2311343 ?auto_2311346 ) ) ( not ( = ?auto_2311343 ?auto_2311347 ) ) ( not ( = ?auto_2311343 ?auto_2311348 ) ) ( not ( = ?auto_2311343 ?auto_2311349 ) ) ( not ( = ?auto_2311343 ?auto_2311350 ) ) ( not ( = ?auto_2311343 ?auto_2311351 ) ) ( not ( = ?auto_2311343 ?auto_2311352 ) ) ( not ( = ?auto_2311343 ?auto_2311353 ) ) ( not ( = ?auto_2311343 ?auto_2311354 ) ) ( not ( = ?auto_2311343 ?auto_2311355 ) ) ( not ( = ?auto_2311343 ?auto_2311356 ) ) ( not ( = ?auto_2311344 ?auto_2311345 ) ) ( not ( = ?auto_2311344 ?auto_2311346 ) ) ( not ( = ?auto_2311344 ?auto_2311347 ) ) ( not ( = ?auto_2311344 ?auto_2311348 ) ) ( not ( = ?auto_2311344 ?auto_2311349 ) ) ( not ( = ?auto_2311344 ?auto_2311350 ) ) ( not ( = ?auto_2311344 ?auto_2311351 ) ) ( not ( = ?auto_2311344 ?auto_2311352 ) ) ( not ( = ?auto_2311344 ?auto_2311353 ) ) ( not ( = ?auto_2311344 ?auto_2311354 ) ) ( not ( = ?auto_2311344 ?auto_2311355 ) ) ( not ( = ?auto_2311344 ?auto_2311356 ) ) ( not ( = ?auto_2311345 ?auto_2311346 ) ) ( not ( = ?auto_2311345 ?auto_2311347 ) ) ( not ( = ?auto_2311345 ?auto_2311348 ) ) ( not ( = ?auto_2311345 ?auto_2311349 ) ) ( not ( = ?auto_2311345 ?auto_2311350 ) ) ( not ( = ?auto_2311345 ?auto_2311351 ) ) ( not ( = ?auto_2311345 ?auto_2311352 ) ) ( not ( = ?auto_2311345 ?auto_2311353 ) ) ( not ( = ?auto_2311345 ?auto_2311354 ) ) ( not ( = ?auto_2311345 ?auto_2311355 ) ) ( not ( = ?auto_2311345 ?auto_2311356 ) ) ( not ( = ?auto_2311346 ?auto_2311347 ) ) ( not ( = ?auto_2311346 ?auto_2311348 ) ) ( not ( = ?auto_2311346 ?auto_2311349 ) ) ( not ( = ?auto_2311346 ?auto_2311350 ) ) ( not ( = ?auto_2311346 ?auto_2311351 ) ) ( not ( = ?auto_2311346 ?auto_2311352 ) ) ( not ( = ?auto_2311346 ?auto_2311353 ) ) ( not ( = ?auto_2311346 ?auto_2311354 ) ) ( not ( = ?auto_2311346 ?auto_2311355 ) ) ( not ( = ?auto_2311346 ?auto_2311356 ) ) ( not ( = ?auto_2311347 ?auto_2311348 ) ) ( not ( = ?auto_2311347 ?auto_2311349 ) ) ( not ( = ?auto_2311347 ?auto_2311350 ) ) ( not ( = ?auto_2311347 ?auto_2311351 ) ) ( not ( = ?auto_2311347 ?auto_2311352 ) ) ( not ( = ?auto_2311347 ?auto_2311353 ) ) ( not ( = ?auto_2311347 ?auto_2311354 ) ) ( not ( = ?auto_2311347 ?auto_2311355 ) ) ( not ( = ?auto_2311347 ?auto_2311356 ) ) ( not ( = ?auto_2311348 ?auto_2311349 ) ) ( not ( = ?auto_2311348 ?auto_2311350 ) ) ( not ( = ?auto_2311348 ?auto_2311351 ) ) ( not ( = ?auto_2311348 ?auto_2311352 ) ) ( not ( = ?auto_2311348 ?auto_2311353 ) ) ( not ( = ?auto_2311348 ?auto_2311354 ) ) ( not ( = ?auto_2311348 ?auto_2311355 ) ) ( not ( = ?auto_2311348 ?auto_2311356 ) ) ( not ( = ?auto_2311349 ?auto_2311350 ) ) ( not ( = ?auto_2311349 ?auto_2311351 ) ) ( not ( = ?auto_2311349 ?auto_2311352 ) ) ( not ( = ?auto_2311349 ?auto_2311353 ) ) ( not ( = ?auto_2311349 ?auto_2311354 ) ) ( not ( = ?auto_2311349 ?auto_2311355 ) ) ( not ( = ?auto_2311349 ?auto_2311356 ) ) ( not ( = ?auto_2311350 ?auto_2311351 ) ) ( not ( = ?auto_2311350 ?auto_2311352 ) ) ( not ( = ?auto_2311350 ?auto_2311353 ) ) ( not ( = ?auto_2311350 ?auto_2311354 ) ) ( not ( = ?auto_2311350 ?auto_2311355 ) ) ( not ( = ?auto_2311350 ?auto_2311356 ) ) ( not ( = ?auto_2311351 ?auto_2311352 ) ) ( not ( = ?auto_2311351 ?auto_2311353 ) ) ( not ( = ?auto_2311351 ?auto_2311354 ) ) ( not ( = ?auto_2311351 ?auto_2311355 ) ) ( not ( = ?auto_2311351 ?auto_2311356 ) ) ( not ( = ?auto_2311352 ?auto_2311353 ) ) ( not ( = ?auto_2311352 ?auto_2311354 ) ) ( not ( = ?auto_2311352 ?auto_2311355 ) ) ( not ( = ?auto_2311352 ?auto_2311356 ) ) ( not ( = ?auto_2311353 ?auto_2311354 ) ) ( not ( = ?auto_2311353 ?auto_2311355 ) ) ( not ( = ?auto_2311353 ?auto_2311356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311354 ?auto_2311355 ?auto_2311356 )
      ( MAKE-13CRATE-VERIFY ?auto_2311343 ?auto_2311344 ?auto_2311345 ?auto_2311346 ?auto_2311347 ?auto_2311348 ?auto_2311349 ?auto_2311350 ?auto_2311351 ?auto_2311352 ?auto_2311353 ?auto_2311354 ?auto_2311355 ?auto_2311356 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311525 - SURFACE
      ?auto_2311526 - SURFACE
      ?auto_2311527 - SURFACE
      ?auto_2311528 - SURFACE
      ?auto_2311529 - SURFACE
      ?auto_2311530 - SURFACE
      ?auto_2311531 - SURFACE
      ?auto_2311532 - SURFACE
      ?auto_2311533 - SURFACE
      ?auto_2311534 - SURFACE
      ?auto_2311535 - SURFACE
      ?auto_2311536 - SURFACE
      ?auto_2311537 - SURFACE
      ?auto_2311538 - SURFACE
    )
    :vars
    (
      ?auto_2311541 - HOIST
      ?auto_2311542 - PLACE
      ?auto_2311543 - TRUCK
      ?auto_2311539 - PLACE
      ?auto_2311544 - HOIST
      ?auto_2311540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311541 ?auto_2311542 ) ( SURFACE-AT ?auto_2311537 ?auto_2311542 ) ( CLEAR ?auto_2311537 ) ( IS-CRATE ?auto_2311538 ) ( not ( = ?auto_2311537 ?auto_2311538 ) ) ( AVAILABLE ?auto_2311541 ) ( ON ?auto_2311537 ?auto_2311536 ) ( not ( = ?auto_2311536 ?auto_2311537 ) ) ( not ( = ?auto_2311536 ?auto_2311538 ) ) ( TRUCK-AT ?auto_2311543 ?auto_2311539 ) ( not ( = ?auto_2311539 ?auto_2311542 ) ) ( HOIST-AT ?auto_2311544 ?auto_2311539 ) ( not ( = ?auto_2311541 ?auto_2311544 ) ) ( AVAILABLE ?auto_2311544 ) ( SURFACE-AT ?auto_2311538 ?auto_2311539 ) ( ON ?auto_2311538 ?auto_2311540 ) ( CLEAR ?auto_2311538 ) ( not ( = ?auto_2311537 ?auto_2311540 ) ) ( not ( = ?auto_2311538 ?auto_2311540 ) ) ( not ( = ?auto_2311536 ?auto_2311540 ) ) ( ON ?auto_2311526 ?auto_2311525 ) ( ON ?auto_2311527 ?auto_2311526 ) ( ON ?auto_2311528 ?auto_2311527 ) ( ON ?auto_2311529 ?auto_2311528 ) ( ON ?auto_2311530 ?auto_2311529 ) ( ON ?auto_2311531 ?auto_2311530 ) ( ON ?auto_2311532 ?auto_2311531 ) ( ON ?auto_2311533 ?auto_2311532 ) ( ON ?auto_2311534 ?auto_2311533 ) ( ON ?auto_2311535 ?auto_2311534 ) ( ON ?auto_2311536 ?auto_2311535 ) ( not ( = ?auto_2311525 ?auto_2311526 ) ) ( not ( = ?auto_2311525 ?auto_2311527 ) ) ( not ( = ?auto_2311525 ?auto_2311528 ) ) ( not ( = ?auto_2311525 ?auto_2311529 ) ) ( not ( = ?auto_2311525 ?auto_2311530 ) ) ( not ( = ?auto_2311525 ?auto_2311531 ) ) ( not ( = ?auto_2311525 ?auto_2311532 ) ) ( not ( = ?auto_2311525 ?auto_2311533 ) ) ( not ( = ?auto_2311525 ?auto_2311534 ) ) ( not ( = ?auto_2311525 ?auto_2311535 ) ) ( not ( = ?auto_2311525 ?auto_2311536 ) ) ( not ( = ?auto_2311525 ?auto_2311537 ) ) ( not ( = ?auto_2311525 ?auto_2311538 ) ) ( not ( = ?auto_2311525 ?auto_2311540 ) ) ( not ( = ?auto_2311526 ?auto_2311527 ) ) ( not ( = ?auto_2311526 ?auto_2311528 ) ) ( not ( = ?auto_2311526 ?auto_2311529 ) ) ( not ( = ?auto_2311526 ?auto_2311530 ) ) ( not ( = ?auto_2311526 ?auto_2311531 ) ) ( not ( = ?auto_2311526 ?auto_2311532 ) ) ( not ( = ?auto_2311526 ?auto_2311533 ) ) ( not ( = ?auto_2311526 ?auto_2311534 ) ) ( not ( = ?auto_2311526 ?auto_2311535 ) ) ( not ( = ?auto_2311526 ?auto_2311536 ) ) ( not ( = ?auto_2311526 ?auto_2311537 ) ) ( not ( = ?auto_2311526 ?auto_2311538 ) ) ( not ( = ?auto_2311526 ?auto_2311540 ) ) ( not ( = ?auto_2311527 ?auto_2311528 ) ) ( not ( = ?auto_2311527 ?auto_2311529 ) ) ( not ( = ?auto_2311527 ?auto_2311530 ) ) ( not ( = ?auto_2311527 ?auto_2311531 ) ) ( not ( = ?auto_2311527 ?auto_2311532 ) ) ( not ( = ?auto_2311527 ?auto_2311533 ) ) ( not ( = ?auto_2311527 ?auto_2311534 ) ) ( not ( = ?auto_2311527 ?auto_2311535 ) ) ( not ( = ?auto_2311527 ?auto_2311536 ) ) ( not ( = ?auto_2311527 ?auto_2311537 ) ) ( not ( = ?auto_2311527 ?auto_2311538 ) ) ( not ( = ?auto_2311527 ?auto_2311540 ) ) ( not ( = ?auto_2311528 ?auto_2311529 ) ) ( not ( = ?auto_2311528 ?auto_2311530 ) ) ( not ( = ?auto_2311528 ?auto_2311531 ) ) ( not ( = ?auto_2311528 ?auto_2311532 ) ) ( not ( = ?auto_2311528 ?auto_2311533 ) ) ( not ( = ?auto_2311528 ?auto_2311534 ) ) ( not ( = ?auto_2311528 ?auto_2311535 ) ) ( not ( = ?auto_2311528 ?auto_2311536 ) ) ( not ( = ?auto_2311528 ?auto_2311537 ) ) ( not ( = ?auto_2311528 ?auto_2311538 ) ) ( not ( = ?auto_2311528 ?auto_2311540 ) ) ( not ( = ?auto_2311529 ?auto_2311530 ) ) ( not ( = ?auto_2311529 ?auto_2311531 ) ) ( not ( = ?auto_2311529 ?auto_2311532 ) ) ( not ( = ?auto_2311529 ?auto_2311533 ) ) ( not ( = ?auto_2311529 ?auto_2311534 ) ) ( not ( = ?auto_2311529 ?auto_2311535 ) ) ( not ( = ?auto_2311529 ?auto_2311536 ) ) ( not ( = ?auto_2311529 ?auto_2311537 ) ) ( not ( = ?auto_2311529 ?auto_2311538 ) ) ( not ( = ?auto_2311529 ?auto_2311540 ) ) ( not ( = ?auto_2311530 ?auto_2311531 ) ) ( not ( = ?auto_2311530 ?auto_2311532 ) ) ( not ( = ?auto_2311530 ?auto_2311533 ) ) ( not ( = ?auto_2311530 ?auto_2311534 ) ) ( not ( = ?auto_2311530 ?auto_2311535 ) ) ( not ( = ?auto_2311530 ?auto_2311536 ) ) ( not ( = ?auto_2311530 ?auto_2311537 ) ) ( not ( = ?auto_2311530 ?auto_2311538 ) ) ( not ( = ?auto_2311530 ?auto_2311540 ) ) ( not ( = ?auto_2311531 ?auto_2311532 ) ) ( not ( = ?auto_2311531 ?auto_2311533 ) ) ( not ( = ?auto_2311531 ?auto_2311534 ) ) ( not ( = ?auto_2311531 ?auto_2311535 ) ) ( not ( = ?auto_2311531 ?auto_2311536 ) ) ( not ( = ?auto_2311531 ?auto_2311537 ) ) ( not ( = ?auto_2311531 ?auto_2311538 ) ) ( not ( = ?auto_2311531 ?auto_2311540 ) ) ( not ( = ?auto_2311532 ?auto_2311533 ) ) ( not ( = ?auto_2311532 ?auto_2311534 ) ) ( not ( = ?auto_2311532 ?auto_2311535 ) ) ( not ( = ?auto_2311532 ?auto_2311536 ) ) ( not ( = ?auto_2311532 ?auto_2311537 ) ) ( not ( = ?auto_2311532 ?auto_2311538 ) ) ( not ( = ?auto_2311532 ?auto_2311540 ) ) ( not ( = ?auto_2311533 ?auto_2311534 ) ) ( not ( = ?auto_2311533 ?auto_2311535 ) ) ( not ( = ?auto_2311533 ?auto_2311536 ) ) ( not ( = ?auto_2311533 ?auto_2311537 ) ) ( not ( = ?auto_2311533 ?auto_2311538 ) ) ( not ( = ?auto_2311533 ?auto_2311540 ) ) ( not ( = ?auto_2311534 ?auto_2311535 ) ) ( not ( = ?auto_2311534 ?auto_2311536 ) ) ( not ( = ?auto_2311534 ?auto_2311537 ) ) ( not ( = ?auto_2311534 ?auto_2311538 ) ) ( not ( = ?auto_2311534 ?auto_2311540 ) ) ( not ( = ?auto_2311535 ?auto_2311536 ) ) ( not ( = ?auto_2311535 ?auto_2311537 ) ) ( not ( = ?auto_2311535 ?auto_2311538 ) ) ( not ( = ?auto_2311535 ?auto_2311540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311536 ?auto_2311537 ?auto_2311538 )
      ( MAKE-13CRATE-VERIFY ?auto_2311525 ?auto_2311526 ?auto_2311527 ?auto_2311528 ?auto_2311529 ?auto_2311530 ?auto_2311531 ?auto_2311532 ?auto_2311533 ?auto_2311534 ?auto_2311535 ?auto_2311536 ?auto_2311537 ?auto_2311538 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311708 - SURFACE
      ?auto_2311709 - SURFACE
      ?auto_2311710 - SURFACE
      ?auto_2311711 - SURFACE
      ?auto_2311712 - SURFACE
      ?auto_2311713 - SURFACE
      ?auto_2311714 - SURFACE
      ?auto_2311715 - SURFACE
      ?auto_2311716 - SURFACE
      ?auto_2311717 - SURFACE
      ?auto_2311718 - SURFACE
      ?auto_2311719 - SURFACE
      ?auto_2311720 - SURFACE
      ?auto_2311721 - SURFACE
    )
    :vars
    (
      ?auto_2311727 - HOIST
      ?auto_2311722 - PLACE
      ?auto_2311726 - PLACE
      ?auto_2311724 - HOIST
      ?auto_2311725 - SURFACE
      ?auto_2311723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311727 ?auto_2311722 ) ( SURFACE-AT ?auto_2311720 ?auto_2311722 ) ( CLEAR ?auto_2311720 ) ( IS-CRATE ?auto_2311721 ) ( not ( = ?auto_2311720 ?auto_2311721 ) ) ( AVAILABLE ?auto_2311727 ) ( ON ?auto_2311720 ?auto_2311719 ) ( not ( = ?auto_2311719 ?auto_2311720 ) ) ( not ( = ?auto_2311719 ?auto_2311721 ) ) ( not ( = ?auto_2311726 ?auto_2311722 ) ) ( HOIST-AT ?auto_2311724 ?auto_2311726 ) ( not ( = ?auto_2311727 ?auto_2311724 ) ) ( AVAILABLE ?auto_2311724 ) ( SURFACE-AT ?auto_2311721 ?auto_2311726 ) ( ON ?auto_2311721 ?auto_2311725 ) ( CLEAR ?auto_2311721 ) ( not ( = ?auto_2311720 ?auto_2311725 ) ) ( not ( = ?auto_2311721 ?auto_2311725 ) ) ( not ( = ?auto_2311719 ?auto_2311725 ) ) ( TRUCK-AT ?auto_2311723 ?auto_2311722 ) ( ON ?auto_2311709 ?auto_2311708 ) ( ON ?auto_2311710 ?auto_2311709 ) ( ON ?auto_2311711 ?auto_2311710 ) ( ON ?auto_2311712 ?auto_2311711 ) ( ON ?auto_2311713 ?auto_2311712 ) ( ON ?auto_2311714 ?auto_2311713 ) ( ON ?auto_2311715 ?auto_2311714 ) ( ON ?auto_2311716 ?auto_2311715 ) ( ON ?auto_2311717 ?auto_2311716 ) ( ON ?auto_2311718 ?auto_2311717 ) ( ON ?auto_2311719 ?auto_2311718 ) ( not ( = ?auto_2311708 ?auto_2311709 ) ) ( not ( = ?auto_2311708 ?auto_2311710 ) ) ( not ( = ?auto_2311708 ?auto_2311711 ) ) ( not ( = ?auto_2311708 ?auto_2311712 ) ) ( not ( = ?auto_2311708 ?auto_2311713 ) ) ( not ( = ?auto_2311708 ?auto_2311714 ) ) ( not ( = ?auto_2311708 ?auto_2311715 ) ) ( not ( = ?auto_2311708 ?auto_2311716 ) ) ( not ( = ?auto_2311708 ?auto_2311717 ) ) ( not ( = ?auto_2311708 ?auto_2311718 ) ) ( not ( = ?auto_2311708 ?auto_2311719 ) ) ( not ( = ?auto_2311708 ?auto_2311720 ) ) ( not ( = ?auto_2311708 ?auto_2311721 ) ) ( not ( = ?auto_2311708 ?auto_2311725 ) ) ( not ( = ?auto_2311709 ?auto_2311710 ) ) ( not ( = ?auto_2311709 ?auto_2311711 ) ) ( not ( = ?auto_2311709 ?auto_2311712 ) ) ( not ( = ?auto_2311709 ?auto_2311713 ) ) ( not ( = ?auto_2311709 ?auto_2311714 ) ) ( not ( = ?auto_2311709 ?auto_2311715 ) ) ( not ( = ?auto_2311709 ?auto_2311716 ) ) ( not ( = ?auto_2311709 ?auto_2311717 ) ) ( not ( = ?auto_2311709 ?auto_2311718 ) ) ( not ( = ?auto_2311709 ?auto_2311719 ) ) ( not ( = ?auto_2311709 ?auto_2311720 ) ) ( not ( = ?auto_2311709 ?auto_2311721 ) ) ( not ( = ?auto_2311709 ?auto_2311725 ) ) ( not ( = ?auto_2311710 ?auto_2311711 ) ) ( not ( = ?auto_2311710 ?auto_2311712 ) ) ( not ( = ?auto_2311710 ?auto_2311713 ) ) ( not ( = ?auto_2311710 ?auto_2311714 ) ) ( not ( = ?auto_2311710 ?auto_2311715 ) ) ( not ( = ?auto_2311710 ?auto_2311716 ) ) ( not ( = ?auto_2311710 ?auto_2311717 ) ) ( not ( = ?auto_2311710 ?auto_2311718 ) ) ( not ( = ?auto_2311710 ?auto_2311719 ) ) ( not ( = ?auto_2311710 ?auto_2311720 ) ) ( not ( = ?auto_2311710 ?auto_2311721 ) ) ( not ( = ?auto_2311710 ?auto_2311725 ) ) ( not ( = ?auto_2311711 ?auto_2311712 ) ) ( not ( = ?auto_2311711 ?auto_2311713 ) ) ( not ( = ?auto_2311711 ?auto_2311714 ) ) ( not ( = ?auto_2311711 ?auto_2311715 ) ) ( not ( = ?auto_2311711 ?auto_2311716 ) ) ( not ( = ?auto_2311711 ?auto_2311717 ) ) ( not ( = ?auto_2311711 ?auto_2311718 ) ) ( not ( = ?auto_2311711 ?auto_2311719 ) ) ( not ( = ?auto_2311711 ?auto_2311720 ) ) ( not ( = ?auto_2311711 ?auto_2311721 ) ) ( not ( = ?auto_2311711 ?auto_2311725 ) ) ( not ( = ?auto_2311712 ?auto_2311713 ) ) ( not ( = ?auto_2311712 ?auto_2311714 ) ) ( not ( = ?auto_2311712 ?auto_2311715 ) ) ( not ( = ?auto_2311712 ?auto_2311716 ) ) ( not ( = ?auto_2311712 ?auto_2311717 ) ) ( not ( = ?auto_2311712 ?auto_2311718 ) ) ( not ( = ?auto_2311712 ?auto_2311719 ) ) ( not ( = ?auto_2311712 ?auto_2311720 ) ) ( not ( = ?auto_2311712 ?auto_2311721 ) ) ( not ( = ?auto_2311712 ?auto_2311725 ) ) ( not ( = ?auto_2311713 ?auto_2311714 ) ) ( not ( = ?auto_2311713 ?auto_2311715 ) ) ( not ( = ?auto_2311713 ?auto_2311716 ) ) ( not ( = ?auto_2311713 ?auto_2311717 ) ) ( not ( = ?auto_2311713 ?auto_2311718 ) ) ( not ( = ?auto_2311713 ?auto_2311719 ) ) ( not ( = ?auto_2311713 ?auto_2311720 ) ) ( not ( = ?auto_2311713 ?auto_2311721 ) ) ( not ( = ?auto_2311713 ?auto_2311725 ) ) ( not ( = ?auto_2311714 ?auto_2311715 ) ) ( not ( = ?auto_2311714 ?auto_2311716 ) ) ( not ( = ?auto_2311714 ?auto_2311717 ) ) ( not ( = ?auto_2311714 ?auto_2311718 ) ) ( not ( = ?auto_2311714 ?auto_2311719 ) ) ( not ( = ?auto_2311714 ?auto_2311720 ) ) ( not ( = ?auto_2311714 ?auto_2311721 ) ) ( not ( = ?auto_2311714 ?auto_2311725 ) ) ( not ( = ?auto_2311715 ?auto_2311716 ) ) ( not ( = ?auto_2311715 ?auto_2311717 ) ) ( not ( = ?auto_2311715 ?auto_2311718 ) ) ( not ( = ?auto_2311715 ?auto_2311719 ) ) ( not ( = ?auto_2311715 ?auto_2311720 ) ) ( not ( = ?auto_2311715 ?auto_2311721 ) ) ( not ( = ?auto_2311715 ?auto_2311725 ) ) ( not ( = ?auto_2311716 ?auto_2311717 ) ) ( not ( = ?auto_2311716 ?auto_2311718 ) ) ( not ( = ?auto_2311716 ?auto_2311719 ) ) ( not ( = ?auto_2311716 ?auto_2311720 ) ) ( not ( = ?auto_2311716 ?auto_2311721 ) ) ( not ( = ?auto_2311716 ?auto_2311725 ) ) ( not ( = ?auto_2311717 ?auto_2311718 ) ) ( not ( = ?auto_2311717 ?auto_2311719 ) ) ( not ( = ?auto_2311717 ?auto_2311720 ) ) ( not ( = ?auto_2311717 ?auto_2311721 ) ) ( not ( = ?auto_2311717 ?auto_2311725 ) ) ( not ( = ?auto_2311718 ?auto_2311719 ) ) ( not ( = ?auto_2311718 ?auto_2311720 ) ) ( not ( = ?auto_2311718 ?auto_2311721 ) ) ( not ( = ?auto_2311718 ?auto_2311725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311719 ?auto_2311720 ?auto_2311721 )
      ( MAKE-13CRATE-VERIFY ?auto_2311708 ?auto_2311709 ?auto_2311710 ?auto_2311711 ?auto_2311712 ?auto_2311713 ?auto_2311714 ?auto_2311715 ?auto_2311716 ?auto_2311717 ?auto_2311718 ?auto_2311719 ?auto_2311720 ?auto_2311721 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311891 - SURFACE
      ?auto_2311892 - SURFACE
      ?auto_2311893 - SURFACE
      ?auto_2311894 - SURFACE
      ?auto_2311895 - SURFACE
      ?auto_2311896 - SURFACE
      ?auto_2311897 - SURFACE
      ?auto_2311898 - SURFACE
      ?auto_2311899 - SURFACE
      ?auto_2311900 - SURFACE
      ?auto_2311901 - SURFACE
      ?auto_2311902 - SURFACE
      ?auto_2311903 - SURFACE
      ?auto_2311904 - SURFACE
    )
    :vars
    (
      ?auto_2311910 - HOIST
      ?auto_2311907 - PLACE
      ?auto_2311905 - PLACE
      ?auto_2311906 - HOIST
      ?auto_2311908 - SURFACE
      ?auto_2311909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311910 ?auto_2311907 ) ( IS-CRATE ?auto_2311904 ) ( not ( = ?auto_2311903 ?auto_2311904 ) ) ( not ( = ?auto_2311902 ?auto_2311903 ) ) ( not ( = ?auto_2311902 ?auto_2311904 ) ) ( not ( = ?auto_2311905 ?auto_2311907 ) ) ( HOIST-AT ?auto_2311906 ?auto_2311905 ) ( not ( = ?auto_2311910 ?auto_2311906 ) ) ( AVAILABLE ?auto_2311906 ) ( SURFACE-AT ?auto_2311904 ?auto_2311905 ) ( ON ?auto_2311904 ?auto_2311908 ) ( CLEAR ?auto_2311904 ) ( not ( = ?auto_2311903 ?auto_2311908 ) ) ( not ( = ?auto_2311904 ?auto_2311908 ) ) ( not ( = ?auto_2311902 ?auto_2311908 ) ) ( TRUCK-AT ?auto_2311909 ?auto_2311907 ) ( SURFACE-AT ?auto_2311902 ?auto_2311907 ) ( CLEAR ?auto_2311902 ) ( LIFTING ?auto_2311910 ?auto_2311903 ) ( IS-CRATE ?auto_2311903 ) ( ON ?auto_2311892 ?auto_2311891 ) ( ON ?auto_2311893 ?auto_2311892 ) ( ON ?auto_2311894 ?auto_2311893 ) ( ON ?auto_2311895 ?auto_2311894 ) ( ON ?auto_2311896 ?auto_2311895 ) ( ON ?auto_2311897 ?auto_2311896 ) ( ON ?auto_2311898 ?auto_2311897 ) ( ON ?auto_2311899 ?auto_2311898 ) ( ON ?auto_2311900 ?auto_2311899 ) ( ON ?auto_2311901 ?auto_2311900 ) ( ON ?auto_2311902 ?auto_2311901 ) ( not ( = ?auto_2311891 ?auto_2311892 ) ) ( not ( = ?auto_2311891 ?auto_2311893 ) ) ( not ( = ?auto_2311891 ?auto_2311894 ) ) ( not ( = ?auto_2311891 ?auto_2311895 ) ) ( not ( = ?auto_2311891 ?auto_2311896 ) ) ( not ( = ?auto_2311891 ?auto_2311897 ) ) ( not ( = ?auto_2311891 ?auto_2311898 ) ) ( not ( = ?auto_2311891 ?auto_2311899 ) ) ( not ( = ?auto_2311891 ?auto_2311900 ) ) ( not ( = ?auto_2311891 ?auto_2311901 ) ) ( not ( = ?auto_2311891 ?auto_2311902 ) ) ( not ( = ?auto_2311891 ?auto_2311903 ) ) ( not ( = ?auto_2311891 ?auto_2311904 ) ) ( not ( = ?auto_2311891 ?auto_2311908 ) ) ( not ( = ?auto_2311892 ?auto_2311893 ) ) ( not ( = ?auto_2311892 ?auto_2311894 ) ) ( not ( = ?auto_2311892 ?auto_2311895 ) ) ( not ( = ?auto_2311892 ?auto_2311896 ) ) ( not ( = ?auto_2311892 ?auto_2311897 ) ) ( not ( = ?auto_2311892 ?auto_2311898 ) ) ( not ( = ?auto_2311892 ?auto_2311899 ) ) ( not ( = ?auto_2311892 ?auto_2311900 ) ) ( not ( = ?auto_2311892 ?auto_2311901 ) ) ( not ( = ?auto_2311892 ?auto_2311902 ) ) ( not ( = ?auto_2311892 ?auto_2311903 ) ) ( not ( = ?auto_2311892 ?auto_2311904 ) ) ( not ( = ?auto_2311892 ?auto_2311908 ) ) ( not ( = ?auto_2311893 ?auto_2311894 ) ) ( not ( = ?auto_2311893 ?auto_2311895 ) ) ( not ( = ?auto_2311893 ?auto_2311896 ) ) ( not ( = ?auto_2311893 ?auto_2311897 ) ) ( not ( = ?auto_2311893 ?auto_2311898 ) ) ( not ( = ?auto_2311893 ?auto_2311899 ) ) ( not ( = ?auto_2311893 ?auto_2311900 ) ) ( not ( = ?auto_2311893 ?auto_2311901 ) ) ( not ( = ?auto_2311893 ?auto_2311902 ) ) ( not ( = ?auto_2311893 ?auto_2311903 ) ) ( not ( = ?auto_2311893 ?auto_2311904 ) ) ( not ( = ?auto_2311893 ?auto_2311908 ) ) ( not ( = ?auto_2311894 ?auto_2311895 ) ) ( not ( = ?auto_2311894 ?auto_2311896 ) ) ( not ( = ?auto_2311894 ?auto_2311897 ) ) ( not ( = ?auto_2311894 ?auto_2311898 ) ) ( not ( = ?auto_2311894 ?auto_2311899 ) ) ( not ( = ?auto_2311894 ?auto_2311900 ) ) ( not ( = ?auto_2311894 ?auto_2311901 ) ) ( not ( = ?auto_2311894 ?auto_2311902 ) ) ( not ( = ?auto_2311894 ?auto_2311903 ) ) ( not ( = ?auto_2311894 ?auto_2311904 ) ) ( not ( = ?auto_2311894 ?auto_2311908 ) ) ( not ( = ?auto_2311895 ?auto_2311896 ) ) ( not ( = ?auto_2311895 ?auto_2311897 ) ) ( not ( = ?auto_2311895 ?auto_2311898 ) ) ( not ( = ?auto_2311895 ?auto_2311899 ) ) ( not ( = ?auto_2311895 ?auto_2311900 ) ) ( not ( = ?auto_2311895 ?auto_2311901 ) ) ( not ( = ?auto_2311895 ?auto_2311902 ) ) ( not ( = ?auto_2311895 ?auto_2311903 ) ) ( not ( = ?auto_2311895 ?auto_2311904 ) ) ( not ( = ?auto_2311895 ?auto_2311908 ) ) ( not ( = ?auto_2311896 ?auto_2311897 ) ) ( not ( = ?auto_2311896 ?auto_2311898 ) ) ( not ( = ?auto_2311896 ?auto_2311899 ) ) ( not ( = ?auto_2311896 ?auto_2311900 ) ) ( not ( = ?auto_2311896 ?auto_2311901 ) ) ( not ( = ?auto_2311896 ?auto_2311902 ) ) ( not ( = ?auto_2311896 ?auto_2311903 ) ) ( not ( = ?auto_2311896 ?auto_2311904 ) ) ( not ( = ?auto_2311896 ?auto_2311908 ) ) ( not ( = ?auto_2311897 ?auto_2311898 ) ) ( not ( = ?auto_2311897 ?auto_2311899 ) ) ( not ( = ?auto_2311897 ?auto_2311900 ) ) ( not ( = ?auto_2311897 ?auto_2311901 ) ) ( not ( = ?auto_2311897 ?auto_2311902 ) ) ( not ( = ?auto_2311897 ?auto_2311903 ) ) ( not ( = ?auto_2311897 ?auto_2311904 ) ) ( not ( = ?auto_2311897 ?auto_2311908 ) ) ( not ( = ?auto_2311898 ?auto_2311899 ) ) ( not ( = ?auto_2311898 ?auto_2311900 ) ) ( not ( = ?auto_2311898 ?auto_2311901 ) ) ( not ( = ?auto_2311898 ?auto_2311902 ) ) ( not ( = ?auto_2311898 ?auto_2311903 ) ) ( not ( = ?auto_2311898 ?auto_2311904 ) ) ( not ( = ?auto_2311898 ?auto_2311908 ) ) ( not ( = ?auto_2311899 ?auto_2311900 ) ) ( not ( = ?auto_2311899 ?auto_2311901 ) ) ( not ( = ?auto_2311899 ?auto_2311902 ) ) ( not ( = ?auto_2311899 ?auto_2311903 ) ) ( not ( = ?auto_2311899 ?auto_2311904 ) ) ( not ( = ?auto_2311899 ?auto_2311908 ) ) ( not ( = ?auto_2311900 ?auto_2311901 ) ) ( not ( = ?auto_2311900 ?auto_2311902 ) ) ( not ( = ?auto_2311900 ?auto_2311903 ) ) ( not ( = ?auto_2311900 ?auto_2311904 ) ) ( not ( = ?auto_2311900 ?auto_2311908 ) ) ( not ( = ?auto_2311901 ?auto_2311902 ) ) ( not ( = ?auto_2311901 ?auto_2311903 ) ) ( not ( = ?auto_2311901 ?auto_2311904 ) ) ( not ( = ?auto_2311901 ?auto_2311908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311902 ?auto_2311903 ?auto_2311904 )
      ( MAKE-13CRATE-VERIFY ?auto_2311891 ?auto_2311892 ?auto_2311893 ?auto_2311894 ?auto_2311895 ?auto_2311896 ?auto_2311897 ?auto_2311898 ?auto_2311899 ?auto_2311900 ?auto_2311901 ?auto_2311902 ?auto_2311903 ?auto_2311904 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2312074 - SURFACE
      ?auto_2312075 - SURFACE
      ?auto_2312076 - SURFACE
      ?auto_2312077 - SURFACE
      ?auto_2312078 - SURFACE
      ?auto_2312079 - SURFACE
      ?auto_2312080 - SURFACE
      ?auto_2312081 - SURFACE
      ?auto_2312082 - SURFACE
      ?auto_2312083 - SURFACE
      ?auto_2312084 - SURFACE
      ?auto_2312085 - SURFACE
      ?auto_2312086 - SURFACE
      ?auto_2312087 - SURFACE
    )
    :vars
    (
      ?auto_2312088 - HOIST
      ?auto_2312092 - PLACE
      ?auto_2312091 - PLACE
      ?auto_2312093 - HOIST
      ?auto_2312089 - SURFACE
      ?auto_2312090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312088 ?auto_2312092 ) ( IS-CRATE ?auto_2312087 ) ( not ( = ?auto_2312086 ?auto_2312087 ) ) ( not ( = ?auto_2312085 ?auto_2312086 ) ) ( not ( = ?auto_2312085 ?auto_2312087 ) ) ( not ( = ?auto_2312091 ?auto_2312092 ) ) ( HOIST-AT ?auto_2312093 ?auto_2312091 ) ( not ( = ?auto_2312088 ?auto_2312093 ) ) ( AVAILABLE ?auto_2312093 ) ( SURFACE-AT ?auto_2312087 ?auto_2312091 ) ( ON ?auto_2312087 ?auto_2312089 ) ( CLEAR ?auto_2312087 ) ( not ( = ?auto_2312086 ?auto_2312089 ) ) ( not ( = ?auto_2312087 ?auto_2312089 ) ) ( not ( = ?auto_2312085 ?auto_2312089 ) ) ( TRUCK-AT ?auto_2312090 ?auto_2312092 ) ( SURFACE-AT ?auto_2312085 ?auto_2312092 ) ( CLEAR ?auto_2312085 ) ( IS-CRATE ?auto_2312086 ) ( AVAILABLE ?auto_2312088 ) ( IN ?auto_2312086 ?auto_2312090 ) ( ON ?auto_2312075 ?auto_2312074 ) ( ON ?auto_2312076 ?auto_2312075 ) ( ON ?auto_2312077 ?auto_2312076 ) ( ON ?auto_2312078 ?auto_2312077 ) ( ON ?auto_2312079 ?auto_2312078 ) ( ON ?auto_2312080 ?auto_2312079 ) ( ON ?auto_2312081 ?auto_2312080 ) ( ON ?auto_2312082 ?auto_2312081 ) ( ON ?auto_2312083 ?auto_2312082 ) ( ON ?auto_2312084 ?auto_2312083 ) ( ON ?auto_2312085 ?auto_2312084 ) ( not ( = ?auto_2312074 ?auto_2312075 ) ) ( not ( = ?auto_2312074 ?auto_2312076 ) ) ( not ( = ?auto_2312074 ?auto_2312077 ) ) ( not ( = ?auto_2312074 ?auto_2312078 ) ) ( not ( = ?auto_2312074 ?auto_2312079 ) ) ( not ( = ?auto_2312074 ?auto_2312080 ) ) ( not ( = ?auto_2312074 ?auto_2312081 ) ) ( not ( = ?auto_2312074 ?auto_2312082 ) ) ( not ( = ?auto_2312074 ?auto_2312083 ) ) ( not ( = ?auto_2312074 ?auto_2312084 ) ) ( not ( = ?auto_2312074 ?auto_2312085 ) ) ( not ( = ?auto_2312074 ?auto_2312086 ) ) ( not ( = ?auto_2312074 ?auto_2312087 ) ) ( not ( = ?auto_2312074 ?auto_2312089 ) ) ( not ( = ?auto_2312075 ?auto_2312076 ) ) ( not ( = ?auto_2312075 ?auto_2312077 ) ) ( not ( = ?auto_2312075 ?auto_2312078 ) ) ( not ( = ?auto_2312075 ?auto_2312079 ) ) ( not ( = ?auto_2312075 ?auto_2312080 ) ) ( not ( = ?auto_2312075 ?auto_2312081 ) ) ( not ( = ?auto_2312075 ?auto_2312082 ) ) ( not ( = ?auto_2312075 ?auto_2312083 ) ) ( not ( = ?auto_2312075 ?auto_2312084 ) ) ( not ( = ?auto_2312075 ?auto_2312085 ) ) ( not ( = ?auto_2312075 ?auto_2312086 ) ) ( not ( = ?auto_2312075 ?auto_2312087 ) ) ( not ( = ?auto_2312075 ?auto_2312089 ) ) ( not ( = ?auto_2312076 ?auto_2312077 ) ) ( not ( = ?auto_2312076 ?auto_2312078 ) ) ( not ( = ?auto_2312076 ?auto_2312079 ) ) ( not ( = ?auto_2312076 ?auto_2312080 ) ) ( not ( = ?auto_2312076 ?auto_2312081 ) ) ( not ( = ?auto_2312076 ?auto_2312082 ) ) ( not ( = ?auto_2312076 ?auto_2312083 ) ) ( not ( = ?auto_2312076 ?auto_2312084 ) ) ( not ( = ?auto_2312076 ?auto_2312085 ) ) ( not ( = ?auto_2312076 ?auto_2312086 ) ) ( not ( = ?auto_2312076 ?auto_2312087 ) ) ( not ( = ?auto_2312076 ?auto_2312089 ) ) ( not ( = ?auto_2312077 ?auto_2312078 ) ) ( not ( = ?auto_2312077 ?auto_2312079 ) ) ( not ( = ?auto_2312077 ?auto_2312080 ) ) ( not ( = ?auto_2312077 ?auto_2312081 ) ) ( not ( = ?auto_2312077 ?auto_2312082 ) ) ( not ( = ?auto_2312077 ?auto_2312083 ) ) ( not ( = ?auto_2312077 ?auto_2312084 ) ) ( not ( = ?auto_2312077 ?auto_2312085 ) ) ( not ( = ?auto_2312077 ?auto_2312086 ) ) ( not ( = ?auto_2312077 ?auto_2312087 ) ) ( not ( = ?auto_2312077 ?auto_2312089 ) ) ( not ( = ?auto_2312078 ?auto_2312079 ) ) ( not ( = ?auto_2312078 ?auto_2312080 ) ) ( not ( = ?auto_2312078 ?auto_2312081 ) ) ( not ( = ?auto_2312078 ?auto_2312082 ) ) ( not ( = ?auto_2312078 ?auto_2312083 ) ) ( not ( = ?auto_2312078 ?auto_2312084 ) ) ( not ( = ?auto_2312078 ?auto_2312085 ) ) ( not ( = ?auto_2312078 ?auto_2312086 ) ) ( not ( = ?auto_2312078 ?auto_2312087 ) ) ( not ( = ?auto_2312078 ?auto_2312089 ) ) ( not ( = ?auto_2312079 ?auto_2312080 ) ) ( not ( = ?auto_2312079 ?auto_2312081 ) ) ( not ( = ?auto_2312079 ?auto_2312082 ) ) ( not ( = ?auto_2312079 ?auto_2312083 ) ) ( not ( = ?auto_2312079 ?auto_2312084 ) ) ( not ( = ?auto_2312079 ?auto_2312085 ) ) ( not ( = ?auto_2312079 ?auto_2312086 ) ) ( not ( = ?auto_2312079 ?auto_2312087 ) ) ( not ( = ?auto_2312079 ?auto_2312089 ) ) ( not ( = ?auto_2312080 ?auto_2312081 ) ) ( not ( = ?auto_2312080 ?auto_2312082 ) ) ( not ( = ?auto_2312080 ?auto_2312083 ) ) ( not ( = ?auto_2312080 ?auto_2312084 ) ) ( not ( = ?auto_2312080 ?auto_2312085 ) ) ( not ( = ?auto_2312080 ?auto_2312086 ) ) ( not ( = ?auto_2312080 ?auto_2312087 ) ) ( not ( = ?auto_2312080 ?auto_2312089 ) ) ( not ( = ?auto_2312081 ?auto_2312082 ) ) ( not ( = ?auto_2312081 ?auto_2312083 ) ) ( not ( = ?auto_2312081 ?auto_2312084 ) ) ( not ( = ?auto_2312081 ?auto_2312085 ) ) ( not ( = ?auto_2312081 ?auto_2312086 ) ) ( not ( = ?auto_2312081 ?auto_2312087 ) ) ( not ( = ?auto_2312081 ?auto_2312089 ) ) ( not ( = ?auto_2312082 ?auto_2312083 ) ) ( not ( = ?auto_2312082 ?auto_2312084 ) ) ( not ( = ?auto_2312082 ?auto_2312085 ) ) ( not ( = ?auto_2312082 ?auto_2312086 ) ) ( not ( = ?auto_2312082 ?auto_2312087 ) ) ( not ( = ?auto_2312082 ?auto_2312089 ) ) ( not ( = ?auto_2312083 ?auto_2312084 ) ) ( not ( = ?auto_2312083 ?auto_2312085 ) ) ( not ( = ?auto_2312083 ?auto_2312086 ) ) ( not ( = ?auto_2312083 ?auto_2312087 ) ) ( not ( = ?auto_2312083 ?auto_2312089 ) ) ( not ( = ?auto_2312084 ?auto_2312085 ) ) ( not ( = ?auto_2312084 ?auto_2312086 ) ) ( not ( = ?auto_2312084 ?auto_2312087 ) ) ( not ( = ?auto_2312084 ?auto_2312089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2312085 ?auto_2312086 ?auto_2312087 )
      ( MAKE-13CRATE-VERIFY ?auto_2312074 ?auto_2312075 ?auto_2312076 ?auto_2312077 ?auto_2312078 ?auto_2312079 ?auto_2312080 ?auto_2312081 ?auto_2312082 ?auto_2312083 ?auto_2312084 ?auto_2312085 ?auto_2312086 ?auto_2312087 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2326258 - SURFACE
      ?auto_2326259 - SURFACE
      ?auto_2326260 - SURFACE
      ?auto_2326261 - SURFACE
      ?auto_2326262 - SURFACE
      ?auto_2326263 - SURFACE
      ?auto_2326264 - SURFACE
      ?auto_2326265 - SURFACE
      ?auto_2326266 - SURFACE
      ?auto_2326267 - SURFACE
      ?auto_2326268 - SURFACE
      ?auto_2326269 - SURFACE
      ?auto_2326270 - SURFACE
      ?auto_2326271 - SURFACE
      ?auto_2326272 - SURFACE
    )
    :vars
    (
      ?auto_2326274 - HOIST
      ?auto_2326273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326274 ?auto_2326273 ) ( SURFACE-AT ?auto_2326271 ?auto_2326273 ) ( CLEAR ?auto_2326271 ) ( LIFTING ?auto_2326274 ?auto_2326272 ) ( IS-CRATE ?auto_2326272 ) ( not ( = ?auto_2326271 ?auto_2326272 ) ) ( ON ?auto_2326259 ?auto_2326258 ) ( ON ?auto_2326260 ?auto_2326259 ) ( ON ?auto_2326261 ?auto_2326260 ) ( ON ?auto_2326262 ?auto_2326261 ) ( ON ?auto_2326263 ?auto_2326262 ) ( ON ?auto_2326264 ?auto_2326263 ) ( ON ?auto_2326265 ?auto_2326264 ) ( ON ?auto_2326266 ?auto_2326265 ) ( ON ?auto_2326267 ?auto_2326266 ) ( ON ?auto_2326268 ?auto_2326267 ) ( ON ?auto_2326269 ?auto_2326268 ) ( ON ?auto_2326270 ?auto_2326269 ) ( ON ?auto_2326271 ?auto_2326270 ) ( not ( = ?auto_2326258 ?auto_2326259 ) ) ( not ( = ?auto_2326258 ?auto_2326260 ) ) ( not ( = ?auto_2326258 ?auto_2326261 ) ) ( not ( = ?auto_2326258 ?auto_2326262 ) ) ( not ( = ?auto_2326258 ?auto_2326263 ) ) ( not ( = ?auto_2326258 ?auto_2326264 ) ) ( not ( = ?auto_2326258 ?auto_2326265 ) ) ( not ( = ?auto_2326258 ?auto_2326266 ) ) ( not ( = ?auto_2326258 ?auto_2326267 ) ) ( not ( = ?auto_2326258 ?auto_2326268 ) ) ( not ( = ?auto_2326258 ?auto_2326269 ) ) ( not ( = ?auto_2326258 ?auto_2326270 ) ) ( not ( = ?auto_2326258 ?auto_2326271 ) ) ( not ( = ?auto_2326258 ?auto_2326272 ) ) ( not ( = ?auto_2326259 ?auto_2326260 ) ) ( not ( = ?auto_2326259 ?auto_2326261 ) ) ( not ( = ?auto_2326259 ?auto_2326262 ) ) ( not ( = ?auto_2326259 ?auto_2326263 ) ) ( not ( = ?auto_2326259 ?auto_2326264 ) ) ( not ( = ?auto_2326259 ?auto_2326265 ) ) ( not ( = ?auto_2326259 ?auto_2326266 ) ) ( not ( = ?auto_2326259 ?auto_2326267 ) ) ( not ( = ?auto_2326259 ?auto_2326268 ) ) ( not ( = ?auto_2326259 ?auto_2326269 ) ) ( not ( = ?auto_2326259 ?auto_2326270 ) ) ( not ( = ?auto_2326259 ?auto_2326271 ) ) ( not ( = ?auto_2326259 ?auto_2326272 ) ) ( not ( = ?auto_2326260 ?auto_2326261 ) ) ( not ( = ?auto_2326260 ?auto_2326262 ) ) ( not ( = ?auto_2326260 ?auto_2326263 ) ) ( not ( = ?auto_2326260 ?auto_2326264 ) ) ( not ( = ?auto_2326260 ?auto_2326265 ) ) ( not ( = ?auto_2326260 ?auto_2326266 ) ) ( not ( = ?auto_2326260 ?auto_2326267 ) ) ( not ( = ?auto_2326260 ?auto_2326268 ) ) ( not ( = ?auto_2326260 ?auto_2326269 ) ) ( not ( = ?auto_2326260 ?auto_2326270 ) ) ( not ( = ?auto_2326260 ?auto_2326271 ) ) ( not ( = ?auto_2326260 ?auto_2326272 ) ) ( not ( = ?auto_2326261 ?auto_2326262 ) ) ( not ( = ?auto_2326261 ?auto_2326263 ) ) ( not ( = ?auto_2326261 ?auto_2326264 ) ) ( not ( = ?auto_2326261 ?auto_2326265 ) ) ( not ( = ?auto_2326261 ?auto_2326266 ) ) ( not ( = ?auto_2326261 ?auto_2326267 ) ) ( not ( = ?auto_2326261 ?auto_2326268 ) ) ( not ( = ?auto_2326261 ?auto_2326269 ) ) ( not ( = ?auto_2326261 ?auto_2326270 ) ) ( not ( = ?auto_2326261 ?auto_2326271 ) ) ( not ( = ?auto_2326261 ?auto_2326272 ) ) ( not ( = ?auto_2326262 ?auto_2326263 ) ) ( not ( = ?auto_2326262 ?auto_2326264 ) ) ( not ( = ?auto_2326262 ?auto_2326265 ) ) ( not ( = ?auto_2326262 ?auto_2326266 ) ) ( not ( = ?auto_2326262 ?auto_2326267 ) ) ( not ( = ?auto_2326262 ?auto_2326268 ) ) ( not ( = ?auto_2326262 ?auto_2326269 ) ) ( not ( = ?auto_2326262 ?auto_2326270 ) ) ( not ( = ?auto_2326262 ?auto_2326271 ) ) ( not ( = ?auto_2326262 ?auto_2326272 ) ) ( not ( = ?auto_2326263 ?auto_2326264 ) ) ( not ( = ?auto_2326263 ?auto_2326265 ) ) ( not ( = ?auto_2326263 ?auto_2326266 ) ) ( not ( = ?auto_2326263 ?auto_2326267 ) ) ( not ( = ?auto_2326263 ?auto_2326268 ) ) ( not ( = ?auto_2326263 ?auto_2326269 ) ) ( not ( = ?auto_2326263 ?auto_2326270 ) ) ( not ( = ?auto_2326263 ?auto_2326271 ) ) ( not ( = ?auto_2326263 ?auto_2326272 ) ) ( not ( = ?auto_2326264 ?auto_2326265 ) ) ( not ( = ?auto_2326264 ?auto_2326266 ) ) ( not ( = ?auto_2326264 ?auto_2326267 ) ) ( not ( = ?auto_2326264 ?auto_2326268 ) ) ( not ( = ?auto_2326264 ?auto_2326269 ) ) ( not ( = ?auto_2326264 ?auto_2326270 ) ) ( not ( = ?auto_2326264 ?auto_2326271 ) ) ( not ( = ?auto_2326264 ?auto_2326272 ) ) ( not ( = ?auto_2326265 ?auto_2326266 ) ) ( not ( = ?auto_2326265 ?auto_2326267 ) ) ( not ( = ?auto_2326265 ?auto_2326268 ) ) ( not ( = ?auto_2326265 ?auto_2326269 ) ) ( not ( = ?auto_2326265 ?auto_2326270 ) ) ( not ( = ?auto_2326265 ?auto_2326271 ) ) ( not ( = ?auto_2326265 ?auto_2326272 ) ) ( not ( = ?auto_2326266 ?auto_2326267 ) ) ( not ( = ?auto_2326266 ?auto_2326268 ) ) ( not ( = ?auto_2326266 ?auto_2326269 ) ) ( not ( = ?auto_2326266 ?auto_2326270 ) ) ( not ( = ?auto_2326266 ?auto_2326271 ) ) ( not ( = ?auto_2326266 ?auto_2326272 ) ) ( not ( = ?auto_2326267 ?auto_2326268 ) ) ( not ( = ?auto_2326267 ?auto_2326269 ) ) ( not ( = ?auto_2326267 ?auto_2326270 ) ) ( not ( = ?auto_2326267 ?auto_2326271 ) ) ( not ( = ?auto_2326267 ?auto_2326272 ) ) ( not ( = ?auto_2326268 ?auto_2326269 ) ) ( not ( = ?auto_2326268 ?auto_2326270 ) ) ( not ( = ?auto_2326268 ?auto_2326271 ) ) ( not ( = ?auto_2326268 ?auto_2326272 ) ) ( not ( = ?auto_2326269 ?auto_2326270 ) ) ( not ( = ?auto_2326269 ?auto_2326271 ) ) ( not ( = ?auto_2326269 ?auto_2326272 ) ) ( not ( = ?auto_2326270 ?auto_2326271 ) ) ( not ( = ?auto_2326270 ?auto_2326272 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2326271 ?auto_2326272 )
      ( MAKE-14CRATE-VERIFY ?auto_2326258 ?auto_2326259 ?auto_2326260 ?auto_2326261 ?auto_2326262 ?auto_2326263 ?auto_2326264 ?auto_2326265 ?auto_2326266 ?auto_2326267 ?auto_2326268 ?auto_2326269 ?auto_2326270 ?auto_2326271 ?auto_2326272 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2326418 - SURFACE
      ?auto_2326419 - SURFACE
      ?auto_2326420 - SURFACE
      ?auto_2326421 - SURFACE
      ?auto_2326422 - SURFACE
      ?auto_2326423 - SURFACE
      ?auto_2326424 - SURFACE
      ?auto_2326425 - SURFACE
      ?auto_2326426 - SURFACE
      ?auto_2326427 - SURFACE
      ?auto_2326428 - SURFACE
      ?auto_2326429 - SURFACE
      ?auto_2326430 - SURFACE
      ?auto_2326431 - SURFACE
      ?auto_2326432 - SURFACE
    )
    :vars
    (
      ?auto_2326435 - HOIST
      ?auto_2326434 - PLACE
      ?auto_2326433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326435 ?auto_2326434 ) ( SURFACE-AT ?auto_2326431 ?auto_2326434 ) ( CLEAR ?auto_2326431 ) ( IS-CRATE ?auto_2326432 ) ( not ( = ?auto_2326431 ?auto_2326432 ) ) ( TRUCK-AT ?auto_2326433 ?auto_2326434 ) ( AVAILABLE ?auto_2326435 ) ( IN ?auto_2326432 ?auto_2326433 ) ( ON ?auto_2326431 ?auto_2326430 ) ( not ( = ?auto_2326430 ?auto_2326431 ) ) ( not ( = ?auto_2326430 ?auto_2326432 ) ) ( ON ?auto_2326419 ?auto_2326418 ) ( ON ?auto_2326420 ?auto_2326419 ) ( ON ?auto_2326421 ?auto_2326420 ) ( ON ?auto_2326422 ?auto_2326421 ) ( ON ?auto_2326423 ?auto_2326422 ) ( ON ?auto_2326424 ?auto_2326423 ) ( ON ?auto_2326425 ?auto_2326424 ) ( ON ?auto_2326426 ?auto_2326425 ) ( ON ?auto_2326427 ?auto_2326426 ) ( ON ?auto_2326428 ?auto_2326427 ) ( ON ?auto_2326429 ?auto_2326428 ) ( ON ?auto_2326430 ?auto_2326429 ) ( not ( = ?auto_2326418 ?auto_2326419 ) ) ( not ( = ?auto_2326418 ?auto_2326420 ) ) ( not ( = ?auto_2326418 ?auto_2326421 ) ) ( not ( = ?auto_2326418 ?auto_2326422 ) ) ( not ( = ?auto_2326418 ?auto_2326423 ) ) ( not ( = ?auto_2326418 ?auto_2326424 ) ) ( not ( = ?auto_2326418 ?auto_2326425 ) ) ( not ( = ?auto_2326418 ?auto_2326426 ) ) ( not ( = ?auto_2326418 ?auto_2326427 ) ) ( not ( = ?auto_2326418 ?auto_2326428 ) ) ( not ( = ?auto_2326418 ?auto_2326429 ) ) ( not ( = ?auto_2326418 ?auto_2326430 ) ) ( not ( = ?auto_2326418 ?auto_2326431 ) ) ( not ( = ?auto_2326418 ?auto_2326432 ) ) ( not ( = ?auto_2326419 ?auto_2326420 ) ) ( not ( = ?auto_2326419 ?auto_2326421 ) ) ( not ( = ?auto_2326419 ?auto_2326422 ) ) ( not ( = ?auto_2326419 ?auto_2326423 ) ) ( not ( = ?auto_2326419 ?auto_2326424 ) ) ( not ( = ?auto_2326419 ?auto_2326425 ) ) ( not ( = ?auto_2326419 ?auto_2326426 ) ) ( not ( = ?auto_2326419 ?auto_2326427 ) ) ( not ( = ?auto_2326419 ?auto_2326428 ) ) ( not ( = ?auto_2326419 ?auto_2326429 ) ) ( not ( = ?auto_2326419 ?auto_2326430 ) ) ( not ( = ?auto_2326419 ?auto_2326431 ) ) ( not ( = ?auto_2326419 ?auto_2326432 ) ) ( not ( = ?auto_2326420 ?auto_2326421 ) ) ( not ( = ?auto_2326420 ?auto_2326422 ) ) ( not ( = ?auto_2326420 ?auto_2326423 ) ) ( not ( = ?auto_2326420 ?auto_2326424 ) ) ( not ( = ?auto_2326420 ?auto_2326425 ) ) ( not ( = ?auto_2326420 ?auto_2326426 ) ) ( not ( = ?auto_2326420 ?auto_2326427 ) ) ( not ( = ?auto_2326420 ?auto_2326428 ) ) ( not ( = ?auto_2326420 ?auto_2326429 ) ) ( not ( = ?auto_2326420 ?auto_2326430 ) ) ( not ( = ?auto_2326420 ?auto_2326431 ) ) ( not ( = ?auto_2326420 ?auto_2326432 ) ) ( not ( = ?auto_2326421 ?auto_2326422 ) ) ( not ( = ?auto_2326421 ?auto_2326423 ) ) ( not ( = ?auto_2326421 ?auto_2326424 ) ) ( not ( = ?auto_2326421 ?auto_2326425 ) ) ( not ( = ?auto_2326421 ?auto_2326426 ) ) ( not ( = ?auto_2326421 ?auto_2326427 ) ) ( not ( = ?auto_2326421 ?auto_2326428 ) ) ( not ( = ?auto_2326421 ?auto_2326429 ) ) ( not ( = ?auto_2326421 ?auto_2326430 ) ) ( not ( = ?auto_2326421 ?auto_2326431 ) ) ( not ( = ?auto_2326421 ?auto_2326432 ) ) ( not ( = ?auto_2326422 ?auto_2326423 ) ) ( not ( = ?auto_2326422 ?auto_2326424 ) ) ( not ( = ?auto_2326422 ?auto_2326425 ) ) ( not ( = ?auto_2326422 ?auto_2326426 ) ) ( not ( = ?auto_2326422 ?auto_2326427 ) ) ( not ( = ?auto_2326422 ?auto_2326428 ) ) ( not ( = ?auto_2326422 ?auto_2326429 ) ) ( not ( = ?auto_2326422 ?auto_2326430 ) ) ( not ( = ?auto_2326422 ?auto_2326431 ) ) ( not ( = ?auto_2326422 ?auto_2326432 ) ) ( not ( = ?auto_2326423 ?auto_2326424 ) ) ( not ( = ?auto_2326423 ?auto_2326425 ) ) ( not ( = ?auto_2326423 ?auto_2326426 ) ) ( not ( = ?auto_2326423 ?auto_2326427 ) ) ( not ( = ?auto_2326423 ?auto_2326428 ) ) ( not ( = ?auto_2326423 ?auto_2326429 ) ) ( not ( = ?auto_2326423 ?auto_2326430 ) ) ( not ( = ?auto_2326423 ?auto_2326431 ) ) ( not ( = ?auto_2326423 ?auto_2326432 ) ) ( not ( = ?auto_2326424 ?auto_2326425 ) ) ( not ( = ?auto_2326424 ?auto_2326426 ) ) ( not ( = ?auto_2326424 ?auto_2326427 ) ) ( not ( = ?auto_2326424 ?auto_2326428 ) ) ( not ( = ?auto_2326424 ?auto_2326429 ) ) ( not ( = ?auto_2326424 ?auto_2326430 ) ) ( not ( = ?auto_2326424 ?auto_2326431 ) ) ( not ( = ?auto_2326424 ?auto_2326432 ) ) ( not ( = ?auto_2326425 ?auto_2326426 ) ) ( not ( = ?auto_2326425 ?auto_2326427 ) ) ( not ( = ?auto_2326425 ?auto_2326428 ) ) ( not ( = ?auto_2326425 ?auto_2326429 ) ) ( not ( = ?auto_2326425 ?auto_2326430 ) ) ( not ( = ?auto_2326425 ?auto_2326431 ) ) ( not ( = ?auto_2326425 ?auto_2326432 ) ) ( not ( = ?auto_2326426 ?auto_2326427 ) ) ( not ( = ?auto_2326426 ?auto_2326428 ) ) ( not ( = ?auto_2326426 ?auto_2326429 ) ) ( not ( = ?auto_2326426 ?auto_2326430 ) ) ( not ( = ?auto_2326426 ?auto_2326431 ) ) ( not ( = ?auto_2326426 ?auto_2326432 ) ) ( not ( = ?auto_2326427 ?auto_2326428 ) ) ( not ( = ?auto_2326427 ?auto_2326429 ) ) ( not ( = ?auto_2326427 ?auto_2326430 ) ) ( not ( = ?auto_2326427 ?auto_2326431 ) ) ( not ( = ?auto_2326427 ?auto_2326432 ) ) ( not ( = ?auto_2326428 ?auto_2326429 ) ) ( not ( = ?auto_2326428 ?auto_2326430 ) ) ( not ( = ?auto_2326428 ?auto_2326431 ) ) ( not ( = ?auto_2326428 ?auto_2326432 ) ) ( not ( = ?auto_2326429 ?auto_2326430 ) ) ( not ( = ?auto_2326429 ?auto_2326431 ) ) ( not ( = ?auto_2326429 ?auto_2326432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2326430 ?auto_2326431 ?auto_2326432 )
      ( MAKE-14CRATE-VERIFY ?auto_2326418 ?auto_2326419 ?auto_2326420 ?auto_2326421 ?auto_2326422 ?auto_2326423 ?auto_2326424 ?auto_2326425 ?auto_2326426 ?auto_2326427 ?auto_2326428 ?auto_2326429 ?auto_2326430 ?auto_2326431 ?auto_2326432 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2326593 - SURFACE
      ?auto_2326594 - SURFACE
      ?auto_2326595 - SURFACE
      ?auto_2326596 - SURFACE
      ?auto_2326597 - SURFACE
      ?auto_2326598 - SURFACE
      ?auto_2326599 - SURFACE
      ?auto_2326600 - SURFACE
      ?auto_2326601 - SURFACE
      ?auto_2326602 - SURFACE
      ?auto_2326603 - SURFACE
      ?auto_2326604 - SURFACE
      ?auto_2326605 - SURFACE
      ?auto_2326606 - SURFACE
      ?auto_2326607 - SURFACE
    )
    :vars
    (
      ?auto_2326611 - HOIST
      ?auto_2326609 - PLACE
      ?auto_2326608 - TRUCK
      ?auto_2326610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326611 ?auto_2326609 ) ( SURFACE-AT ?auto_2326606 ?auto_2326609 ) ( CLEAR ?auto_2326606 ) ( IS-CRATE ?auto_2326607 ) ( not ( = ?auto_2326606 ?auto_2326607 ) ) ( AVAILABLE ?auto_2326611 ) ( IN ?auto_2326607 ?auto_2326608 ) ( ON ?auto_2326606 ?auto_2326605 ) ( not ( = ?auto_2326605 ?auto_2326606 ) ) ( not ( = ?auto_2326605 ?auto_2326607 ) ) ( TRUCK-AT ?auto_2326608 ?auto_2326610 ) ( not ( = ?auto_2326610 ?auto_2326609 ) ) ( ON ?auto_2326594 ?auto_2326593 ) ( ON ?auto_2326595 ?auto_2326594 ) ( ON ?auto_2326596 ?auto_2326595 ) ( ON ?auto_2326597 ?auto_2326596 ) ( ON ?auto_2326598 ?auto_2326597 ) ( ON ?auto_2326599 ?auto_2326598 ) ( ON ?auto_2326600 ?auto_2326599 ) ( ON ?auto_2326601 ?auto_2326600 ) ( ON ?auto_2326602 ?auto_2326601 ) ( ON ?auto_2326603 ?auto_2326602 ) ( ON ?auto_2326604 ?auto_2326603 ) ( ON ?auto_2326605 ?auto_2326604 ) ( not ( = ?auto_2326593 ?auto_2326594 ) ) ( not ( = ?auto_2326593 ?auto_2326595 ) ) ( not ( = ?auto_2326593 ?auto_2326596 ) ) ( not ( = ?auto_2326593 ?auto_2326597 ) ) ( not ( = ?auto_2326593 ?auto_2326598 ) ) ( not ( = ?auto_2326593 ?auto_2326599 ) ) ( not ( = ?auto_2326593 ?auto_2326600 ) ) ( not ( = ?auto_2326593 ?auto_2326601 ) ) ( not ( = ?auto_2326593 ?auto_2326602 ) ) ( not ( = ?auto_2326593 ?auto_2326603 ) ) ( not ( = ?auto_2326593 ?auto_2326604 ) ) ( not ( = ?auto_2326593 ?auto_2326605 ) ) ( not ( = ?auto_2326593 ?auto_2326606 ) ) ( not ( = ?auto_2326593 ?auto_2326607 ) ) ( not ( = ?auto_2326594 ?auto_2326595 ) ) ( not ( = ?auto_2326594 ?auto_2326596 ) ) ( not ( = ?auto_2326594 ?auto_2326597 ) ) ( not ( = ?auto_2326594 ?auto_2326598 ) ) ( not ( = ?auto_2326594 ?auto_2326599 ) ) ( not ( = ?auto_2326594 ?auto_2326600 ) ) ( not ( = ?auto_2326594 ?auto_2326601 ) ) ( not ( = ?auto_2326594 ?auto_2326602 ) ) ( not ( = ?auto_2326594 ?auto_2326603 ) ) ( not ( = ?auto_2326594 ?auto_2326604 ) ) ( not ( = ?auto_2326594 ?auto_2326605 ) ) ( not ( = ?auto_2326594 ?auto_2326606 ) ) ( not ( = ?auto_2326594 ?auto_2326607 ) ) ( not ( = ?auto_2326595 ?auto_2326596 ) ) ( not ( = ?auto_2326595 ?auto_2326597 ) ) ( not ( = ?auto_2326595 ?auto_2326598 ) ) ( not ( = ?auto_2326595 ?auto_2326599 ) ) ( not ( = ?auto_2326595 ?auto_2326600 ) ) ( not ( = ?auto_2326595 ?auto_2326601 ) ) ( not ( = ?auto_2326595 ?auto_2326602 ) ) ( not ( = ?auto_2326595 ?auto_2326603 ) ) ( not ( = ?auto_2326595 ?auto_2326604 ) ) ( not ( = ?auto_2326595 ?auto_2326605 ) ) ( not ( = ?auto_2326595 ?auto_2326606 ) ) ( not ( = ?auto_2326595 ?auto_2326607 ) ) ( not ( = ?auto_2326596 ?auto_2326597 ) ) ( not ( = ?auto_2326596 ?auto_2326598 ) ) ( not ( = ?auto_2326596 ?auto_2326599 ) ) ( not ( = ?auto_2326596 ?auto_2326600 ) ) ( not ( = ?auto_2326596 ?auto_2326601 ) ) ( not ( = ?auto_2326596 ?auto_2326602 ) ) ( not ( = ?auto_2326596 ?auto_2326603 ) ) ( not ( = ?auto_2326596 ?auto_2326604 ) ) ( not ( = ?auto_2326596 ?auto_2326605 ) ) ( not ( = ?auto_2326596 ?auto_2326606 ) ) ( not ( = ?auto_2326596 ?auto_2326607 ) ) ( not ( = ?auto_2326597 ?auto_2326598 ) ) ( not ( = ?auto_2326597 ?auto_2326599 ) ) ( not ( = ?auto_2326597 ?auto_2326600 ) ) ( not ( = ?auto_2326597 ?auto_2326601 ) ) ( not ( = ?auto_2326597 ?auto_2326602 ) ) ( not ( = ?auto_2326597 ?auto_2326603 ) ) ( not ( = ?auto_2326597 ?auto_2326604 ) ) ( not ( = ?auto_2326597 ?auto_2326605 ) ) ( not ( = ?auto_2326597 ?auto_2326606 ) ) ( not ( = ?auto_2326597 ?auto_2326607 ) ) ( not ( = ?auto_2326598 ?auto_2326599 ) ) ( not ( = ?auto_2326598 ?auto_2326600 ) ) ( not ( = ?auto_2326598 ?auto_2326601 ) ) ( not ( = ?auto_2326598 ?auto_2326602 ) ) ( not ( = ?auto_2326598 ?auto_2326603 ) ) ( not ( = ?auto_2326598 ?auto_2326604 ) ) ( not ( = ?auto_2326598 ?auto_2326605 ) ) ( not ( = ?auto_2326598 ?auto_2326606 ) ) ( not ( = ?auto_2326598 ?auto_2326607 ) ) ( not ( = ?auto_2326599 ?auto_2326600 ) ) ( not ( = ?auto_2326599 ?auto_2326601 ) ) ( not ( = ?auto_2326599 ?auto_2326602 ) ) ( not ( = ?auto_2326599 ?auto_2326603 ) ) ( not ( = ?auto_2326599 ?auto_2326604 ) ) ( not ( = ?auto_2326599 ?auto_2326605 ) ) ( not ( = ?auto_2326599 ?auto_2326606 ) ) ( not ( = ?auto_2326599 ?auto_2326607 ) ) ( not ( = ?auto_2326600 ?auto_2326601 ) ) ( not ( = ?auto_2326600 ?auto_2326602 ) ) ( not ( = ?auto_2326600 ?auto_2326603 ) ) ( not ( = ?auto_2326600 ?auto_2326604 ) ) ( not ( = ?auto_2326600 ?auto_2326605 ) ) ( not ( = ?auto_2326600 ?auto_2326606 ) ) ( not ( = ?auto_2326600 ?auto_2326607 ) ) ( not ( = ?auto_2326601 ?auto_2326602 ) ) ( not ( = ?auto_2326601 ?auto_2326603 ) ) ( not ( = ?auto_2326601 ?auto_2326604 ) ) ( not ( = ?auto_2326601 ?auto_2326605 ) ) ( not ( = ?auto_2326601 ?auto_2326606 ) ) ( not ( = ?auto_2326601 ?auto_2326607 ) ) ( not ( = ?auto_2326602 ?auto_2326603 ) ) ( not ( = ?auto_2326602 ?auto_2326604 ) ) ( not ( = ?auto_2326602 ?auto_2326605 ) ) ( not ( = ?auto_2326602 ?auto_2326606 ) ) ( not ( = ?auto_2326602 ?auto_2326607 ) ) ( not ( = ?auto_2326603 ?auto_2326604 ) ) ( not ( = ?auto_2326603 ?auto_2326605 ) ) ( not ( = ?auto_2326603 ?auto_2326606 ) ) ( not ( = ?auto_2326603 ?auto_2326607 ) ) ( not ( = ?auto_2326604 ?auto_2326605 ) ) ( not ( = ?auto_2326604 ?auto_2326606 ) ) ( not ( = ?auto_2326604 ?auto_2326607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2326605 ?auto_2326606 ?auto_2326607 )
      ( MAKE-14CRATE-VERIFY ?auto_2326593 ?auto_2326594 ?auto_2326595 ?auto_2326596 ?auto_2326597 ?auto_2326598 ?auto_2326599 ?auto_2326600 ?auto_2326601 ?auto_2326602 ?auto_2326603 ?auto_2326604 ?auto_2326605 ?auto_2326606 ?auto_2326607 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2326782 - SURFACE
      ?auto_2326783 - SURFACE
      ?auto_2326784 - SURFACE
      ?auto_2326785 - SURFACE
      ?auto_2326786 - SURFACE
      ?auto_2326787 - SURFACE
      ?auto_2326788 - SURFACE
      ?auto_2326789 - SURFACE
      ?auto_2326790 - SURFACE
      ?auto_2326791 - SURFACE
      ?auto_2326792 - SURFACE
      ?auto_2326793 - SURFACE
      ?auto_2326794 - SURFACE
      ?auto_2326795 - SURFACE
      ?auto_2326796 - SURFACE
    )
    :vars
    (
      ?auto_2326801 - HOIST
      ?auto_2326798 - PLACE
      ?auto_2326797 - TRUCK
      ?auto_2326800 - PLACE
      ?auto_2326799 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326801 ?auto_2326798 ) ( SURFACE-AT ?auto_2326795 ?auto_2326798 ) ( CLEAR ?auto_2326795 ) ( IS-CRATE ?auto_2326796 ) ( not ( = ?auto_2326795 ?auto_2326796 ) ) ( AVAILABLE ?auto_2326801 ) ( ON ?auto_2326795 ?auto_2326794 ) ( not ( = ?auto_2326794 ?auto_2326795 ) ) ( not ( = ?auto_2326794 ?auto_2326796 ) ) ( TRUCK-AT ?auto_2326797 ?auto_2326800 ) ( not ( = ?auto_2326800 ?auto_2326798 ) ) ( HOIST-AT ?auto_2326799 ?auto_2326800 ) ( LIFTING ?auto_2326799 ?auto_2326796 ) ( not ( = ?auto_2326801 ?auto_2326799 ) ) ( ON ?auto_2326783 ?auto_2326782 ) ( ON ?auto_2326784 ?auto_2326783 ) ( ON ?auto_2326785 ?auto_2326784 ) ( ON ?auto_2326786 ?auto_2326785 ) ( ON ?auto_2326787 ?auto_2326786 ) ( ON ?auto_2326788 ?auto_2326787 ) ( ON ?auto_2326789 ?auto_2326788 ) ( ON ?auto_2326790 ?auto_2326789 ) ( ON ?auto_2326791 ?auto_2326790 ) ( ON ?auto_2326792 ?auto_2326791 ) ( ON ?auto_2326793 ?auto_2326792 ) ( ON ?auto_2326794 ?auto_2326793 ) ( not ( = ?auto_2326782 ?auto_2326783 ) ) ( not ( = ?auto_2326782 ?auto_2326784 ) ) ( not ( = ?auto_2326782 ?auto_2326785 ) ) ( not ( = ?auto_2326782 ?auto_2326786 ) ) ( not ( = ?auto_2326782 ?auto_2326787 ) ) ( not ( = ?auto_2326782 ?auto_2326788 ) ) ( not ( = ?auto_2326782 ?auto_2326789 ) ) ( not ( = ?auto_2326782 ?auto_2326790 ) ) ( not ( = ?auto_2326782 ?auto_2326791 ) ) ( not ( = ?auto_2326782 ?auto_2326792 ) ) ( not ( = ?auto_2326782 ?auto_2326793 ) ) ( not ( = ?auto_2326782 ?auto_2326794 ) ) ( not ( = ?auto_2326782 ?auto_2326795 ) ) ( not ( = ?auto_2326782 ?auto_2326796 ) ) ( not ( = ?auto_2326783 ?auto_2326784 ) ) ( not ( = ?auto_2326783 ?auto_2326785 ) ) ( not ( = ?auto_2326783 ?auto_2326786 ) ) ( not ( = ?auto_2326783 ?auto_2326787 ) ) ( not ( = ?auto_2326783 ?auto_2326788 ) ) ( not ( = ?auto_2326783 ?auto_2326789 ) ) ( not ( = ?auto_2326783 ?auto_2326790 ) ) ( not ( = ?auto_2326783 ?auto_2326791 ) ) ( not ( = ?auto_2326783 ?auto_2326792 ) ) ( not ( = ?auto_2326783 ?auto_2326793 ) ) ( not ( = ?auto_2326783 ?auto_2326794 ) ) ( not ( = ?auto_2326783 ?auto_2326795 ) ) ( not ( = ?auto_2326783 ?auto_2326796 ) ) ( not ( = ?auto_2326784 ?auto_2326785 ) ) ( not ( = ?auto_2326784 ?auto_2326786 ) ) ( not ( = ?auto_2326784 ?auto_2326787 ) ) ( not ( = ?auto_2326784 ?auto_2326788 ) ) ( not ( = ?auto_2326784 ?auto_2326789 ) ) ( not ( = ?auto_2326784 ?auto_2326790 ) ) ( not ( = ?auto_2326784 ?auto_2326791 ) ) ( not ( = ?auto_2326784 ?auto_2326792 ) ) ( not ( = ?auto_2326784 ?auto_2326793 ) ) ( not ( = ?auto_2326784 ?auto_2326794 ) ) ( not ( = ?auto_2326784 ?auto_2326795 ) ) ( not ( = ?auto_2326784 ?auto_2326796 ) ) ( not ( = ?auto_2326785 ?auto_2326786 ) ) ( not ( = ?auto_2326785 ?auto_2326787 ) ) ( not ( = ?auto_2326785 ?auto_2326788 ) ) ( not ( = ?auto_2326785 ?auto_2326789 ) ) ( not ( = ?auto_2326785 ?auto_2326790 ) ) ( not ( = ?auto_2326785 ?auto_2326791 ) ) ( not ( = ?auto_2326785 ?auto_2326792 ) ) ( not ( = ?auto_2326785 ?auto_2326793 ) ) ( not ( = ?auto_2326785 ?auto_2326794 ) ) ( not ( = ?auto_2326785 ?auto_2326795 ) ) ( not ( = ?auto_2326785 ?auto_2326796 ) ) ( not ( = ?auto_2326786 ?auto_2326787 ) ) ( not ( = ?auto_2326786 ?auto_2326788 ) ) ( not ( = ?auto_2326786 ?auto_2326789 ) ) ( not ( = ?auto_2326786 ?auto_2326790 ) ) ( not ( = ?auto_2326786 ?auto_2326791 ) ) ( not ( = ?auto_2326786 ?auto_2326792 ) ) ( not ( = ?auto_2326786 ?auto_2326793 ) ) ( not ( = ?auto_2326786 ?auto_2326794 ) ) ( not ( = ?auto_2326786 ?auto_2326795 ) ) ( not ( = ?auto_2326786 ?auto_2326796 ) ) ( not ( = ?auto_2326787 ?auto_2326788 ) ) ( not ( = ?auto_2326787 ?auto_2326789 ) ) ( not ( = ?auto_2326787 ?auto_2326790 ) ) ( not ( = ?auto_2326787 ?auto_2326791 ) ) ( not ( = ?auto_2326787 ?auto_2326792 ) ) ( not ( = ?auto_2326787 ?auto_2326793 ) ) ( not ( = ?auto_2326787 ?auto_2326794 ) ) ( not ( = ?auto_2326787 ?auto_2326795 ) ) ( not ( = ?auto_2326787 ?auto_2326796 ) ) ( not ( = ?auto_2326788 ?auto_2326789 ) ) ( not ( = ?auto_2326788 ?auto_2326790 ) ) ( not ( = ?auto_2326788 ?auto_2326791 ) ) ( not ( = ?auto_2326788 ?auto_2326792 ) ) ( not ( = ?auto_2326788 ?auto_2326793 ) ) ( not ( = ?auto_2326788 ?auto_2326794 ) ) ( not ( = ?auto_2326788 ?auto_2326795 ) ) ( not ( = ?auto_2326788 ?auto_2326796 ) ) ( not ( = ?auto_2326789 ?auto_2326790 ) ) ( not ( = ?auto_2326789 ?auto_2326791 ) ) ( not ( = ?auto_2326789 ?auto_2326792 ) ) ( not ( = ?auto_2326789 ?auto_2326793 ) ) ( not ( = ?auto_2326789 ?auto_2326794 ) ) ( not ( = ?auto_2326789 ?auto_2326795 ) ) ( not ( = ?auto_2326789 ?auto_2326796 ) ) ( not ( = ?auto_2326790 ?auto_2326791 ) ) ( not ( = ?auto_2326790 ?auto_2326792 ) ) ( not ( = ?auto_2326790 ?auto_2326793 ) ) ( not ( = ?auto_2326790 ?auto_2326794 ) ) ( not ( = ?auto_2326790 ?auto_2326795 ) ) ( not ( = ?auto_2326790 ?auto_2326796 ) ) ( not ( = ?auto_2326791 ?auto_2326792 ) ) ( not ( = ?auto_2326791 ?auto_2326793 ) ) ( not ( = ?auto_2326791 ?auto_2326794 ) ) ( not ( = ?auto_2326791 ?auto_2326795 ) ) ( not ( = ?auto_2326791 ?auto_2326796 ) ) ( not ( = ?auto_2326792 ?auto_2326793 ) ) ( not ( = ?auto_2326792 ?auto_2326794 ) ) ( not ( = ?auto_2326792 ?auto_2326795 ) ) ( not ( = ?auto_2326792 ?auto_2326796 ) ) ( not ( = ?auto_2326793 ?auto_2326794 ) ) ( not ( = ?auto_2326793 ?auto_2326795 ) ) ( not ( = ?auto_2326793 ?auto_2326796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2326794 ?auto_2326795 ?auto_2326796 )
      ( MAKE-14CRATE-VERIFY ?auto_2326782 ?auto_2326783 ?auto_2326784 ?auto_2326785 ?auto_2326786 ?auto_2326787 ?auto_2326788 ?auto_2326789 ?auto_2326790 ?auto_2326791 ?auto_2326792 ?auto_2326793 ?auto_2326794 ?auto_2326795 ?auto_2326796 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2326985 - SURFACE
      ?auto_2326986 - SURFACE
      ?auto_2326987 - SURFACE
      ?auto_2326988 - SURFACE
      ?auto_2326989 - SURFACE
      ?auto_2326990 - SURFACE
      ?auto_2326991 - SURFACE
      ?auto_2326992 - SURFACE
      ?auto_2326993 - SURFACE
      ?auto_2326994 - SURFACE
      ?auto_2326995 - SURFACE
      ?auto_2326996 - SURFACE
      ?auto_2326997 - SURFACE
      ?auto_2326998 - SURFACE
      ?auto_2326999 - SURFACE
    )
    :vars
    (
      ?auto_2327002 - HOIST
      ?auto_2327004 - PLACE
      ?auto_2327005 - TRUCK
      ?auto_2327001 - PLACE
      ?auto_2327000 - HOIST
      ?auto_2327003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327002 ?auto_2327004 ) ( SURFACE-AT ?auto_2326998 ?auto_2327004 ) ( CLEAR ?auto_2326998 ) ( IS-CRATE ?auto_2326999 ) ( not ( = ?auto_2326998 ?auto_2326999 ) ) ( AVAILABLE ?auto_2327002 ) ( ON ?auto_2326998 ?auto_2326997 ) ( not ( = ?auto_2326997 ?auto_2326998 ) ) ( not ( = ?auto_2326997 ?auto_2326999 ) ) ( TRUCK-AT ?auto_2327005 ?auto_2327001 ) ( not ( = ?auto_2327001 ?auto_2327004 ) ) ( HOIST-AT ?auto_2327000 ?auto_2327001 ) ( not ( = ?auto_2327002 ?auto_2327000 ) ) ( AVAILABLE ?auto_2327000 ) ( SURFACE-AT ?auto_2326999 ?auto_2327001 ) ( ON ?auto_2326999 ?auto_2327003 ) ( CLEAR ?auto_2326999 ) ( not ( = ?auto_2326998 ?auto_2327003 ) ) ( not ( = ?auto_2326999 ?auto_2327003 ) ) ( not ( = ?auto_2326997 ?auto_2327003 ) ) ( ON ?auto_2326986 ?auto_2326985 ) ( ON ?auto_2326987 ?auto_2326986 ) ( ON ?auto_2326988 ?auto_2326987 ) ( ON ?auto_2326989 ?auto_2326988 ) ( ON ?auto_2326990 ?auto_2326989 ) ( ON ?auto_2326991 ?auto_2326990 ) ( ON ?auto_2326992 ?auto_2326991 ) ( ON ?auto_2326993 ?auto_2326992 ) ( ON ?auto_2326994 ?auto_2326993 ) ( ON ?auto_2326995 ?auto_2326994 ) ( ON ?auto_2326996 ?auto_2326995 ) ( ON ?auto_2326997 ?auto_2326996 ) ( not ( = ?auto_2326985 ?auto_2326986 ) ) ( not ( = ?auto_2326985 ?auto_2326987 ) ) ( not ( = ?auto_2326985 ?auto_2326988 ) ) ( not ( = ?auto_2326985 ?auto_2326989 ) ) ( not ( = ?auto_2326985 ?auto_2326990 ) ) ( not ( = ?auto_2326985 ?auto_2326991 ) ) ( not ( = ?auto_2326985 ?auto_2326992 ) ) ( not ( = ?auto_2326985 ?auto_2326993 ) ) ( not ( = ?auto_2326985 ?auto_2326994 ) ) ( not ( = ?auto_2326985 ?auto_2326995 ) ) ( not ( = ?auto_2326985 ?auto_2326996 ) ) ( not ( = ?auto_2326985 ?auto_2326997 ) ) ( not ( = ?auto_2326985 ?auto_2326998 ) ) ( not ( = ?auto_2326985 ?auto_2326999 ) ) ( not ( = ?auto_2326985 ?auto_2327003 ) ) ( not ( = ?auto_2326986 ?auto_2326987 ) ) ( not ( = ?auto_2326986 ?auto_2326988 ) ) ( not ( = ?auto_2326986 ?auto_2326989 ) ) ( not ( = ?auto_2326986 ?auto_2326990 ) ) ( not ( = ?auto_2326986 ?auto_2326991 ) ) ( not ( = ?auto_2326986 ?auto_2326992 ) ) ( not ( = ?auto_2326986 ?auto_2326993 ) ) ( not ( = ?auto_2326986 ?auto_2326994 ) ) ( not ( = ?auto_2326986 ?auto_2326995 ) ) ( not ( = ?auto_2326986 ?auto_2326996 ) ) ( not ( = ?auto_2326986 ?auto_2326997 ) ) ( not ( = ?auto_2326986 ?auto_2326998 ) ) ( not ( = ?auto_2326986 ?auto_2326999 ) ) ( not ( = ?auto_2326986 ?auto_2327003 ) ) ( not ( = ?auto_2326987 ?auto_2326988 ) ) ( not ( = ?auto_2326987 ?auto_2326989 ) ) ( not ( = ?auto_2326987 ?auto_2326990 ) ) ( not ( = ?auto_2326987 ?auto_2326991 ) ) ( not ( = ?auto_2326987 ?auto_2326992 ) ) ( not ( = ?auto_2326987 ?auto_2326993 ) ) ( not ( = ?auto_2326987 ?auto_2326994 ) ) ( not ( = ?auto_2326987 ?auto_2326995 ) ) ( not ( = ?auto_2326987 ?auto_2326996 ) ) ( not ( = ?auto_2326987 ?auto_2326997 ) ) ( not ( = ?auto_2326987 ?auto_2326998 ) ) ( not ( = ?auto_2326987 ?auto_2326999 ) ) ( not ( = ?auto_2326987 ?auto_2327003 ) ) ( not ( = ?auto_2326988 ?auto_2326989 ) ) ( not ( = ?auto_2326988 ?auto_2326990 ) ) ( not ( = ?auto_2326988 ?auto_2326991 ) ) ( not ( = ?auto_2326988 ?auto_2326992 ) ) ( not ( = ?auto_2326988 ?auto_2326993 ) ) ( not ( = ?auto_2326988 ?auto_2326994 ) ) ( not ( = ?auto_2326988 ?auto_2326995 ) ) ( not ( = ?auto_2326988 ?auto_2326996 ) ) ( not ( = ?auto_2326988 ?auto_2326997 ) ) ( not ( = ?auto_2326988 ?auto_2326998 ) ) ( not ( = ?auto_2326988 ?auto_2326999 ) ) ( not ( = ?auto_2326988 ?auto_2327003 ) ) ( not ( = ?auto_2326989 ?auto_2326990 ) ) ( not ( = ?auto_2326989 ?auto_2326991 ) ) ( not ( = ?auto_2326989 ?auto_2326992 ) ) ( not ( = ?auto_2326989 ?auto_2326993 ) ) ( not ( = ?auto_2326989 ?auto_2326994 ) ) ( not ( = ?auto_2326989 ?auto_2326995 ) ) ( not ( = ?auto_2326989 ?auto_2326996 ) ) ( not ( = ?auto_2326989 ?auto_2326997 ) ) ( not ( = ?auto_2326989 ?auto_2326998 ) ) ( not ( = ?auto_2326989 ?auto_2326999 ) ) ( not ( = ?auto_2326989 ?auto_2327003 ) ) ( not ( = ?auto_2326990 ?auto_2326991 ) ) ( not ( = ?auto_2326990 ?auto_2326992 ) ) ( not ( = ?auto_2326990 ?auto_2326993 ) ) ( not ( = ?auto_2326990 ?auto_2326994 ) ) ( not ( = ?auto_2326990 ?auto_2326995 ) ) ( not ( = ?auto_2326990 ?auto_2326996 ) ) ( not ( = ?auto_2326990 ?auto_2326997 ) ) ( not ( = ?auto_2326990 ?auto_2326998 ) ) ( not ( = ?auto_2326990 ?auto_2326999 ) ) ( not ( = ?auto_2326990 ?auto_2327003 ) ) ( not ( = ?auto_2326991 ?auto_2326992 ) ) ( not ( = ?auto_2326991 ?auto_2326993 ) ) ( not ( = ?auto_2326991 ?auto_2326994 ) ) ( not ( = ?auto_2326991 ?auto_2326995 ) ) ( not ( = ?auto_2326991 ?auto_2326996 ) ) ( not ( = ?auto_2326991 ?auto_2326997 ) ) ( not ( = ?auto_2326991 ?auto_2326998 ) ) ( not ( = ?auto_2326991 ?auto_2326999 ) ) ( not ( = ?auto_2326991 ?auto_2327003 ) ) ( not ( = ?auto_2326992 ?auto_2326993 ) ) ( not ( = ?auto_2326992 ?auto_2326994 ) ) ( not ( = ?auto_2326992 ?auto_2326995 ) ) ( not ( = ?auto_2326992 ?auto_2326996 ) ) ( not ( = ?auto_2326992 ?auto_2326997 ) ) ( not ( = ?auto_2326992 ?auto_2326998 ) ) ( not ( = ?auto_2326992 ?auto_2326999 ) ) ( not ( = ?auto_2326992 ?auto_2327003 ) ) ( not ( = ?auto_2326993 ?auto_2326994 ) ) ( not ( = ?auto_2326993 ?auto_2326995 ) ) ( not ( = ?auto_2326993 ?auto_2326996 ) ) ( not ( = ?auto_2326993 ?auto_2326997 ) ) ( not ( = ?auto_2326993 ?auto_2326998 ) ) ( not ( = ?auto_2326993 ?auto_2326999 ) ) ( not ( = ?auto_2326993 ?auto_2327003 ) ) ( not ( = ?auto_2326994 ?auto_2326995 ) ) ( not ( = ?auto_2326994 ?auto_2326996 ) ) ( not ( = ?auto_2326994 ?auto_2326997 ) ) ( not ( = ?auto_2326994 ?auto_2326998 ) ) ( not ( = ?auto_2326994 ?auto_2326999 ) ) ( not ( = ?auto_2326994 ?auto_2327003 ) ) ( not ( = ?auto_2326995 ?auto_2326996 ) ) ( not ( = ?auto_2326995 ?auto_2326997 ) ) ( not ( = ?auto_2326995 ?auto_2326998 ) ) ( not ( = ?auto_2326995 ?auto_2326999 ) ) ( not ( = ?auto_2326995 ?auto_2327003 ) ) ( not ( = ?auto_2326996 ?auto_2326997 ) ) ( not ( = ?auto_2326996 ?auto_2326998 ) ) ( not ( = ?auto_2326996 ?auto_2326999 ) ) ( not ( = ?auto_2326996 ?auto_2327003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2326997 ?auto_2326998 ?auto_2326999 )
      ( MAKE-14CRATE-VERIFY ?auto_2326985 ?auto_2326986 ?auto_2326987 ?auto_2326988 ?auto_2326989 ?auto_2326990 ?auto_2326991 ?auto_2326992 ?auto_2326993 ?auto_2326994 ?auto_2326995 ?auto_2326996 ?auto_2326997 ?auto_2326998 ?auto_2326999 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327189 - SURFACE
      ?auto_2327190 - SURFACE
      ?auto_2327191 - SURFACE
      ?auto_2327192 - SURFACE
      ?auto_2327193 - SURFACE
      ?auto_2327194 - SURFACE
      ?auto_2327195 - SURFACE
      ?auto_2327196 - SURFACE
      ?auto_2327197 - SURFACE
      ?auto_2327198 - SURFACE
      ?auto_2327199 - SURFACE
      ?auto_2327200 - SURFACE
      ?auto_2327201 - SURFACE
      ?auto_2327202 - SURFACE
      ?auto_2327203 - SURFACE
    )
    :vars
    (
      ?auto_2327207 - HOIST
      ?auto_2327205 - PLACE
      ?auto_2327204 - PLACE
      ?auto_2327209 - HOIST
      ?auto_2327206 - SURFACE
      ?auto_2327208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327207 ?auto_2327205 ) ( SURFACE-AT ?auto_2327202 ?auto_2327205 ) ( CLEAR ?auto_2327202 ) ( IS-CRATE ?auto_2327203 ) ( not ( = ?auto_2327202 ?auto_2327203 ) ) ( AVAILABLE ?auto_2327207 ) ( ON ?auto_2327202 ?auto_2327201 ) ( not ( = ?auto_2327201 ?auto_2327202 ) ) ( not ( = ?auto_2327201 ?auto_2327203 ) ) ( not ( = ?auto_2327204 ?auto_2327205 ) ) ( HOIST-AT ?auto_2327209 ?auto_2327204 ) ( not ( = ?auto_2327207 ?auto_2327209 ) ) ( AVAILABLE ?auto_2327209 ) ( SURFACE-AT ?auto_2327203 ?auto_2327204 ) ( ON ?auto_2327203 ?auto_2327206 ) ( CLEAR ?auto_2327203 ) ( not ( = ?auto_2327202 ?auto_2327206 ) ) ( not ( = ?auto_2327203 ?auto_2327206 ) ) ( not ( = ?auto_2327201 ?auto_2327206 ) ) ( TRUCK-AT ?auto_2327208 ?auto_2327205 ) ( ON ?auto_2327190 ?auto_2327189 ) ( ON ?auto_2327191 ?auto_2327190 ) ( ON ?auto_2327192 ?auto_2327191 ) ( ON ?auto_2327193 ?auto_2327192 ) ( ON ?auto_2327194 ?auto_2327193 ) ( ON ?auto_2327195 ?auto_2327194 ) ( ON ?auto_2327196 ?auto_2327195 ) ( ON ?auto_2327197 ?auto_2327196 ) ( ON ?auto_2327198 ?auto_2327197 ) ( ON ?auto_2327199 ?auto_2327198 ) ( ON ?auto_2327200 ?auto_2327199 ) ( ON ?auto_2327201 ?auto_2327200 ) ( not ( = ?auto_2327189 ?auto_2327190 ) ) ( not ( = ?auto_2327189 ?auto_2327191 ) ) ( not ( = ?auto_2327189 ?auto_2327192 ) ) ( not ( = ?auto_2327189 ?auto_2327193 ) ) ( not ( = ?auto_2327189 ?auto_2327194 ) ) ( not ( = ?auto_2327189 ?auto_2327195 ) ) ( not ( = ?auto_2327189 ?auto_2327196 ) ) ( not ( = ?auto_2327189 ?auto_2327197 ) ) ( not ( = ?auto_2327189 ?auto_2327198 ) ) ( not ( = ?auto_2327189 ?auto_2327199 ) ) ( not ( = ?auto_2327189 ?auto_2327200 ) ) ( not ( = ?auto_2327189 ?auto_2327201 ) ) ( not ( = ?auto_2327189 ?auto_2327202 ) ) ( not ( = ?auto_2327189 ?auto_2327203 ) ) ( not ( = ?auto_2327189 ?auto_2327206 ) ) ( not ( = ?auto_2327190 ?auto_2327191 ) ) ( not ( = ?auto_2327190 ?auto_2327192 ) ) ( not ( = ?auto_2327190 ?auto_2327193 ) ) ( not ( = ?auto_2327190 ?auto_2327194 ) ) ( not ( = ?auto_2327190 ?auto_2327195 ) ) ( not ( = ?auto_2327190 ?auto_2327196 ) ) ( not ( = ?auto_2327190 ?auto_2327197 ) ) ( not ( = ?auto_2327190 ?auto_2327198 ) ) ( not ( = ?auto_2327190 ?auto_2327199 ) ) ( not ( = ?auto_2327190 ?auto_2327200 ) ) ( not ( = ?auto_2327190 ?auto_2327201 ) ) ( not ( = ?auto_2327190 ?auto_2327202 ) ) ( not ( = ?auto_2327190 ?auto_2327203 ) ) ( not ( = ?auto_2327190 ?auto_2327206 ) ) ( not ( = ?auto_2327191 ?auto_2327192 ) ) ( not ( = ?auto_2327191 ?auto_2327193 ) ) ( not ( = ?auto_2327191 ?auto_2327194 ) ) ( not ( = ?auto_2327191 ?auto_2327195 ) ) ( not ( = ?auto_2327191 ?auto_2327196 ) ) ( not ( = ?auto_2327191 ?auto_2327197 ) ) ( not ( = ?auto_2327191 ?auto_2327198 ) ) ( not ( = ?auto_2327191 ?auto_2327199 ) ) ( not ( = ?auto_2327191 ?auto_2327200 ) ) ( not ( = ?auto_2327191 ?auto_2327201 ) ) ( not ( = ?auto_2327191 ?auto_2327202 ) ) ( not ( = ?auto_2327191 ?auto_2327203 ) ) ( not ( = ?auto_2327191 ?auto_2327206 ) ) ( not ( = ?auto_2327192 ?auto_2327193 ) ) ( not ( = ?auto_2327192 ?auto_2327194 ) ) ( not ( = ?auto_2327192 ?auto_2327195 ) ) ( not ( = ?auto_2327192 ?auto_2327196 ) ) ( not ( = ?auto_2327192 ?auto_2327197 ) ) ( not ( = ?auto_2327192 ?auto_2327198 ) ) ( not ( = ?auto_2327192 ?auto_2327199 ) ) ( not ( = ?auto_2327192 ?auto_2327200 ) ) ( not ( = ?auto_2327192 ?auto_2327201 ) ) ( not ( = ?auto_2327192 ?auto_2327202 ) ) ( not ( = ?auto_2327192 ?auto_2327203 ) ) ( not ( = ?auto_2327192 ?auto_2327206 ) ) ( not ( = ?auto_2327193 ?auto_2327194 ) ) ( not ( = ?auto_2327193 ?auto_2327195 ) ) ( not ( = ?auto_2327193 ?auto_2327196 ) ) ( not ( = ?auto_2327193 ?auto_2327197 ) ) ( not ( = ?auto_2327193 ?auto_2327198 ) ) ( not ( = ?auto_2327193 ?auto_2327199 ) ) ( not ( = ?auto_2327193 ?auto_2327200 ) ) ( not ( = ?auto_2327193 ?auto_2327201 ) ) ( not ( = ?auto_2327193 ?auto_2327202 ) ) ( not ( = ?auto_2327193 ?auto_2327203 ) ) ( not ( = ?auto_2327193 ?auto_2327206 ) ) ( not ( = ?auto_2327194 ?auto_2327195 ) ) ( not ( = ?auto_2327194 ?auto_2327196 ) ) ( not ( = ?auto_2327194 ?auto_2327197 ) ) ( not ( = ?auto_2327194 ?auto_2327198 ) ) ( not ( = ?auto_2327194 ?auto_2327199 ) ) ( not ( = ?auto_2327194 ?auto_2327200 ) ) ( not ( = ?auto_2327194 ?auto_2327201 ) ) ( not ( = ?auto_2327194 ?auto_2327202 ) ) ( not ( = ?auto_2327194 ?auto_2327203 ) ) ( not ( = ?auto_2327194 ?auto_2327206 ) ) ( not ( = ?auto_2327195 ?auto_2327196 ) ) ( not ( = ?auto_2327195 ?auto_2327197 ) ) ( not ( = ?auto_2327195 ?auto_2327198 ) ) ( not ( = ?auto_2327195 ?auto_2327199 ) ) ( not ( = ?auto_2327195 ?auto_2327200 ) ) ( not ( = ?auto_2327195 ?auto_2327201 ) ) ( not ( = ?auto_2327195 ?auto_2327202 ) ) ( not ( = ?auto_2327195 ?auto_2327203 ) ) ( not ( = ?auto_2327195 ?auto_2327206 ) ) ( not ( = ?auto_2327196 ?auto_2327197 ) ) ( not ( = ?auto_2327196 ?auto_2327198 ) ) ( not ( = ?auto_2327196 ?auto_2327199 ) ) ( not ( = ?auto_2327196 ?auto_2327200 ) ) ( not ( = ?auto_2327196 ?auto_2327201 ) ) ( not ( = ?auto_2327196 ?auto_2327202 ) ) ( not ( = ?auto_2327196 ?auto_2327203 ) ) ( not ( = ?auto_2327196 ?auto_2327206 ) ) ( not ( = ?auto_2327197 ?auto_2327198 ) ) ( not ( = ?auto_2327197 ?auto_2327199 ) ) ( not ( = ?auto_2327197 ?auto_2327200 ) ) ( not ( = ?auto_2327197 ?auto_2327201 ) ) ( not ( = ?auto_2327197 ?auto_2327202 ) ) ( not ( = ?auto_2327197 ?auto_2327203 ) ) ( not ( = ?auto_2327197 ?auto_2327206 ) ) ( not ( = ?auto_2327198 ?auto_2327199 ) ) ( not ( = ?auto_2327198 ?auto_2327200 ) ) ( not ( = ?auto_2327198 ?auto_2327201 ) ) ( not ( = ?auto_2327198 ?auto_2327202 ) ) ( not ( = ?auto_2327198 ?auto_2327203 ) ) ( not ( = ?auto_2327198 ?auto_2327206 ) ) ( not ( = ?auto_2327199 ?auto_2327200 ) ) ( not ( = ?auto_2327199 ?auto_2327201 ) ) ( not ( = ?auto_2327199 ?auto_2327202 ) ) ( not ( = ?auto_2327199 ?auto_2327203 ) ) ( not ( = ?auto_2327199 ?auto_2327206 ) ) ( not ( = ?auto_2327200 ?auto_2327201 ) ) ( not ( = ?auto_2327200 ?auto_2327202 ) ) ( not ( = ?auto_2327200 ?auto_2327203 ) ) ( not ( = ?auto_2327200 ?auto_2327206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327201 ?auto_2327202 ?auto_2327203 )
      ( MAKE-14CRATE-VERIFY ?auto_2327189 ?auto_2327190 ?auto_2327191 ?auto_2327192 ?auto_2327193 ?auto_2327194 ?auto_2327195 ?auto_2327196 ?auto_2327197 ?auto_2327198 ?auto_2327199 ?auto_2327200 ?auto_2327201 ?auto_2327202 ?auto_2327203 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327393 - SURFACE
      ?auto_2327394 - SURFACE
      ?auto_2327395 - SURFACE
      ?auto_2327396 - SURFACE
      ?auto_2327397 - SURFACE
      ?auto_2327398 - SURFACE
      ?auto_2327399 - SURFACE
      ?auto_2327400 - SURFACE
      ?auto_2327401 - SURFACE
      ?auto_2327402 - SURFACE
      ?auto_2327403 - SURFACE
      ?auto_2327404 - SURFACE
      ?auto_2327405 - SURFACE
      ?auto_2327406 - SURFACE
      ?auto_2327407 - SURFACE
    )
    :vars
    (
      ?auto_2327409 - HOIST
      ?auto_2327412 - PLACE
      ?auto_2327410 - PLACE
      ?auto_2327411 - HOIST
      ?auto_2327413 - SURFACE
      ?auto_2327408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327409 ?auto_2327412 ) ( IS-CRATE ?auto_2327407 ) ( not ( = ?auto_2327406 ?auto_2327407 ) ) ( not ( = ?auto_2327405 ?auto_2327406 ) ) ( not ( = ?auto_2327405 ?auto_2327407 ) ) ( not ( = ?auto_2327410 ?auto_2327412 ) ) ( HOIST-AT ?auto_2327411 ?auto_2327410 ) ( not ( = ?auto_2327409 ?auto_2327411 ) ) ( AVAILABLE ?auto_2327411 ) ( SURFACE-AT ?auto_2327407 ?auto_2327410 ) ( ON ?auto_2327407 ?auto_2327413 ) ( CLEAR ?auto_2327407 ) ( not ( = ?auto_2327406 ?auto_2327413 ) ) ( not ( = ?auto_2327407 ?auto_2327413 ) ) ( not ( = ?auto_2327405 ?auto_2327413 ) ) ( TRUCK-AT ?auto_2327408 ?auto_2327412 ) ( SURFACE-AT ?auto_2327405 ?auto_2327412 ) ( CLEAR ?auto_2327405 ) ( LIFTING ?auto_2327409 ?auto_2327406 ) ( IS-CRATE ?auto_2327406 ) ( ON ?auto_2327394 ?auto_2327393 ) ( ON ?auto_2327395 ?auto_2327394 ) ( ON ?auto_2327396 ?auto_2327395 ) ( ON ?auto_2327397 ?auto_2327396 ) ( ON ?auto_2327398 ?auto_2327397 ) ( ON ?auto_2327399 ?auto_2327398 ) ( ON ?auto_2327400 ?auto_2327399 ) ( ON ?auto_2327401 ?auto_2327400 ) ( ON ?auto_2327402 ?auto_2327401 ) ( ON ?auto_2327403 ?auto_2327402 ) ( ON ?auto_2327404 ?auto_2327403 ) ( ON ?auto_2327405 ?auto_2327404 ) ( not ( = ?auto_2327393 ?auto_2327394 ) ) ( not ( = ?auto_2327393 ?auto_2327395 ) ) ( not ( = ?auto_2327393 ?auto_2327396 ) ) ( not ( = ?auto_2327393 ?auto_2327397 ) ) ( not ( = ?auto_2327393 ?auto_2327398 ) ) ( not ( = ?auto_2327393 ?auto_2327399 ) ) ( not ( = ?auto_2327393 ?auto_2327400 ) ) ( not ( = ?auto_2327393 ?auto_2327401 ) ) ( not ( = ?auto_2327393 ?auto_2327402 ) ) ( not ( = ?auto_2327393 ?auto_2327403 ) ) ( not ( = ?auto_2327393 ?auto_2327404 ) ) ( not ( = ?auto_2327393 ?auto_2327405 ) ) ( not ( = ?auto_2327393 ?auto_2327406 ) ) ( not ( = ?auto_2327393 ?auto_2327407 ) ) ( not ( = ?auto_2327393 ?auto_2327413 ) ) ( not ( = ?auto_2327394 ?auto_2327395 ) ) ( not ( = ?auto_2327394 ?auto_2327396 ) ) ( not ( = ?auto_2327394 ?auto_2327397 ) ) ( not ( = ?auto_2327394 ?auto_2327398 ) ) ( not ( = ?auto_2327394 ?auto_2327399 ) ) ( not ( = ?auto_2327394 ?auto_2327400 ) ) ( not ( = ?auto_2327394 ?auto_2327401 ) ) ( not ( = ?auto_2327394 ?auto_2327402 ) ) ( not ( = ?auto_2327394 ?auto_2327403 ) ) ( not ( = ?auto_2327394 ?auto_2327404 ) ) ( not ( = ?auto_2327394 ?auto_2327405 ) ) ( not ( = ?auto_2327394 ?auto_2327406 ) ) ( not ( = ?auto_2327394 ?auto_2327407 ) ) ( not ( = ?auto_2327394 ?auto_2327413 ) ) ( not ( = ?auto_2327395 ?auto_2327396 ) ) ( not ( = ?auto_2327395 ?auto_2327397 ) ) ( not ( = ?auto_2327395 ?auto_2327398 ) ) ( not ( = ?auto_2327395 ?auto_2327399 ) ) ( not ( = ?auto_2327395 ?auto_2327400 ) ) ( not ( = ?auto_2327395 ?auto_2327401 ) ) ( not ( = ?auto_2327395 ?auto_2327402 ) ) ( not ( = ?auto_2327395 ?auto_2327403 ) ) ( not ( = ?auto_2327395 ?auto_2327404 ) ) ( not ( = ?auto_2327395 ?auto_2327405 ) ) ( not ( = ?auto_2327395 ?auto_2327406 ) ) ( not ( = ?auto_2327395 ?auto_2327407 ) ) ( not ( = ?auto_2327395 ?auto_2327413 ) ) ( not ( = ?auto_2327396 ?auto_2327397 ) ) ( not ( = ?auto_2327396 ?auto_2327398 ) ) ( not ( = ?auto_2327396 ?auto_2327399 ) ) ( not ( = ?auto_2327396 ?auto_2327400 ) ) ( not ( = ?auto_2327396 ?auto_2327401 ) ) ( not ( = ?auto_2327396 ?auto_2327402 ) ) ( not ( = ?auto_2327396 ?auto_2327403 ) ) ( not ( = ?auto_2327396 ?auto_2327404 ) ) ( not ( = ?auto_2327396 ?auto_2327405 ) ) ( not ( = ?auto_2327396 ?auto_2327406 ) ) ( not ( = ?auto_2327396 ?auto_2327407 ) ) ( not ( = ?auto_2327396 ?auto_2327413 ) ) ( not ( = ?auto_2327397 ?auto_2327398 ) ) ( not ( = ?auto_2327397 ?auto_2327399 ) ) ( not ( = ?auto_2327397 ?auto_2327400 ) ) ( not ( = ?auto_2327397 ?auto_2327401 ) ) ( not ( = ?auto_2327397 ?auto_2327402 ) ) ( not ( = ?auto_2327397 ?auto_2327403 ) ) ( not ( = ?auto_2327397 ?auto_2327404 ) ) ( not ( = ?auto_2327397 ?auto_2327405 ) ) ( not ( = ?auto_2327397 ?auto_2327406 ) ) ( not ( = ?auto_2327397 ?auto_2327407 ) ) ( not ( = ?auto_2327397 ?auto_2327413 ) ) ( not ( = ?auto_2327398 ?auto_2327399 ) ) ( not ( = ?auto_2327398 ?auto_2327400 ) ) ( not ( = ?auto_2327398 ?auto_2327401 ) ) ( not ( = ?auto_2327398 ?auto_2327402 ) ) ( not ( = ?auto_2327398 ?auto_2327403 ) ) ( not ( = ?auto_2327398 ?auto_2327404 ) ) ( not ( = ?auto_2327398 ?auto_2327405 ) ) ( not ( = ?auto_2327398 ?auto_2327406 ) ) ( not ( = ?auto_2327398 ?auto_2327407 ) ) ( not ( = ?auto_2327398 ?auto_2327413 ) ) ( not ( = ?auto_2327399 ?auto_2327400 ) ) ( not ( = ?auto_2327399 ?auto_2327401 ) ) ( not ( = ?auto_2327399 ?auto_2327402 ) ) ( not ( = ?auto_2327399 ?auto_2327403 ) ) ( not ( = ?auto_2327399 ?auto_2327404 ) ) ( not ( = ?auto_2327399 ?auto_2327405 ) ) ( not ( = ?auto_2327399 ?auto_2327406 ) ) ( not ( = ?auto_2327399 ?auto_2327407 ) ) ( not ( = ?auto_2327399 ?auto_2327413 ) ) ( not ( = ?auto_2327400 ?auto_2327401 ) ) ( not ( = ?auto_2327400 ?auto_2327402 ) ) ( not ( = ?auto_2327400 ?auto_2327403 ) ) ( not ( = ?auto_2327400 ?auto_2327404 ) ) ( not ( = ?auto_2327400 ?auto_2327405 ) ) ( not ( = ?auto_2327400 ?auto_2327406 ) ) ( not ( = ?auto_2327400 ?auto_2327407 ) ) ( not ( = ?auto_2327400 ?auto_2327413 ) ) ( not ( = ?auto_2327401 ?auto_2327402 ) ) ( not ( = ?auto_2327401 ?auto_2327403 ) ) ( not ( = ?auto_2327401 ?auto_2327404 ) ) ( not ( = ?auto_2327401 ?auto_2327405 ) ) ( not ( = ?auto_2327401 ?auto_2327406 ) ) ( not ( = ?auto_2327401 ?auto_2327407 ) ) ( not ( = ?auto_2327401 ?auto_2327413 ) ) ( not ( = ?auto_2327402 ?auto_2327403 ) ) ( not ( = ?auto_2327402 ?auto_2327404 ) ) ( not ( = ?auto_2327402 ?auto_2327405 ) ) ( not ( = ?auto_2327402 ?auto_2327406 ) ) ( not ( = ?auto_2327402 ?auto_2327407 ) ) ( not ( = ?auto_2327402 ?auto_2327413 ) ) ( not ( = ?auto_2327403 ?auto_2327404 ) ) ( not ( = ?auto_2327403 ?auto_2327405 ) ) ( not ( = ?auto_2327403 ?auto_2327406 ) ) ( not ( = ?auto_2327403 ?auto_2327407 ) ) ( not ( = ?auto_2327403 ?auto_2327413 ) ) ( not ( = ?auto_2327404 ?auto_2327405 ) ) ( not ( = ?auto_2327404 ?auto_2327406 ) ) ( not ( = ?auto_2327404 ?auto_2327407 ) ) ( not ( = ?auto_2327404 ?auto_2327413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327405 ?auto_2327406 ?auto_2327407 )
      ( MAKE-14CRATE-VERIFY ?auto_2327393 ?auto_2327394 ?auto_2327395 ?auto_2327396 ?auto_2327397 ?auto_2327398 ?auto_2327399 ?auto_2327400 ?auto_2327401 ?auto_2327402 ?auto_2327403 ?auto_2327404 ?auto_2327405 ?auto_2327406 ?auto_2327407 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327597 - SURFACE
      ?auto_2327598 - SURFACE
      ?auto_2327599 - SURFACE
      ?auto_2327600 - SURFACE
      ?auto_2327601 - SURFACE
      ?auto_2327602 - SURFACE
      ?auto_2327603 - SURFACE
      ?auto_2327604 - SURFACE
      ?auto_2327605 - SURFACE
      ?auto_2327606 - SURFACE
      ?auto_2327607 - SURFACE
      ?auto_2327608 - SURFACE
      ?auto_2327609 - SURFACE
      ?auto_2327610 - SURFACE
      ?auto_2327611 - SURFACE
    )
    :vars
    (
      ?auto_2327614 - HOIST
      ?auto_2327616 - PLACE
      ?auto_2327615 - PLACE
      ?auto_2327617 - HOIST
      ?auto_2327612 - SURFACE
      ?auto_2327613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327614 ?auto_2327616 ) ( IS-CRATE ?auto_2327611 ) ( not ( = ?auto_2327610 ?auto_2327611 ) ) ( not ( = ?auto_2327609 ?auto_2327610 ) ) ( not ( = ?auto_2327609 ?auto_2327611 ) ) ( not ( = ?auto_2327615 ?auto_2327616 ) ) ( HOIST-AT ?auto_2327617 ?auto_2327615 ) ( not ( = ?auto_2327614 ?auto_2327617 ) ) ( AVAILABLE ?auto_2327617 ) ( SURFACE-AT ?auto_2327611 ?auto_2327615 ) ( ON ?auto_2327611 ?auto_2327612 ) ( CLEAR ?auto_2327611 ) ( not ( = ?auto_2327610 ?auto_2327612 ) ) ( not ( = ?auto_2327611 ?auto_2327612 ) ) ( not ( = ?auto_2327609 ?auto_2327612 ) ) ( TRUCK-AT ?auto_2327613 ?auto_2327616 ) ( SURFACE-AT ?auto_2327609 ?auto_2327616 ) ( CLEAR ?auto_2327609 ) ( IS-CRATE ?auto_2327610 ) ( AVAILABLE ?auto_2327614 ) ( IN ?auto_2327610 ?auto_2327613 ) ( ON ?auto_2327598 ?auto_2327597 ) ( ON ?auto_2327599 ?auto_2327598 ) ( ON ?auto_2327600 ?auto_2327599 ) ( ON ?auto_2327601 ?auto_2327600 ) ( ON ?auto_2327602 ?auto_2327601 ) ( ON ?auto_2327603 ?auto_2327602 ) ( ON ?auto_2327604 ?auto_2327603 ) ( ON ?auto_2327605 ?auto_2327604 ) ( ON ?auto_2327606 ?auto_2327605 ) ( ON ?auto_2327607 ?auto_2327606 ) ( ON ?auto_2327608 ?auto_2327607 ) ( ON ?auto_2327609 ?auto_2327608 ) ( not ( = ?auto_2327597 ?auto_2327598 ) ) ( not ( = ?auto_2327597 ?auto_2327599 ) ) ( not ( = ?auto_2327597 ?auto_2327600 ) ) ( not ( = ?auto_2327597 ?auto_2327601 ) ) ( not ( = ?auto_2327597 ?auto_2327602 ) ) ( not ( = ?auto_2327597 ?auto_2327603 ) ) ( not ( = ?auto_2327597 ?auto_2327604 ) ) ( not ( = ?auto_2327597 ?auto_2327605 ) ) ( not ( = ?auto_2327597 ?auto_2327606 ) ) ( not ( = ?auto_2327597 ?auto_2327607 ) ) ( not ( = ?auto_2327597 ?auto_2327608 ) ) ( not ( = ?auto_2327597 ?auto_2327609 ) ) ( not ( = ?auto_2327597 ?auto_2327610 ) ) ( not ( = ?auto_2327597 ?auto_2327611 ) ) ( not ( = ?auto_2327597 ?auto_2327612 ) ) ( not ( = ?auto_2327598 ?auto_2327599 ) ) ( not ( = ?auto_2327598 ?auto_2327600 ) ) ( not ( = ?auto_2327598 ?auto_2327601 ) ) ( not ( = ?auto_2327598 ?auto_2327602 ) ) ( not ( = ?auto_2327598 ?auto_2327603 ) ) ( not ( = ?auto_2327598 ?auto_2327604 ) ) ( not ( = ?auto_2327598 ?auto_2327605 ) ) ( not ( = ?auto_2327598 ?auto_2327606 ) ) ( not ( = ?auto_2327598 ?auto_2327607 ) ) ( not ( = ?auto_2327598 ?auto_2327608 ) ) ( not ( = ?auto_2327598 ?auto_2327609 ) ) ( not ( = ?auto_2327598 ?auto_2327610 ) ) ( not ( = ?auto_2327598 ?auto_2327611 ) ) ( not ( = ?auto_2327598 ?auto_2327612 ) ) ( not ( = ?auto_2327599 ?auto_2327600 ) ) ( not ( = ?auto_2327599 ?auto_2327601 ) ) ( not ( = ?auto_2327599 ?auto_2327602 ) ) ( not ( = ?auto_2327599 ?auto_2327603 ) ) ( not ( = ?auto_2327599 ?auto_2327604 ) ) ( not ( = ?auto_2327599 ?auto_2327605 ) ) ( not ( = ?auto_2327599 ?auto_2327606 ) ) ( not ( = ?auto_2327599 ?auto_2327607 ) ) ( not ( = ?auto_2327599 ?auto_2327608 ) ) ( not ( = ?auto_2327599 ?auto_2327609 ) ) ( not ( = ?auto_2327599 ?auto_2327610 ) ) ( not ( = ?auto_2327599 ?auto_2327611 ) ) ( not ( = ?auto_2327599 ?auto_2327612 ) ) ( not ( = ?auto_2327600 ?auto_2327601 ) ) ( not ( = ?auto_2327600 ?auto_2327602 ) ) ( not ( = ?auto_2327600 ?auto_2327603 ) ) ( not ( = ?auto_2327600 ?auto_2327604 ) ) ( not ( = ?auto_2327600 ?auto_2327605 ) ) ( not ( = ?auto_2327600 ?auto_2327606 ) ) ( not ( = ?auto_2327600 ?auto_2327607 ) ) ( not ( = ?auto_2327600 ?auto_2327608 ) ) ( not ( = ?auto_2327600 ?auto_2327609 ) ) ( not ( = ?auto_2327600 ?auto_2327610 ) ) ( not ( = ?auto_2327600 ?auto_2327611 ) ) ( not ( = ?auto_2327600 ?auto_2327612 ) ) ( not ( = ?auto_2327601 ?auto_2327602 ) ) ( not ( = ?auto_2327601 ?auto_2327603 ) ) ( not ( = ?auto_2327601 ?auto_2327604 ) ) ( not ( = ?auto_2327601 ?auto_2327605 ) ) ( not ( = ?auto_2327601 ?auto_2327606 ) ) ( not ( = ?auto_2327601 ?auto_2327607 ) ) ( not ( = ?auto_2327601 ?auto_2327608 ) ) ( not ( = ?auto_2327601 ?auto_2327609 ) ) ( not ( = ?auto_2327601 ?auto_2327610 ) ) ( not ( = ?auto_2327601 ?auto_2327611 ) ) ( not ( = ?auto_2327601 ?auto_2327612 ) ) ( not ( = ?auto_2327602 ?auto_2327603 ) ) ( not ( = ?auto_2327602 ?auto_2327604 ) ) ( not ( = ?auto_2327602 ?auto_2327605 ) ) ( not ( = ?auto_2327602 ?auto_2327606 ) ) ( not ( = ?auto_2327602 ?auto_2327607 ) ) ( not ( = ?auto_2327602 ?auto_2327608 ) ) ( not ( = ?auto_2327602 ?auto_2327609 ) ) ( not ( = ?auto_2327602 ?auto_2327610 ) ) ( not ( = ?auto_2327602 ?auto_2327611 ) ) ( not ( = ?auto_2327602 ?auto_2327612 ) ) ( not ( = ?auto_2327603 ?auto_2327604 ) ) ( not ( = ?auto_2327603 ?auto_2327605 ) ) ( not ( = ?auto_2327603 ?auto_2327606 ) ) ( not ( = ?auto_2327603 ?auto_2327607 ) ) ( not ( = ?auto_2327603 ?auto_2327608 ) ) ( not ( = ?auto_2327603 ?auto_2327609 ) ) ( not ( = ?auto_2327603 ?auto_2327610 ) ) ( not ( = ?auto_2327603 ?auto_2327611 ) ) ( not ( = ?auto_2327603 ?auto_2327612 ) ) ( not ( = ?auto_2327604 ?auto_2327605 ) ) ( not ( = ?auto_2327604 ?auto_2327606 ) ) ( not ( = ?auto_2327604 ?auto_2327607 ) ) ( not ( = ?auto_2327604 ?auto_2327608 ) ) ( not ( = ?auto_2327604 ?auto_2327609 ) ) ( not ( = ?auto_2327604 ?auto_2327610 ) ) ( not ( = ?auto_2327604 ?auto_2327611 ) ) ( not ( = ?auto_2327604 ?auto_2327612 ) ) ( not ( = ?auto_2327605 ?auto_2327606 ) ) ( not ( = ?auto_2327605 ?auto_2327607 ) ) ( not ( = ?auto_2327605 ?auto_2327608 ) ) ( not ( = ?auto_2327605 ?auto_2327609 ) ) ( not ( = ?auto_2327605 ?auto_2327610 ) ) ( not ( = ?auto_2327605 ?auto_2327611 ) ) ( not ( = ?auto_2327605 ?auto_2327612 ) ) ( not ( = ?auto_2327606 ?auto_2327607 ) ) ( not ( = ?auto_2327606 ?auto_2327608 ) ) ( not ( = ?auto_2327606 ?auto_2327609 ) ) ( not ( = ?auto_2327606 ?auto_2327610 ) ) ( not ( = ?auto_2327606 ?auto_2327611 ) ) ( not ( = ?auto_2327606 ?auto_2327612 ) ) ( not ( = ?auto_2327607 ?auto_2327608 ) ) ( not ( = ?auto_2327607 ?auto_2327609 ) ) ( not ( = ?auto_2327607 ?auto_2327610 ) ) ( not ( = ?auto_2327607 ?auto_2327611 ) ) ( not ( = ?auto_2327607 ?auto_2327612 ) ) ( not ( = ?auto_2327608 ?auto_2327609 ) ) ( not ( = ?auto_2327608 ?auto_2327610 ) ) ( not ( = ?auto_2327608 ?auto_2327611 ) ) ( not ( = ?auto_2327608 ?auto_2327612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327609 ?auto_2327610 ?auto_2327611 )
      ( MAKE-14CRATE-VERIFY ?auto_2327597 ?auto_2327598 ?auto_2327599 ?auto_2327600 ?auto_2327601 ?auto_2327602 ?auto_2327603 ?auto_2327604 ?auto_2327605 ?auto_2327606 ?auto_2327607 ?auto_2327608 ?auto_2327609 ?auto_2327610 ?auto_2327611 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2344716 - SURFACE
      ?auto_2344717 - SURFACE
      ?auto_2344718 - SURFACE
      ?auto_2344719 - SURFACE
      ?auto_2344720 - SURFACE
      ?auto_2344721 - SURFACE
      ?auto_2344722 - SURFACE
      ?auto_2344723 - SURFACE
      ?auto_2344724 - SURFACE
      ?auto_2344725 - SURFACE
      ?auto_2344726 - SURFACE
      ?auto_2344727 - SURFACE
      ?auto_2344728 - SURFACE
      ?auto_2344729 - SURFACE
      ?auto_2344730 - SURFACE
      ?auto_2344731 - SURFACE
    )
    :vars
    (
      ?auto_2344733 - HOIST
      ?auto_2344732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344733 ?auto_2344732 ) ( SURFACE-AT ?auto_2344730 ?auto_2344732 ) ( CLEAR ?auto_2344730 ) ( LIFTING ?auto_2344733 ?auto_2344731 ) ( IS-CRATE ?auto_2344731 ) ( not ( = ?auto_2344730 ?auto_2344731 ) ) ( ON ?auto_2344717 ?auto_2344716 ) ( ON ?auto_2344718 ?auto_2344717 ) ( ON ?auto_2344719 ?auto_2344718 ) ( ON ?auto_2344720 ?auto_2344719 ) ( ON ?auto_2344721 ?auto_2344720 ) ( ON ?auto_2344722 ?auto_2344721 ) ( ON ?auto_2344723 ?auto_2344722 ) ( ON ?auto_2344724 ?auto_2344723 ) ( ON ?auto_2344725 ?auto_2344724 ) ( ON ?auto_2344726 ?auto_2344725 ) ( ON ?auto_2344727 ?auto_2344726 ) ( ON ?auto_2344728 ?auto_2344727 ) ( ON ?auto_2344729 ?auto_2344728 ) ( ON ?auto_2344730 ?auto_2344729 ) ( not ( = ?auto_2344716 ?auto_2344717 ) ) ( not ( = ?auto_2344716 ?auto_2344718 ) ) ( not ( = ?auto_2344716 ?auto_2344719 ) ) ( not ( = ?auto_2344716 ?auto_2344720 ) ) ( not ( = ?auto_2344716 ?auto_2344721 ) ) ( not ( = ?auto_2344716 ?auto_2344722 ) ) ( not ( = ?auto_2344716 ?auto_2344723 ) ) ( not ( = ?auto_2344716 ?auto_2344724 ) ) ( not ( = ?auto_2344716 ?auto_2344725 ) ) ( not ( = ?auto_2344716 ?auto_2344726 ) ) ( not ( = ?auto_2344716 ?auto_2344727 ) ) ( not ( = ?auto_2344716 ?auto_2344728 ) ) ( not ( = ?auto_2344716 ?auto_2344729 ) ) ( not ( = ?auto_2344716 ?auto_2344730 ) ) ( not ( = ?auto_2344716 ?auto_2344731 ) ) ( not ( = ?auto_2344717 ?auto_2344718 ) ) ( not ( = ?auto_2344717 ?auto_2344719 ) ) ( not ( = ?auto_2344717 ?auto_2344720 ) ) ( not ( = ?auto_2344717 ?auto_2344721 ) ) ( not ( = ?auto_2344717 ?auto_2344722 ) ) ( not ( = ?auto_2344717 ?auto_2344723 ) ) ( not ( = ?auto_2344717 ?auto_2344724 ) ) ( not ( = ?auto_2344717 ?auto_2344725 ) ) ( not ( = ?auto_2344717 ?auto_2344726 ) ) ( not ( = ?auto_2344717 ?auto_2344727 ) ) ( not ( = ?auto_2344717 ?auto_2344728 ) ) ( not ( = ?auto_2344717 ?auto_2344729 ) ) ( not ( = ?auto_2344717 ?auto_2344730 ) ) ( not ( = ?auto_2344717 ?auto_2344731 ) ) ( not ( = ?auto_2344718 ?auto_2344719 ) ) ( not ( = ?auto_2344718 ?auto_2344720 ) ) ( not ( = ?auto_2344718 ?auto_2344721 ) ) ( not ( = ?auto_2344718 ?auto_2344722 ) ) ( not ( = ?auto_2344718 ?auto_2344723 ) ) ( not ( = ?auto_2344718 ?auto_2344724 ) ) ( not ( = ?auto_2344718 ?auto_2344725 ) ) ( not ( = ?auto_2344718 ?auto_2344726 ) ) ( not ( = ?auto_2344718 ?auto_2344727 ) ) ( not ( = ?auto_2344718 ?auto_2344728 ) ) ( not ( = ?auto_2344718 ?auto_2344729 ) ) ( not ( = ?auto_2344718 ?auto_2344730 ) ) ( not ( = ?auto_2344718 ?auto_2344731 ) ) ( not ( = ?auto_2344719 ?auto_2344720 ) ) ( not ( = ?auto_2344719 ?auto_2344721 ) ) ( not ( = ?auto_2344719 ?auto_2344722 ) ) ( not ( = ?auto_2344719 ?auto_2344723 ) ) ( not ( = ?auto_2344719 ?auto_2344724 ) ) ( not ( = ?auto_2344719 ?auto_2344725 ) ) ( not ( = ?auto_2344719 ?auto_2344726 ) ) ( not ( = ?auto_2344719 ?auto_2344727 ) ) ( not ( = ?auto_2344719 ?auto_2344728 ) ) ( not ( = ?auto_2344719 ?auto_2344729 ) ) ( not ( = ?auto_2344719 ?auto_2344730 ) ) ( not ( = ?auto_2344719 ?auto_2344731 ) ) ( not ( = ?auto_2344720 ?auto_2344721 ) ) ( not ( = ?auto_2344720 ?auto_2344722 ) ) ( not ( = ?auto_2344720 ?auto_2344723 ) ) ( not ( = ?auto_2344720 ?auto_2344724 ) ) ( not ( = ?auto_2344720 ?auto_2344725 ) ) ( not ( = ?auto_2344720 ?auto_2344726 ) ) ( not ( = ?auto_2344720 ?auto_2344727 ) ) ( not ( = ?auto_2344720 ?auto_2344728 ) ) ( not ( = ?auto_2344720 ?auto_2344729 ) ) ( not ( = ?auto_2344720 ?auto_2344730 ) ) ( not ( = ?auto_2344720 ?auto_2344731 ) ) ( not ( = ?auto_2344721 ?auto_2344722 ) ) ( not ( = ?auto_2344721 ?auto_2344723 ) ) ( not ( = ?auto_2344721 ?auto_2344724 ) ) ( not ( = ?auto_2344721 ?auto_2344725 ) ) ( not ( = ?auto_2344721 ?auto_2344726 ) ) ( not ( = ?auto_2344721 ?auto_2344727 ) ) ( not ( = ?auto_2344721 ?auto_2344728 ) ) ( not ( = ?auto_2344721 ?auto_2344729 ) ) ( not ( = ?auto_2344721 ?auto_2344730 ) ) ( not ( = ?auto_2344721 ?auto_2344731 ) ) ( not ( = ?auto_2344722 ?auto_2344723 ) ) ( not ( = ?auto_2344722 ?auto_2344724 ) ) ( not ( = ?auto_2344722 ?auto_2344725 ) ) ( not ( = ?auto_2344722 ?auto_2344726 ) ) ( not ( = ?auto_2344722 ?auto_2344727 ) ) ( not ( = ?auto_2344722 ?auto_2344728 ) ) ( not ( = ?auto_2344722 ?auto_2344729 ) ) ( not ( = ?auto_2344722 ?auto_2344730 ) ) ( not ( = ?auto_2344722 ?auto_2344731 ) ) ( not ( = ?auto_2344723 ?auto_2344724 ) ) ( not ( = ?auto_2344723 ?auto_2344725 ) ) ( not ( = ?auto_2344723 ?auto_2344726 ) ) ( not ( = ?auto_2344723 ?auto_2344727 ) ) ( not ( = ?auto_2344723 ?auto_2344728 ) ) ( not ( = ?auto_2344723 ?auto_2344729 ) ) ( not ( = ?auto_2344723 ?auto_2344730 ) ) ( not ( = ?auto_2344723 ?auto_2344731 ) ) ( not ( = ?auto_2344724 ?auto_2344725 ) ) ( not ( = ?auto_2344724 ?auto_2344726 ) ) ( not ( = ?auto_2344724 ?auto_2344727 ) ) ( not ( = ?auto_2344724 ?auto_2344728 ) ) ( not ( = ?auto_2344724 ?auto_2344729 ) ) ( not ( = ?auto_2344724 ?auto_2344730 ) ) ( not ( = ?auto_2344724 ?auto_2344731 ) ) ( not ( = ?auto_2344725 ?auto_2344726 ) ) ( not ( = ?auto_2344725 ?auto_2344727 ) ) ( not ( = ?auto_2344725 ?auto_2344728 ) ) ( not ( = ?auto_2344725 ?auto_2344729 ) ) ( not ( = ?auto_2344725 ?auto_2344730 ) ) ( not ( = ?auto_2344725 ?auto_2344731 ) ) ( not ( = ?auto_2344726 ?auto_2344727 ) ) ( not ( = ?auto_2344726 ?auto_2344728 ) ) ( not ( = ?auto_2344726 ?auto_2344729 ) ) ( not ( = ?auto_2344726 ?auto_2344730 ) ) ( not ( = ?auto_2344726 ?auto_2344731 ) ) ( not ( = ?auto_2344727 ?auto_2344728 ) ) ( not ( = ?auto_2344727 ?auto_2344729 ) ) ( not ( = ?auto_2344727 ?auto_2344730 ) ) ( not ( = ?auto_2344727 ?auto_2344731 ) ) ( not ( = ?auto_2344728 ?auto_2344729 ) ) ( not ( = ?auto_2344728 ?auto_2344730 ) ) ( not ( = ?auto_2344728 ?auto_2344731 ) ) ( not ( = ?auto_2344729 ?auto_2344730 ) ) ( not ( = ?auto_2344729 ?auto_2344731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2344730 ?auto_2344731 )
      ( MAKE-15CRATE-VERIFY ?auto_2344716 ?auto_2344717 ?auto_2344718 ?auto_2344719 ?auto_2344720 ?auto_2344721 ?auto_2344722 ?auto_2344723 ?auto_2344724 ?auto_2344725 ?auto_2344726 ?auto_2344727 ?auto_2344728 ?auto_2344729 ?auto_2344730 ?auto_2344731 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2344895 - SURFACE
      ?auto_2344896 - SURFACE
      ?auto_2344897 - SURFACE
      ?auto_2344898 - SURFACE
      ?auto_2344899 - SURFACE
      ?auto_2344900 - SURFACE
      ?auto_2344901 - SURFACE
      ?auto_2344902 - SURFACE
      ?auto_2344903 - SURFACE
      ?auto_2344904 - SURFACE
      ?auto_2344905 - SURFACE
      ?auto_2344906 - SURFACE
      ?auto_2344907 - SURFACE
      ?auto_2344908 - SURFACE
      ?auto_2344909 - SURFACE
      ?auto_2344910 - SURFACE
    )
    :vars
    (
      ?auto_2344911 - HOIST
      ?auto_2344913 - PLACE
      ?auto_2344912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344911 ?auto_2344913 ) ( SURFACE-AT ?auto_2344909 ?auto_2344913 ) ( CLEAR ?auto_2344909 ) ( IS-CRATE ?auto_2344910 ) ( not ( = ?auto_2344909 ?auto_2344910 ) ) ( TRUCK-AT ?auto_2344912 ?auto_2344913 ) ( AVAILABLE ?auto_2344911 ) ( IN ?auto_2344910 ?auto_2344912 ) ( ON ?auto_2344909 ?auto_2344908 ) ( not ( = ?auto_2344908 ?auto_2344909 ) ) ( not ( = ?auto_2344908 ?auto_2344910 ) ) ( ON ?auto_2344896 ?auto_2344895 ) ( ON ?auto_2344897 ?auto_2344896 ) ( ON ?auto_2344898 ?auto_2344897 ) ( ON ?auto_2344899 ?auto_2344898 ) ( ON ?auto_2344900 ?auto_2344899 ) ( ON ?auto_2344901 ?auto_2344900 ) ( ON ?auto_2344902 ?auto_2344901 ) ( ON ?auto_2344903 ?auto_2344902 ) ( ON ?auto_2344904 ?auto_2344903 ) ( ON ?auto_2344905 ?auto_2344904 ) ( ON ?auto_2344906 ?auto_2344905 ) ( ON ?auto_2344907 ?auto_2344906 ) ( ON ?auto_2344908 ?auto_2344907 ) ( not ( = ?auto_2344895 ?auto_2344896 ) ) ( not ( = ?auto_2344895 ?auto_2344897 ) ) ( not ( = ?auto_2344895 ?auto_2344898 ) ) ( not ( = ?auto_2344895 ?auto_2344899 ) ) ( not ( = ?auto_2344895 ?auto_2344900 ) ) ( not ( = ?auto_2344895 ?auto_2344901 ) ) ( not ( = ?auto_2344895 ?auto_2344902 ) ) ( not ( = ?auto_2344895 ?auto_2344903 ) ) ( not ( = ?auto_2344895 ?auto_2344904 ) ) ( not ( = ?auto_2344895 ?auto_2344905 ) ) ( not ( = ?auto_2344895 ?auto_2344906 ) ) ( not ( = ?auto_2344895 ?auto_2344907 ) ) ( not ( = ?auto_2344895 ?auto_2344908 ) ) ( not ( = ?auto_2344895 ?auto_2344909 ) ) ( not ( = ?auto_2344895 ?auto_2344910 ) ) ( not ( = ?auto_2344896 ?auto_2344897 ) ) ( not ( = ?auto_2344896 ?auto_2344898 ) ) ( not ( = ?auto_2344896 ?auto_2344899 ) ) ( not ( = ?auto_2344896 ?auto_2344900 ) ) ( not ( = ?auto_2344896 ?auto_2344901 ) ) ( not ( = ?auto_2344896 ?auto_2344902 ) ) ( not ( = ?auto_2344896 ?auto_2344903 ) ) ( not ( = ?auto_2344896 ?auto_2344904 ) ) ( not ( = ?auto_2344896 ?auto_2344905 ) ) ( not ( = ?auto_2344896 ?auto_2344906 ) ) ( not ( = ?auto_2344896 ?auto_2344907 ) ) ( not ( = ?auto_2344896 ?auto_2344908 ) ) ( not ( = ?auto_2344896 ?auto_2344909 ) ) ( not ( = ?auto_2344896 ?auto_2344910 ) ) ( not ( = ?auto_2344897 ?auto_2344898 ) ) ( not ( = ?auto_2344897 ?auto_2344899 ) ) ( not ( = ?auto_2344897 ?auto_2344900 ) ) ( not ( = ?auto_2344897 ?auto_2344901 ) ) ( not ( = ?auto_2344897 ?auto_2344902 ) ) ( not ( = ?auto_2344897 ?auto_2344903 ) ) ( not ( = ?auto_2344897 ?auto_2344904 ) ) ( not ( = ?auto_2344897 ?auto_2344905 ) ) ( not ( = ?auto_2344897 ?auto_2344906 ) ) ( not ( = ?auto_2344897 ?auto_2344907 ) ) ( not ( = ?auto_2344897 ?auto_2344908 ) ) ( not ( = ?auto_2344897 ?auto_2344909 ) ) ( not ( = ?auto_2344897 ?auto_2344910 ) ) ( not ( = ?auto_2344898 ?auto_2344899 ) ) ( not ( = ?auto_2344898 ?auto_2344900 ) ) ( not ( = ?auto_2344898 ?auto_2344901 ) ) ( not ( = ?auto_2344898 ?auto_2344902 ) ) ( not ( = ?auto_2344898 ?auto_2344903 ) ) ( not ( = ?auto_2344898 ?auto_2344904 ) ) ( not ( = ?auto_2344898 ?auto_2344905 ) ) ( not ( = ?auto_2344898 ?auto_2344906 ) ) ( not ( = ?auto_2344898 ?auto_2344907 ) ) ( not ( = ?auto_2344898 ?auto_2344908 ) ) ( not ( = ?auto_2344898 ?auto_2344909 ) ) ( not ( = ?auto_2344898 ?auto_2344910 ) ) ( not ( = ?auto_2344899 ?auto_2344900 ) ) ( not ( = ?auto_2344899 ?auto_2344901 ) ) ( not ( = ?auto_2344899 ?auto_2344902 ) ) ( not ( = ?auto_2344899 ?auto_2344903 ) ) ( not ( = ?auto_2344899 ?auto_2344904 ) ) ( not ( = ?auto_2344899 ?auto_2344905 ) ) ( not ( = ?auto_2344899 ?auto_2344906 ) ) ( not ( = ?auto_2344899 ?auto_2344907 ) ) ( not ( = ?auto_2344899 ?auto_2344908 ) ) ( not ( = ?auto_2344899 ?auto_2344909 ) ) ( not ( = ?auto_2344899 ?auto_2344910 ) ) ( not ( = ?auto_2344900 ?auto_2344901 ) ) ( not ( = ?auto_2344900 ?auto_2344902 ) ) ( not ( = ?auto_2344900 ?auto_2344903 ) ) ( not ( = ?auto_2344900 ?auto_2344904 ) ) ( not ( = ?auto_2344900 ?auto_2344905 ) ) ( not ( = ?auto_2344900 ?auto_2344906 ) ) ( not ( = ?auto_2344900 ?auto_2344907 ) ) ( not ( = ?auto_2344900 ?auto_2344908 ) ) ( not ( = ?auto_2344900 ?auto_2344909 ) ) ( not ( = ?auto_2344900 ?auto_2344910 ) ) ( not ( = ?auto_2344901 ?auto_2344902 ) ) ( not ( = ?auto_2344901 ?auto_2344903 ) ) ( not ( = ?auto_2344901 ?auto_2344904 ) ) ( not ( = ?auto_2344901 ?auto_2344905 ) ) ( not ( = ?auto_2344901 ?auto_2344906 ) ) ( not ( = ?auto_2344901 ?auto_2344907 ) ) ( not ( = ?auto_2344901 ?auto_2344908 ) ) ( not ( = ?auto_2344901 ?auto_2344909 ) ) ( not ( = ?auto_2344901 ?auto_2344910 ) ) ( not ( = ?auto_2344902 ?auto_2344903 ) ) ( not ( = ?auto_2344902 ?auto_2344904 ) ) ( not ( = ?auto_2344902 ?auto_2344905 ) ) ( not ( = ?auto_2344902 ?auto_2344906 ) ) ( not ( = ?auto_2344902 ?auto_2344907 ) ) ( not ( = ?auto_2344902 ?auto_2344908 ) ) ( not ( = ?auto_2344902 ?auto_2344909 ) ) ( not ( = ?auto_2344902 ?auto_2344910 ) ) ( not ( = ?auto_2344903 ?auto_2344904 ) ) ( not ( = ?auto_2344903 ?auto_2344905 ) ) ( not ( = ?auto_2344903 ?auto_2344906 ) ) ( not ( = ?auto_2344903 ?auto_2344907 ) ) ( not ( = ?auto_2344903 ?auto_2344908 ) ) ( not ( = ?auto_2344903 ?auto_2344909 ) ) ( not ( = ?auto_2344903 ?auto_2344910 ) ) ( not ( = ?auto_2344904 ?auto_2344905 ) ) ( not ( = ?auto_2344904 ?auto_2344906 ) ) ( not ( = ?auto_2344904 ?auto_2344907 ) ) ( not ( = ?auto_2344904 ?auto_2344908 ) ) ( not ( = ?auto_2344904 ?auto_2344909 ) ) ( not ( = ?auto_2344904 ?auto_2344910 ) ) ( not ( = ?auto_2344905 ?auto_2344906 ) ) ( not ( = ?auto_2344905 ?auto_2344907 ) ) ( not ( = ?auto_2344905 ?auto_2344908 ) ) ( not ( = ?auto_2344905 ?auto_2344909 ) ) ( not ( = ?auto_2344905 ?auto_2344910 ) ) ( not ( = ?auto_2344906 ?auto_2344907 ) ) ( not ( = ?auto_2344906 ?auto_2344908 ) ) ( not ( = ?auto_2344906 ?auto_2344909 ) ) ( not ( = ?auto_2344906 ?auto_2344910 ) ) ( not ( = ?auto_2344907 ?auto_2344908 ) ) ( not ( = ?auto_2344907 ?auto_2344909 ) ) ( not ( = ?auto_2344907 ?auto_2344910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2344908 ?auto_2344909 ?auto_2344910 )
      ( MAKE-15CRATE-VERIFY ?auto_2344895 ?auto_2344896 ?auto_2344897 ?auto_2344898 ?auto_2344899 ?auto_2344900 ?auto_2344901 ?auto_2344902 ?auto_2344903 ?auto_2344904 ?auto_2344905 ?auto_2344906 ?auto_2344907 ?auto_2344908 ?auto_2344909 ?auto_2344910 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345090 - SURFACE
      ?auto_2345091 - SURFACE
      ?auto_2345092 - SURFACE
      ?auto_2345093 - SURFACE
      ?auto_2345094 - SURFACE
      ?auto_2345095 - SURFACE
      ?auto_2345096 - SURFACE
      ?auto_2345097 - SURFACE
      ?auto_2345098 - SURFACE
      ?auto_2345099 - SURFACE
      ?auto_2345100 - SURFACE
      ?auto_2345101 - SURFACE
      ?auto_2345102 - SURFACE
      ?auto_2345103 - SURFACE
      ?auto_2345104 - SURFACE
      ?auto_2345105 - SURFACE
    )
    :vars
    (
      ?auto_2345109 - HOIST
      ?auto_2345106 - PLACE
      ?auto_2345108 - TRUCK
      ?auto_2345107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345109 ?auto_2345106 ) ( SURFACE-AT ?auto_2345104 ?auto_2345106 ) ( CLEAR ?auto_2345104 ) ( IS-CRATE ?auto_2345105 ) ( not ( = ?auto_2345104 ?auto_2345105 ) ) ( AVAILABLE ?auto_2345109 ) ( IN ?auto_2345105 ?auto_2345108 ) ( ON ?auto_2345104 ?auto_2345103 ) ( not ( = ?auto_2345103 ?auto_2345104 ) ) ( not ( = ?auto_2345103 ?auto_2345105 ) ) ( TRUCK-AT ?auto_2345108 ?auto_2345107 ) ( not ( = ?auto_2345107 ?auto_2345106 ) ) ( ON ?auto_2345091 ?auto_2345090 ) ( ON ?auto_2345092 ?auto_2345091 ) ( ON ?auto_2345093 ?auto_2345092 ) ( ON ?auto_2345094 ?auto_2345093 ) ( ON ?auto_2345095 ?auto_2345094 ) ( ON ?auto_2345096 ?auto_2345095 ) ( ON ?auto_2345097 ?auto_2345096 ) ( ON ?auto_2345098 ?auto_2345097 ) ( ON ?auto_2345099 ?auto_2345098 ) ( ON ?auto_2345100 ?auto_2345099 ) ( ON ?auto_2345101 ?auto_2345100 ) ( ON ?auto_2345102 ?auto_2345101 ) ( ON ?auto_2345103 ?auto_2345102 ) ( not ( = ?auto_2345090 ?auto_2345091 ) ) ( not ( = ?auto_2345090 ?auto_2345092 ) ) ( not ( = ?auto_2345090 ?auto_2345093 ) ) ( not ( = ?auto_2345090 ?auto_2345094 ) ) ( not ( = ?auto_2345090 ?auto_2345095 ) ) ( not ( = ?auto_2345090 ?auto_2345096 ) ) ( not ( = ?auto_2345090 ?auto_2345097 ) ) ( not ( = ?auto_2345090 ?auto_2345098 ) ) ( not ( = ?auto_2345090 ?auto_2345099 ) ) ( not ( = ?auto_2345090 ?auto_2345100 ) ) ( not ( = ?auto_2345090 ?auto_2345101 ) ) ( not ( = ?auto_2345090 ?auto_2345102 ) ) ( not ( = ?auto_2345090 ?auto_2345103 ) ) ( not ( = ?auto_2345090 ?auto_2345104 ) ) ( not ( = ?auto_2345090 ?auto_2345105 ) ) ( not ( = ?auto_2345091 ?auto_2345092 ) ) ( not ( = ?auto_2345091 ?auto_2345093 ) ) ( not ( = ?auto_2345091 ?auto_2345094 ) ) ( not ( = ?auto_2345091 ?auto_2345095 ) ) ( not ( = ?auto_2345091 ?auto_2345096 ) ) ( not ( = ?auto_2345091 ?auto_2345097 ) ) ( not ( = ?auto_2345091 ?auto_2345098 ) ) ( not ( = ?auto_2345091 ?auto_2345099 ) ) ( not ( = ?auto_2345091 ?auto_2345100 ) ) ( not ( = ?auto_2345091 ?auto_2345101 ) ) ( not ( = ?auto_2345091 ?auto_2345102 ) ) ( not ( = ?auto_2345091 ?auto_2345103 ) ) ( not ( = ?auto_2345091 ?auto_2345104 ) ) ( not ( = ?auto_2345091 ?auto_2345105 ) ) ( not ( = ?auto_2345092 ?auto_2345093 ) ) ( not ( = ?auto_2345092 ?auto_2345094 ) ) ( not ( = ?auto_2345092 ?auto_2345095 ) ) ( not ( = ?auto_2345092 ?auto_2345096 ) ) ( not ( = ?auto_2345092 ?auto_2345097 ) ) ( not ( = ?auto_2345092 ?auto_2345098 ) ) ( not ( = ?auto_2345092 ?auto_2345099 ) ) ( not ( = ?auto_2345092 ?auto_2345100 ) ) ( not ( = ?auto_2345092 ?auto_2345101 ) ) ( not ( = ?auto_2345092 ?auto_2345102 ) ) ( not ( = ?auto_2345092 ?auto_2345103 ) ) ( not ( = ?auto_2345092 ?auto_2345104 ) ) ( not ( = ?auto_2345092 ?auto_2345105 ) ) ( not ( = ?auto_2345093 ?auto_2345094 ) ) ( not ( = ?auto_2345093 ?auto_2345095 ) ) ( not ( = ?auto_2345093 ?auto_2345096 ) ) ( not ( = ?auto_2345093 ?auto_2345097 ) ) ( not ( = ?auto_2345093 ?auto_2345098 ) ) ( not ( = ?auto_2345093 ?auto_2345099 ) ) ( not ( = ?auto_2345093 ?auto_2345100 ) ) ( not ( = ?auto_2345093 ?auto_2345101 ) ) ( not ( = ?auto_2345093 ?auto_2345102 ) ) ( not ( = ?auto_2345093 ?auto_2345103 ) ) ( not ( = ?auto_2345093 ?auto_2345104 ) ) ( not ( = ?auto_2345093 ?auto_2345105 ) ) ( not ( = ?auto_2345094 ?auto_2345095 ) ) ( not ( = ?auto_2345094 ?auto_2345096 ) ) ( not ( = ?auto_2345094 ?auto_2345097 ) ) ( not ( = ?auto_2345094 ?auto_2345098 ) ) ( not ( = ?auto_2345094 ?auto_2345099 ) ) ( not ( = ?auto_2345094 ?auto_2345100 ) ) ( not ( = ?auto_2345094 ?auto_2345101 ) ) ( not ( = ?auto_2345094 ?auto_2345102 ) ) ( not ( = ?auto_2345094 ?auto_2345103 ) ) ( not ( = ?auto_2345094 ?auto_2345104 ) ) ( not ( = ?auto_2345094 ?auto_2345105 ) ) ( not ( = ?auto_2345095 ?auto_2345096 ) ) ( not ( = ?auto_2345095 ?auto_2345097 ) ) ( not ( = ?auto_2345095 ?auto_2345098 ) ) ( not ( = ?auto_2345095 ?auto_2345099 ) ) ( not ( = ?auto_2345095 ?auto_2345100 ) ) ( not ( = ?auto_2345095 ?auto_2345101 ) ) ( not ( = ?auto_2345095 ?auto_2345102 ) ) ( not ( = ?auto_2345095 ?auto_2345103 ) ) ( not ( = ?auto_2345095 ?auto_2345104 ) ) ( not ( = ?auto_2345095 ?auto_2345105 ) ) ( not ( = ?auto_2345096 ?auto_2345097 ) ) ( not ( = ?auto_2345096 ?auto_2345098 ) ) ( not ( = ?auto_2345096 ?auto_2345099 ) ) ( not ( = ?auto_2345096 ?auto_2345100 ) ) ( not ( = ?auto_2345096 ?auto_2345101 ) ) ( not ( = ?auto_2345096 ?auto_2345102 ) ) ( not ( = ?auto_2345096 ?auto_2345103 ) ) ( not ( = ?auto_2345096 ?auto_2345104 ) ) ( not ( = ?auto_2345096 ?auto_2345105 ) ) ( not ( = ?auto_2345097 ?auto_2345098 ) ) ( not ( = ?auto_2345097 ?auto_2345099 ) ) ( not ( = ?auto_2345097 ?auto_2345100 ) ) ( not ( = ?auto_2345097 ?auto_2345101 ) ) ( not ( = ?auto_2345097 ?auto_2345102 ) ) ( not ( = ?auto_2345097 ?auto_2345103 ) ) ( not ( = ?auto_2345097 ?auto_2345104 ) ) ( not ( = ?auto_2345097 ?auto_2345105 ) ) ( not ( = ?auto_2345098 ?auto_2345099 ) ) ( not ( = ?auto_2345098 ?auto_2345100 ) ) ( not ( = ?auto_2345098 ?auto_2345101 ) ) ( not ( = ?auto_2345098 ?auto_2345102 ) ) ( not ( = ?auto_2345098 ?auto_2345103 ) ) ( not ( = ?auto_2345098 ?auto_2345104 ) ) ( not ( = ?auto_2345098 ?auto_2345105 ) ) ( not ( = ?auto_2345099 ?auto_2345100 ) ) ( not ( = ?auto_2345099 ?auto_2345101 ) ) ( not ( = ?auto_2345099 ?auto_2345102 ) ) ( not ( = ?auto_2345099 ?auto_2345103 ) ) ( not ( = ?auto_2345099 ?auto_2345104 ) ) ( not ( = ?auto_2345099 ?auto_2345105 ) ) ( not ( = ?auto_2345100 ?auto_2345101 ) ) ( not ( = ?auto_2345100 ?auto_2345102 ) ) ( not ( = ?auto_2345100 ?auto_2345103 ) ) ( not ( = ?auto_2345100 ?auto_2345104 ) ) ( not ( = ?auto_2345100 ?auto_2345105 ) ) ( not ( = ?auto_2345101 ?auto_2345102 ) ) ( not ( = ?auto_2345101 ?auto_2345103 ) ) ( not ( = ?auto_2345101 ?auto_2345104 ) ) ( not ( = ?auto_2345101 ?auto_2345105 ) ) ( not ( = ?auto_2345102 ?auto_2345103 ) ) ( not ( = ?auto_2345102 ?auto_2345104 ) ) ( not ( = ?auto_2345102 ?auto_2345105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345103 ?auto_2345104 ?auto_2345105 )
      ( MAKE-15CRATE-VERIFY ?auto_2345090 ?auto_2345091 ?auto_2345092 ?auto_2345093 ?auto_2345094 ?auto_2345095 ?auto_2345096 ?auto_2345097 ?auto_2345098 ?auto_2345099 ?auto_2345100 ?auto_2345101 ?auto_2345102 ?auto_2345103 ?auto_2345104 ?auto_2345105 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345300 - SURFACE
      ?auto_2345301 - SURFACE
      ?auto_2345302 - SURFACE
      ?auto_2345303 - SURFACE
      ?auto_2345304 - SURFACE
      ?auto_2345305 - SURFACE
      ?auto_2345306 - SURFACE
      ?auto_2345307 - SURFACE
      ?auto_2345308 - SURFACE
      ?auto_2345309 - SURFACE
      ?auto_2345310 - SURFACE
      ?auto_2345311 - SURFACE
      ?auto_2345312 - SURFACE
      ?auto_2345313 - SURFACE
      ?auto_2345314 - SURFACE
      ?auto_2345315 - SURFACE
    )
    :vars
    (
      ?auto_2345319 - HOIST
      ?auto_2345316 - PLACE
      ?auto_2345318 - TRUCK
      ?auto_2345320 - PLACE
      ?auto_2345317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345319 ?auto_2345316 ) ( SURFACE-AT ?auto_2345314 ?auto_2345316 ) ( CLEAR ?auto_2345314 ) ( IS-CRATE ?auto_2345315 ) ( not ( = ?auto_2345314 ?auto_2345315 ) ) ( AVAILABLE ?auto_2345319 ) ( ON ?auto_2345314 ?auto_2345313 ) ( not ( = ?auto_2345313 ?auto_2345314 ) ) ( not ( = ?auto_2345313 ?auto_2345315 ) ) ( TRUCK-AT ?auto_2345318 ?auto_2345320 ) ( not ( = ?auto_2345320 ?auto_2345316 ) ) ( HOIST-AT ?auto_2345317 ?auto_2345320 ) ( LIFTING ?auto_2345317 ?auto_2345315 ) ( not ( = ?auto_2345319 ?auto_2345317 ) ) ( ON ?auto_2345301 ?auto_2345300 ) ( ON ?auto_2345302 ?auto_2345301 ) ( ON ?auto_2345303 ?auto_2345302 ) ( ON ?auto_2345304 ?auto_2345303 ) ( ON ?auto_2345305 ?auto_2345304 ) ( ON ?auto_2345306 ?auto_2345305 ) ( ON ?auto_2345307 ?auto_2345306 ) ( ON ?auto_2345308 ?auto_2345307 ) ( ON ?auto_2345309 ?auto_2345308 ) ( ON ?auto_2345310 ?auto_2345309 ) ( ON ?auto_2345311 ?auto_2345310 ) ( ON ?auto_2345312 ?auto_2345311 ) ( ON ?auto_2345313 ?auto_2345312 ) ( not ( = ?auto_2345300 ?auto_2345301 ) ) ( not ( = ?auto_2345300 ?auto_2345302 ) ) ( not ( = ?auto_2345300 ?auto_2345303 ) ) ( not ( = ?auto_2345300 ?auto_2345304 ) ) ( not ( = ?auto_2345300 ?auto_2345305 ) ) ( not ( = ?auto_2345300 ?auto_2345306 ) ) ( not ( = ?auto_2345300 ?auto_2345307 ) ) ( not ( = ?auto_2345300 ?auto_2345308 ) ) ( not ( = ?auto_2345300 ?auto_2345309 ) ) ( not ( = ?auto_2345300 ?auto_2345310 ) ) ( not ( = ?auto_2345300 ?auto_2345311 ) ) ( not ( = ?auto_2345300 ?auto_2345312 ) ) ( not ( = ?auto_2345300 ?auto_2345313 ) ) ( not ( = ?auto_2345300 ?auto_2345314 ) ) ( not ( = ?auto_2345300 ?auto_2345315 ) ) ( not ( = ?auto_2345301 ?auto_2345302 ) ) ( not ( = ?auto_2345301 ?auto_2345303 ) ) ( not ( = ?auto_2345301 ?auto_2345304 ) ) ( not ( = ?auto_2345301 ?auto_2345305 ) ) ( not ( = ?auto_2345301 ?auto_2345306 ) ) ( not ( = ?auto_2345301 ?auto_2345307 ) ) ( not ( = ?auto_2345301 ?auto_2345308 ) ) ( not ( = ?auto_2345301 ?auto_2345309 ) ) ( not ( = ?auto_2345301 ?auto_2345310 ) ) ( not ( = ?auto_2345301 ?auto_2345311 ) ) ( not ( = ?auto_2345301 ?auto_2345312 ) ) ( not ( = ?auto_2345301 ?auto_2345313 ) ) ( not ( = ?auto_2345301 ?auto_2345314 ) ) ( not ( = ?auto_2345301 ?auto_2345315 ) ) ( not ( = ?auto_2345302 ?auto_2345303 ) ) ( not ( = ?auto_2345302 ?auto_2345304 ) ) ( not ( = ?auto_2345302 ?auto_2345305 ) ) ( not ( = ?auto_2345302 ?auto_2345306 ) ) ( not ( = ?auto_2345302 ?auto_2345307 ) ) ( not ( = ?auto_2345302 ?auto_2345308 ) ) ( not ( = ?auto_2345302 ?auto_2345309 ) ) ( not ( = ?auto_2345302 ?auto_2345310 ) ) ( not ( = ?auto_2345302 ?auto_2345311 ) ) ( not ( = ?auto_2345302 ?auto_2345312 ) ) ( not ( = ?auto_2345302 ?auto_2345313 ) ) ( not ( = ?auto_2345302 ?auto_2345314 ) ) ( not ( = ?auto_2345302 ?auto_2345315 ) ) ( not ( = ?auto_2345303 ?auto_2345304 ) ) ( not ( = ?auto_2345303 ?auto_2345305 ) ) ( not ( = ?auto_2345303 ?auto_2345306 ) ) ( not ( = ?auto_2345303 ?auto_2345307 ) ) ( not ( = ?auto_2345303 ?auto_2345308 ) ) ( not ( = ?auto_2345303 ?auto_2345309 ) ) ( not ( = ?auto_2345303 ?auto_2345310 ) ) ( not ( = ?auto_2345303 ?auto_2345311 ) ) ( not ( = ?auto_2345303 ?auto_2345312 ) ) ( not ( = ?auto_2345303 ?auto_2345313 ) ) ( not ( = ?auto_2345303 ?auto_2345314 ) ) ( not ( = ?auto_2345303 ?auto_2345315 ) ) ( not ( = ?auto_2345304 ?auto_2345305 ) ) ( not ( = ?auto_2345304 ?auto_2345306 ) ) ( not ( = ?auto_2345304 ?auto_2345307 ) ) ( not ( = ?auto_2345304 ?auto_2345308 ) ) ( not ( = ?auto_2345304 ?auto_2345309 ) ) ( not ( = ?auto_2345304 ?auto_2345310 ) ) ( not ( = ?auto_2345304 ?auto_2345311 ) ) ( not ( = ?auto_2345304 ?auto_2345312 ) ) ( not ( = ?auto_2345304 ?auto_2345313 ) ) ( not ( = ?auto_2345304 ?auto_2345314 ) ) ( not ( = ?auto_2345304 ?auto_2345315 ) ) ( not ( = ?auto_2345305 ?auto_2345306 ) ) ( not ( = ?auto_2345305 ?auto_2345307 ) ) ( not ( = ?auto_2345305 ?auto_2345308 ) ) ( not ( = ?auto_2345305 ?auto_2345309 ) ) ( not ( = ?auto_2345305 ?auto_2345310 ) ) ( not ( = ?auto_2345305 ?auto_2345311 ) ) ( not ( = ?auto_2345305 ?auto_2345312 ) ) ( not ( = ?auto_2345305 ?auto_2345313 ) ) ( not ( = ?auto_2345305 ?auto_2345314 ) ) ( not ( = ?auto_2345305 ?auto_2345315 ) ) ( not ( = ?auto_2345306 ?auto_2345307 ) ) ( not ( = ?auto_2345306 ?auto_2345308 ) ) ( not ( = ?auto_2345306 ?auto_2345309 ) ) ( not ( = ?auto_2345306 ?auto_2345310 ) ) ( not ( = ?auto_2345306 ?auto_2345311 ) ) ( not ( = ?auto_2345306 ?auto_2345312 ) ) ( not ( = ?auto_2345306 ?auto_2345313 ) ) ( not ( = ?auto_2345306 ?auto_2345314 ) ) ( not ( = ?auto_2345306 ?auto_2345315 ) ) ( not ( = ?auto_2345307 ?auto_2345308 ) ) ( not ( = ?auto_2345307 ?auto_2345309 ) ) ( not ( = ?auto_2345307 ?auto_2345310 ) ) ( not ( = ?auto_2345307 ?auto_2345311 ) ) ( not ( = ?auto_2345307 ?auto_2345312 ) ) ( not ( = ?auto_2345307 ?auto_2345313 ) ) ( not ( = ?auto_2345307 ?auto_2345314 ) ) ( not ( = ?auto_2345307 ?auto_2345315 ) ) ( not ( = ?auto_2345308 ?auto_2345309 ) ) ( not ( = ?auto_2345308 ?auto_2345310 ) ) ( not ( = ?auto_2345308 ?auto_2345311 ) ) ( not ( = ?auto_2345308 ?auto_2345312 ) ) ( not ( = ?auto_2345308 ?auto_2345313 ) ) ( not ( = ?auto_2345308 ?auto_2345314 ) ) ( not ( = ?auto_2345308 ?auto_2345315 ) ) ( not ( = ?auto_2345309 ?auto_2345310 ) ) ( not ( = ?auto_2345309 ?auto_2345311 ) ) ( not ( = ?auto_2345309 ?auto_2345312 ) ) ( not ( = ?auto_2345309 ?auto_2345313 ) ) ( not ( = ?auto_2345309 ?auto_2345314 ) ) ( not ( = ?auto_2345309 ?auto_2345315 ) ) ( not ( = ?auto_2345310 ?auto_2345311 ) ) ( not ( = ?auto_2345310 ?auto_2345312 ) ) ( not ( = ?auto_2345310 ?auto_2345313 ) ) ( not ( = ?auto_2345310 ?auto_2345314 ) ) ( not ( = ?auto_2345310 ?auto_2345315 ) ) ( not ( = ?auto_2345311 ?auto_2345312 ) ) ( not ( = ?auto_2345311 ?auto_2345313 ) ) ( not ( = ?auto_2345311 ?auto_2345314 ) ) ( not ( = ?auto_2345311 ?auto_2345315 ) ) ( not ( = ?auto_2345312 ?auto_2345313 ) ) ( not ( = ?auto_2345312 ?auto_2345314 ) ) ( not ( = ?auto_2345312 ?auto_2345315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345313 ?auto_2345314 ?auto_2345315 )
      ( MAKE-15CRATE-VERIFY ?auto_2345300 ?auto_2345301 ?auto_2345302 ?auto_2345303 ?auto_2345304 ?auto_2345305 ?auto_2345306 ?auto_2345307 ?auto_2345308 ?auto_2345309 ?auto_2345310 ?auto_2345311 ?auto_2345312 ?auto_2345313 ?auto_2345314 ?auto_2345315 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345525 - SURFACE
      ?auto_2345526 - SURFACE
      ?auto_2345527 - SURFACE
      ?auto_2345528 - SURFACE
      ?auto_2345529 - SURFACE
      ?auto_2345530 - SURFACE
      ?auto_2345531 - SURFACE
      ?auto_2345532 - SURFACE
      ?auto_2345533 - SURFACE
      ?auto_2345534 - SURFACE
      ?auto_2345535 - SURFACE
      ?auto_2345536 - SURFACE
      ?auto_2345537 - SURFACE
      ?auto_2345538 - SURFACE
      ?auto_2345539 - SURFACE
      ?auto_2345540 - SURFACE
    )
    :vars
    (
      ?auto_2345546 - HOIST
      ?auto_2345541 - PLACE
      ?auto_2345544 - TRUCK
      ?auto_2345542 - PLACE
      ?auto_2345543 - HOIST
      ?auto_2345545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345546 ?auto_2345541 ) ( SURFACE-AT ?auto_2345539 ?auto_2345541 ) ( CLEAR ?auto_2345539 ) ( IS-CRATE ?auto_2345540 ) ( not ( = ?auto_2345539 ?auto_2345540 ) ) ( AVAILABLE ?auto_2345546 ) ( ON ?auto_2345539 ?auto_2345538 ) ( not ( = ?auto_2345538 ?auto_2345539 ) ) ( not ( = ?auto_2345538 ?auto_2345540 ) ) ( TRUCK-AT ?auto_2345544 ?auto_2345542 ) ( not ( = ?auto_2345542 ?auto_2345541 ) ) ( HOIST-AT ?auto_2345543 ?auto_2345542 ) ( not ( = ?auto_2345546 ?auto_2345543 ) ) ( AVAILABLE ?auto_2345543 ) ( SURFACE-AT ?auto_2345540 ?auto_2345542 ) ( ON ?auto_2345540 ?auto_2345545 ) ( CLEAR ?auto_2345540 ) ( not ( = ?auto_2345539 ?auto_2345545 ) ) ( not ( = ?auto_2345540 ?auto_2345545 ) ) ( not ( = ?auto_2345538 ?auto_2345545 ) ) ( ON ?auto_2345526 ?auto_2345525 ) ( ON ?auto_2345527 ?auto_2345526 ) ( ON ?auto_2345528 ?auto_2345527 ) ( ON ?auto_2345529 ?auto_2345528 ) ( ON ?auto_2345530 ?auto_2345529 ) ( ON ?auto_2345531 ?auto_2345530 ) ( ON ?auto_2345532 ?auto_2345531 ) ( ON ?auto_2345533 ?auto_2345532 ) ( ON ?auto_2345534 ?auto_2345533 ) ( ON ?auto_2345535 ?auto_2345534 ) ( ON ?auto_2345536 ?auto_2345535 ) ( ON ?auto_2345537 ?auto_2345536 ) ( ON ?auto_2345538 ?auto_2345537 ) ( not ( = ?auto_2345525 ?auto_2345526 ) ) ( not ( = ?auto_2345525 ?auto_2345527 ) ) ( not ( = ?auto_2345525 ?auto_2345528 ) ) ( not ( = ?auto_2345525 ?auto_2345529 ) ) ( not ( = ?auto_2345525 ?auto_2345530 ) ) ( not ( = ?auto_2345525 ?auto_2345531 ) ) ( not ( = ?auto_2345525 ?auto_2345532 ) ) ( not ( = ?auto_2345525 ?auto_2345533 ) ) ( not ( = ?auto_2345525 ?auto_2345534 ) ) ( not ( = ?auto_2345525 ?auto_2345535 ) ) ( not ( = ?auto_2345525 ?auto_2345536 ) ) ( not ( = ?auto_2345525 ?auto_2345537 ) ) ( not ( = ?auto_2345525 ?auto_2345538 ) ) ( not ( = ?auto_2345525 ?auto_2345539 ) ) ( not ( = ?auto_2345525 ?auto_2345540 ) ) ( not ( = ?auto_2345525 ?auto_2345545 ) ) ( not ( = ?auto_2345526 ?auto_2345527 ) ) ( not ( = ?auto_2345526 ?auto_2345528 ) ) ( not ( = ?auto_2345526 ?auto_2345529 ) ) ( not ( = ?auto_2345526 ?auto_2345530 ) ) ( not ( = ?auto_2345526 ?auto_2345531 ) ) ( not ( = ?auto_2345526 ?auto_2345532 ) ) ( not ( = ?auto_2345526 ?auto_2345533 ) ) ( not ( = ?auto_2345526 ?auto_2345534 ) ) ( not ( = ?auto_2345526 ?auto_2345535 ) ) ( not ( = ?auto_2345526 ?auto_2345536 ) ) ( not ( = ?auto_2345526 ?auto_2345537 ) ) ( not ( = ?auto_2345526 ?auto_2345538 ) ) ( not ( = ?auto_2345526 ?auto_2345539 ) ) ( not ( = ?auto_2345526 ?auto_2345540 ) ) ( not ( = ?auto_2345526 ?auto_2345545 ) ) ( not ( = ?auto_2345527 ?auto_2345528 ) ) ( not ( = ?auto_2345527 ?auto_2345529 ) ) ( not ( = ?auto_2345527 ?auto_2345530 ) ) ( not ( = ?auto_2345527 ?auto_2345531 ) ) ( not ( = ?auto_2345527 ?auto_2345532 ) ) ( not ( = ?auto_2345527 ?auto_2345533 ) ) ( not ( = ?auto_2345527 ?auto_2345534 ) ) ( not ( = ?auto_2345527 ?auto_2345535 ) ) ( not ( = ?auto_2345527 ?auto_2345536 ) ) ( not ( = ?auto_2345527 ?auto_2345537 ) ) ( not ( = ?auto_2345527 ?auto_2345538 ) ) ( not ( = ?auto_2345527 ?auto_2345539 ) ) ( not ( = ?auto_2345527 ?auto_2345540 ) ) ( not ( = ?auto_2345527 ?auto_2345545 ) ) ( not ( = ?auto_2345528 ?auto_2345529 ) ) ( not ( = ?auto_2345528 ?auto_2345530 ) ) ( not ( = ?auto_2345528 ?auto_2345531 ) ) ( not ( = ?auto_2345528 ?auto_2345532 ) ) ( not ( = ?auto_2345528 ?auto_2345533 ) ) ( not ( = ?auto_2345528 ?auto_2345534 ) ) ( not ( = ?auto_2345528 ?auto_2345535 ) ) ( not ( = ?auto_2345528 ?auto_2345536 ) ) ( not ( = ?auto_2345528 ?auto_2345537 ) ) ( not ( = ?auto_2345528 ?auto_2345538 ) ) ( not ( = ?auto_2345528 ?auto_2345539 ) ) ( not ( = ?auto_2345528 ?auto_2345540 ) ) ( not ( = ?auto_2345528 ?auto_2345545 ) ) ( not ( = ?auto_2345529 ?auto_2345530 ) ) ( not ( = ?auto_2345529 ?auto_2345531 ) ) ( not ( = ?auto_2345529 ?auto_2345532 ) ) ( not ( = ?auto_2345529 ?auto_2345533 ) ) ( not ( = ?auto_2345529 ?auto_2345534 ) ) ( not ( = ?auto_2345529 ?auto_2345535 ) ) ( not ( = ?auto_2345529 ?auto_2345536 ) ) ( not ( = ?auto_2345529 ?auto_2345537 ) ) ( not ( = ?auto_2345529 ?auto_2345538 ) ) ( not ( = ?auto_2345529 ?auto_2345539 ) ) ( not ( = ?auto_2345529 ?auto_2345540 ) ) ( not ( = ?auto_2345529 ?auto_2345545 ) ) ( not ( = ?auto_2345530 ?auto_2345531 ) ) ( not ( = ?auto_2345530 ?auto_2345532 ) ) ( not ( = ?auto_2345530 ?auto_2345533 ) ) ( not ( = ?auto_2345530 ?auto_2345534 ) ) ( not ( = ?auto_2345530 ?auto_2345535 ) ) ( not ( = ?auto_2345530 ?auto_2345536 ) ) ( not ( = ?auto_2345530 ?auto_2345537 ) ) ( not ( = ?auto_2345530 ?auto_2345538 ) ) ( not ( = ?auto_2345530 ?auto_2345539 ) ) ( not ( = ?auto_2345530 ?auto_2345540 ) ) ( not ( = ?auto_2345530 ?auto_2345545 ) ) ( not ( = ?auto_2345531 ?auto_2345532 ) ) ( not ( = ?auto_2345531 ?auto_2345533 ) ) ( not ( = ?auto_2345531 ?auto_2345534 ) ) ( not ( = ?auto_2345531 ?auto_2345535 ) ) ( not ( = ?auto_2345531 ?auto_2345536 ) ) ( not ( = ?auto_2345531 ?auto_2345537 ) ) ( not ( = ?auto_2345531 ?auto_2345538 ) ) ( not ( = ?auto_2345531 ?auto_2345539 ) ) ( not ( = ?auto_2345531 ?auto_2345540 ) ) ( not ( = ?auto_2345531 ?auto_2345545 ) ) ( not ( = ?auto_2345532 ?auto_2345533 ) ) ( not ( = ?auto_2345532 ?auto_2345534 ) ) ( not ( = ?auto_2345532 ?auto_2345535 ) ) ( not ( = ?auto_2345532 ?auto_2345536 ) ) ( not ( = ?auto_2345532 ?auto_2345537 ) ) ( not ( = ?auto_2345532 ?auto_2345538 ) ) ( not ( = ?auto_2345532 ?auto_2345539 ) ) ( not ( = ?auto_2345532 ?auto_2345540 ) ) ( not ( = ?auto_2345532 ?auto_2345545 ) ) ( not ( = ?auto_2345533 ?auto_2345534 ) ) ( not ( = ?auto_2345533 ?auto_2345535 ) ) ( not ( = ?auto_2345533 ?auto_2345536 ) ) ( not ( = ?auto_2345533 ?auto_2345537 ) ) ( not ( = ?auto_2345533 ?auto_2345538 ) ) ( not ( = ?auto_2345533 ?auto_2345539 ) ) ( not ( = ?auto_2345533 ?auto_2345540 ) ) ( not ( = ?auto_2345533 ?auto_2345545 ) ) ( not ( = ?auto_2345534 ?auto_2345535 ) ) ( not ( = ?auto_2345534 ?auto_2345536 ) ) ( not ( = ?auto_2345534 ?auto_2345537 ) ) ( not ( = ?auto_2345534 ?auto_2345538 ) ) ( not ( = ?auto_2345534 ?auto_2345539 ) ) ( not ( = ?auto_2345534 ?auto_2345540 ) ) ( not ( = ?auto_2345534 ?auto_2345545 ) ) ( not ( = ?auto_2345535 ?auto_2345536 ) ) ( not ( = ?auto_2345535 ?auto_2345537 ) ) ( not ( = ?auto_2345535 ?auto_2345538 ) ) ( not ( = ?auto_2345535 ?auto_2345539 ) ) ( not ( = ?auto_2345535 ?auto_2345540 ) ) ( not ( = ?auto_2345535 ?auto_2345545 ) ) ( not ( = ?auto_2345536 ?auto_2345537 ) ) ( not ( = ?auto_2345536 ?auto_2345538 ) ) ( not ( = ?auto_2345536 ?auto_2345539 ) ) ( not ( = ?auto_2345536 ?auto_2345540 ) ) ( not ( = ?auto_2345536 ?auto_2345545 ) ) ( not ( = ?auto_2345537 ?auto_2345538 ) ) ( not ( = ?auto_2345537 ?auto_2345539 ) ) ( not ( = ?auto_2345537 ?auto_2345540 ) ) ( not ( = ?auto_2345537 ?auto_2345545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345538 ?auto_2345539 ?auto_2345540 )
      ( MAKE-15CRATE-VERIFY ?auto_2345525 ?auto_2345526 ?auto_2345527 ?auto_2345528 ?auto_2345529 ?auto_2345530 ?auto_2345531 ?auto_2345532 ?auto_2345533 ?auto_2345534 ?auto_2345535 ?auto_2345536 ?auto_2345537 ?auto_2345538 ?auto_2345539 ?auto_2345540 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345751 - SURFACE
      ?auto_2345752 - SURFACE
      ?auto_2345753 - SURFACE
      ?auto_2345754 - SURFACE
      ?auto_2345755 - SURFACE
      ?auto_2345756 - SURFACE
      ?auto_2345757 - SURFACE
      ?auto_2345758 - SURFACE
      ?auto_2345759 - SURFACE
      ?auto_2345760 - SURFACE
      ?auto_2345761 - SURFACE
      ?auto_2345762 - SURFACE
      ?auto_2345763 - SURFACE
      ?auto_2345764 - SURFACE
      ?auto_2345765 - SURFACE
      ?auto_2345766 - SURFACE
    )
    :vars
    (
      ?auto_2345769 - HOIST
      ?auto_2345767 - PLACE
      ?auto_2345772 - PLACE
      ?auto_2345770 - HOIST
      ?auto_2345768 - SURFACE
      ?auto_2345771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345769 ?auto_2345767 ) ( SURFACE-AT ?auto_2345765 ?auto_2345767 ) ( CLEAR ?auto_2345765 ) ( IS-CRATE ?auto_2345766 ) ( not ( = ?auto_2345765 ?auto_2345766 ) ) ( AVAILABLE ?auto_2345769 ) ( ON ?auto_2345765 ?auto_2345764 ) ( not ( = ?auto_2345764 ?auto_2345765 ) ) ( not ( = ?auto_2345764 ?auto_2345766 ) ) ( not ( = ?auto_2345772 ?auto_2345767 ) ) ( HOIST-AT ?auto_2345770 ?auto_2345772 ) ( not ( = ?auto_2345769 ?auto_2345770 ) ) ( AVAILABLE ?auto_2345770 ) ( SURFACE-AT ?auto_2345766 ?auto_2345772 ) ( ON ?auto_2345766 ?auto_2345768 ) ( CLEAR ?auto_2345766 ) ( not ( = ?auto_2345765 ?auto_2345768 ) ) ( not ( = ?auto_2345766 ?auto_2345768 ) ) ( not ( = ?auto_2345764 ?auto_2345768 ) ) ( TRUCK-AT ?auto_2345771 ?auto_2345767 ) ( ON ?auto_2345752 ?auto_2345751 ) ( ON ?auto_2345753 ?auto_2345752 ) ( ON ?auto_2345754 ?auto_2345753 ) ( ON ?auto_2345755 ?auto_2345754 ) ( ON ?auto_2345756 ?auto_2345755 ) ( ON ?auto_2345757 ?auto_2345756 ) ( ON ?auto_2345758 ?auto_2345757 ) ( ON ?auto_2345759 ?auto_2345758 ) ( ON ?auto_2345760 ?auto_2345759 ) ( ON ?auto_2345761 ?auto_2345760 ) ( ON ?auto_2345762 ?auto_2345761 ) ( ON ?auto_2345763 ?auto_2345762 ) ( ON ?auto_2345764 ?auto_2345763 ) ( not ( = ?auto_2345751 ?auto_2345752 ) ) ( not ( = ?auto_2345751 ?auto_2345753 ) ) ( not ( = ?auto_2345751 ?auto_2345754 ) ) ( not ( = ?auto_2345751 ?auto_2345755 ) ) ( not ( = ?auto_2345751 ?auto_2345756 ) ) ( not ( = ?auto_2345751 ?auto_2345757 ) ) ( not ( = ?auto_2345751 ?auto_2345758 ) ) ( not ( = ?auto_2345751 ?auto_2345759 ) ) ( not ( = ?auto_2345751 ?auto_2345760 ) ) ( not ( = ?auto_2345751 ?auto_2345761 ) ) ( not ( = ?auto_2345751 ?auto_2345762 ) ) ( not ( = ?auto_2345751 ?auto_2345763 ) ) ( not ( = ?auto_2345751 ?auto_2345764 ) ) ( not ( = ?auto_2345751 ?auto_2345765 ) ) ( not ( = ?auto_2345751 ?auto_2345766 ) ) ( not ( = ?auto_2345751 ?auto_2345768 ) ) ( not ( = ?auto_2345752 ?auto_2345753 ) ) ( not ( = ?auto_2345752 ?auto_2345754 ) ) ( not ( = ?auto_2345752 ?auto_2345755 ) ) ( not ( = ?auto_2345752 ?auto_2345756 ) ) ( not ( = ?auto_2345752 ?auto_2345757 ) ) ( not ( = ?auto_2345752 ?auto_2345758 ) ) ( not ( = ?auto_2345752 ?auto_2345759 ) ) ( not ( = ?auto_2345752 ?auto_2345760 ) ) ( not ( = ?auto_2345752 ?auto_2345761 ) ) ( not ( = ?auto_2345752 ?auto_2345762 ) ) ( not ( = ?auto_2345752 ?auto_2345763 ) ) ( not ( = ?auto_2345752 ?auto_2345764 ) ) ( not ( = ?auto_2345752 ?auto_2345765 ) ) ( not ( = ?auto_2345752 ?auto_2345766 ) ) ( not ( = ?auto_2345752 ?auto_2345768 ) ) ( not ( = ?auto_2345753 ?auto_2345754 ) ) ( not ( = ?auto_2345753 ?auto_2345755 ) ) ( not ( = ?auto_2345753 ?auto_2345756 ) ) ( not ( = ?auto_2345753 ?auto_2345757 ) ) ( not ( = ?auto_2345753 ?auto_2345758 ) ) ( not ( = ?auto_2345753 ?auto_2345759 ) ) ( not ( = ?auto_2345753 ?auto_2345760 ) ) ( not ( = ?auto_2345753 ?auto_2345761 ) ) ( not ( = ?auto_2345753 ?auto_2345762 ) ) ( not ( = ?auto_2345753 ?auto_2345763 ) ) ( not ( = ?auto_2345753 ?auto_2345764 ) ) ( not ( = ?auto_2345753 ?auto_2345765 ) ) ( not ( = ?auto_2345753 ?auto_2345766 ) ) ( not ( = ?auto_2345753 ?auto_2345768 ) ) ( not ( = ?auto_2345754 ?auto_2345755 ) ) ( not ( = ?auto_2345754 ?auto_2345756 ) ) ( not ( = ?auto_2345754 ?auto_2345757 ) ) ( not ( = ?auto_2345754 ?auto_2345758 ) ) ( not ( = ?auto_2345754 ?auto_2345759 ) ) ( not ( = ?auto_2345754 ?auto_2345760 ) ) ( not ( = ?auto_2345754 ?auto_2345761 ) ) ( not ( = ?auto_2345754 ?auto_2345762 ) ) ( not ( = ?auto_2345754 ?auto_2345763 ) ) ( not ( = ?auto_2345754 ?auto_2345764 ) ) ( not ( = ?auto_2345754 ?auto_2345765 ) ) ( not ( = ?auto_2345754 ?auto_2345766 ) ) ( not ( = ?auto_2345754 ?auto_2345768 ) ) ( not ( = ?auto_2345755 ?auto_2345756 ) ) ( not ( = ?auto_2345755 ?auto_2345757 ) ) ( not ( = ?auto_2345755 ?auto_2345758 ) ) ( not ( = ?auto_2345755 ?auto_2345759 ) ) ( not ( = ?auto_2345755 ?auto_2345760 ) ) ( not ( = ?auto_2345755 ?auto_2345761 ) ) ( not ( = ?auto_2345755 ?auto_2345762 ) ) ( not ( = ?auto_2345755 ?auto_2345763 ) ) ( not ( = ?auto_2345755 ?auto_2345764 ) ) ( not ( = ?auto_2345755 ?auto_2345765 ) ) ( not ( = ?auto_2345755 ?auto_2345766 ) ) ( not ( = ?auto_2345755 ?auto_2345768 ) ) ( not ( = ?auto_2345756 ?auto_2345757 ) ) ( not ( = ?auto_2345756 ?auto_2345758 ) ) ( not ( = ?auto_2345756 ?auto_2345759 ) ) ( not ( = ?auto_2345756 ?auto_2345760 ) ) ( not ( = ?auto_2345756 ?auto_2345761 ) ) ( not ( = ?auto_2345756 ?auto_2345762 ) ) ( not ( = ?auto_2345756 ?auto_2345763 ) ) ( not ( = ?auto_2345756 ?auto_2345764 ) ) ( not ( = ?auto_2345756 ?auto_2345765 ) ) ( not ( = ?auto_2345756 ?auto_2345766 ) ) ( not ( = ?auto_2345756 ?auto_2345768 ) ) ( not ( = ?auto_2345757 ?auto_2345758 ) ) ( not ( = ?auto_2345757 ?auto_2345759 ) ) ( not ( = ?auto_2345757 ?auto_2345760 ) ) ( not ( = ?auto_2345757 ?auto_2345761 ) ) ( not ( = ?auto_2345757 ?auto_2345762 ) ) ( not ( = ?auto_2345757 ?auto_2345763 ) ) ( not ( = ?auto_2345757 ?auto_2345764 ) ) ( not ( = ?auto_2345757 ?auto_2345765 ) ) ( not ( = ?auto_2345757 ?auto_2345766 ) ) ( not ( = ?auto_2345757 ?auto_2345768 ) ) ( not ( = ?auto_2345758 ?auto_2345759 ) ) ( not ( = ?auto_2345758 ?auto_2345760 ) ) ( not ( = ?auto_2345758 ?auto_2345761 ) ) ( not ( = ?auto_2345758 ?auto_2345762 ) ) ( not ( = ?auto_2345758 ?auto_2345763 ) ) ( not ( = ?auto_2345758 ?auto_2345764 ) ) ( not ( = ?auto_2345758 ?auto_2345765 ) ) ( not ( = ?auto_2345758 ?auto_2345766 ) ) ( not ( = ?auto_2345758 ?auto_2345768 ) ) ( not ( = ?auto_2345759 ?auto_2345760 ) ) ( not ( = ?auto_2345759 ?auto_2345761 ) ) ( not ( = ?auto_2345759 ?auto_2345762 ) ) ( not ( = ?auto_2345759 ?auto_2345763 ) ) ( not ( = ?auto_2345759 ?auto_2345764 ) ) ( not ( = ?auto_2345759 ?auto_2345765 ) ) ( not ( = ?auto_2345759 ?auto_2345766 ) ) ( not ( = ?auto_2345759 ?auto_2345768 ) ) ( not ( = ?auto_2345760 ?auto_2345761 ) ) ( not ( = ?auto_2345760 ?auto_2345762 ) ) ( not ( = ?auto_2345760 ?auto_2345763 ) ) ( not ( = ?auto_2345760 ?auto_2345764 ) ) ( not ( = ?auto_2345760 ?auto_2345765 ) ) ( not ( = ?auto_2345760 ?auto_2345766 ) ) ( not ( = ?auto_2345760 ?auto_2345768 ) ) ( not ( = ?auto_2345761 ?auto_2345762 ) ) ( not ( = ?auto_2345761 ?auto_2345763 ) ) ( not ( = ?auto_2345761 ?auto_2345764 ) ) ( not ( = ?auto_2345761 ?auto_2345765 ) ) ( not ( = ?auto_2345761 ?auto_2345766 ) ) ( not ( = ?auto_2345761 ?auto_2345768 ) ) ( not ( = ?auto_2345762 ?auto_2345763 ) ) ( not ( = ?auto_2345762 ?auto_2345764 ) ) ( not ( = ?auto_2345762 ?auto_2345765 ) ) ( not ( = ?auto_2345762 ?auto_2345766 ) ) ( not ( = ?auto_2345762 ?auto_2345768 ) ) ( not ( = ?auto_2345763 ?auto_2345764 ) ) ( not ( = ?auto_2345763 ?auto_2345765 ) ) ( not ( = ?auto_2345763 ?auto_2345766 ) ) ( not ( = ?auto_2345763 ?auto_2345768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345764 ?auto_2345765 ?auto_2345766 )
      ( MAKE-15CRATE-VERIFY ?auto_2345751 ?auto_2345752 ?auto_2345753 ?auto_2345754 ?auto_2345755 ?auto_2345756 ?auto_2345757 ?auto_2345758 ?auto_2345759 ?auto_2345760 ?auto_2345761 ?auto_2345762 ?auto_2345763 ?auto_2345764 ?auto_2345765 ?auto_2345766 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345977 - SURFACE
      ?auto_2345978 - SURFACE
      ?auto_2345979 - SURFACE
      ?auto_2345980 - SURFACE
      ?auto_2345981 - SURFACE
      ?auto_2345982 - SURFACE
      ?auto_2345983 - SURFACE
      ?auto_2345984 - SURFACE
      ?auto_2345985 - SURFACE
      ?auto_2345986 - SURFACE
      ?auto_2345987 - SURFACE
      ?auto_2345988 - SURFACE
      ?auto_2345989 - SURFACE
      ?auto_2345990 - SURFACE
      ?auto_2345991 - SURFACE
      ?auto_2345992 - SURFACE
    )
    :vars
    (
      ?auto_2345994 - HOIST
      ?auto_2345995 - PLACE
      ?auto_2345998 - PLACE
      ?auto_2345997 - HOIST
      ?auto_2345996 - SURFACE
      ?auto_2345993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345994 ?auto_2345995 ) ( IS-CRATE ?auto_2345992 ) ( not ( = ?auto_2345991 ?auto_2345992 ) ) ( not ( = ?auto_2345990 ?auto_2345991 ) ) ( not ( = ?auto_2345990 ?auto_2345992 ) ) ( not ( = ?auto_2345998 ?auto_2345995 ) ) ( HOIST-AT ?auto_2345997 ?auto_2345998 ) ( not ( = ?auto_2345994 ?auto_2345997 ) ) ( AVAILABLE ?auto_2345997 ) ( SURFACE-AT ?auto_2345992 ?auto_2345998 ) ( ON ?auto_2345992 ?auto_2345996 ) ( CLEAR ?auto_2345992 ) ( not ( = ?auto_2345991 ?auto_2345996 ) ) ( not ( = ?auto_2345992 ?auto_2345996 ) ) ( not ( = ?auto_2345990 ?auto_2345996 ) ) ( TRUCK-AT ?auto_2345993 ?auto_2345995 ) ( SURFACE-AT ?auto_2345990 ?auto_2345995 ) ( CLEAR ?auto_2345990 ) ( LIFTING ?auto_2345994 ?auto_2345991 ) ( IS-CRATE ?auto_2345991 ) ( ON ?auto_2345978 ?auto_2345977 ) ( ON ?auto_2345979 ?auto_2345978 ) ( ON ?auto_2345980 ?auto_2345979 ) ( ON ?auto_2345981 ?auto_2345980 ) ( ON ?auto_2345982 ?auto_2345981 ) ( ON ?auto_2345983 ?auto_2345982 ) ( ON ?auto_2345984 ?auto_2345983 ) ( ON ?auto_2345985 ?auto_2345984 ) ( ON ?auto_2345986 ?auto_2345985 ) ( ON ?auto_2345987 ?auto_2345986 ) ( ON ?auto_2345988 ?auto_2345987 ) ( ON ?auto_2345989 ?auto_2345988 ) ( ON ?auto_2345990 ?auto_2345989 ) ( not ( = ?auto_2345977 ?auto_2345978 ) ) ( not ( = ?auto_2345977 ?auto_2345979 ) ) ( not ( = ?auto_2345977 ?auto_2345980 ) ) ( not ( = ?auto_2345977 ?auto_2345981 ) ) ( not ( = ?auto_2345977 ?auto_2345982 ) ) ( not ( = ?auto_2345977 ?auto_2345983 ) ) ( not ( = ?auto_2345977 ?auto_2345984 ) ) ( not ( = ?auto_2345977 ?auto_2345985 ) ) ( not ( = ?auto_2345977 ?auto_2345986 ) ) ( not ( = ?auto_2345977 ?auto_2345987 ) ) ( not ( = ?auto_2345977 ?auto_2345988 ) ) ( not ( = ?auto_2345977 ?auto_2345989 ) ) ( not ( = ?auto_2345977 ?auto_2345990 ) ) ( not ( = ?auto_2345977 ?auto_2345991 ) ) ( not ( = ?auto_2345977 ?auto_2345992 ) ) ( not ( = ?auto_2345977 ?auto_2345996 ) ) ( not ( = ?auto_2345978 ?auto_2345979 ) ) ( not ( = ?auto_2345978 ?auto_2345980 ) ) ( not ( = ?auto_2345978 ?auto_2345981 ) ) ( not ( = ?auto_2345978 ?auto_2345982 ) ) ( not ( = ?auto_2345978 ?auto_2345983 ) ) ( not ( = ?auto_2345978 ?auto_2345984 ) ) ( not ( = ?auto_2345978 ?auto_2345985 ) ) ( not ( = ?auto_2345978 ?auto_2345986 ) ) ( not ( = ?auto_2345978 ?auto_2345987 ) ) ( not ( = ?auto_2345978 ?auto_2345988 ) ) ( not ( = ?auto_2345978 ?auto_2345989 ) ) ( not ( = ?auto_2345978 ?auto_2345990 ) ) ( not ( = ?auto_2345978 ?auto_2345991 ) ) ( not ( = ?auto_2345978 ?auto_2345992 ) ) ( not ( = ?auto_2345978 ?auto_2345996 ) ) ( not ( = ?auto_2345979 ?auto_2345980 ) ) ( not ( = ?auto_2345979 ?auto_2345981 ) ) ( not ( = ?auto_2345979 ?auto_2345982 ) ) ( not ( = ?auto_2345979 ?auto_2345983 ) ) ( not ( = ?auto_2345979 ?auto_2345984 ) ) ( not ( = ?auto_2345979 ?auto_2345985 ) ) ( not ( = ?auto_2345979 ?auto_2345986 ) ) ( not ( = ?auto_2345979 ?auto_2345987 ) ) ( not ( = ?auto_2345979 ?auto_2345988 ) ) ( not ( = ?auto_2345979 ?auto_2345989 ) ) ( not ( = ?auto_2345979 ?auto_2345990 ) ) ( not ( = ?auto_2345979 ?auto_2345991 ) ) ( not ( = ?auto_2345979 ?auto_2345992 ) ) ( not ( = ?auto_2345979 ?auto_2345996 ) ) ( not ( = ?auto_2345980 ?auto_2345981 ) ) ( not ( = ?auto_2345980 ?auto_2345982 ) ) ( not ( = ?auto_2345980 ?auto_2345983 ) ) ( not ( = ?auto_2345980 ?auto_2345984 ) ) ( not ( = ?auto_2345980 ?auto_2345985 ) ) ( not ( = ?auto_2345980 ?auto_2345986 ) ) ( not ( = ?auto_2345980 ?auto_2345987 ) ) ( not ( = ?auto_2345980 ?auto_2345988 ) ) ( not ( = ?auto_2345980 ?auto_2345989 ) ) ( not ( = ?auto_2345980 ?auto_2345990 ) ) ( not ( = ?auto_2345980 ?auto_2345991 ) ) ( not ( = ?auto_2345980 ?auto_2345992 ) ) ( not ( = ?auto_2345980 ?auto_2345996 ) ) ( not ( = ?auto_2345981 ?auto_2345982 ) ) ( not ( = ?auto_2345981 ?auto_2345983 ) ) ( not ( = ?auto_2345981 ?auto_2345984 ) ) ( not ( = ?auto_2345981 ?auto_2345985 ) ) ( not ( = ?auto_2345981 ?auto_2345986 ) ) ( not ( = ?auto_2345981 ?auto_2345987 ) ) ( not ( = ?auto_2345981 ?auto_2345988 ) ) ( not ( = ?auto_2345981 ?auto_2345989 ) ) ( not ( = ?auto_2345981 ?auto_2345990 ) ) ( not ( = ?auto_2345981 ?auto_2345991 ) ) ( not ( = ?auto_2345981 ?auto_2345992 ) ) ( not ( = ?auto_2345981 ?auto_2345996 ) ) ( not ( = ?auto_2345982 ?auto_2345983 ) ) ( not ( = ?auto_2345982 ?auto_2345984 ) ) ( not ( = ?auto_2345982 ?auto_2345985 ) ) ( not ( = ?auto_2345982 ?auto_2345986 ) ) ( not ( = ?auto_2345982 ?auto_2345987 ) ) ( not ( = ?auto_2345982 ?auto_2345988 ) ) ( not ( = ?auto_2345982 ?auto_2345989 ) ) ( not ( = ?auto_2345982 ?auto_2345990 ) ) ( not ( = ?auto_2345982 ?auto_2345991 ) ) ( not ( = ?auto_2345982 ?auto_2345992 ) ) ( not ( = ?auto_2345982 ?auto_2345996 ) ) ( not ( = ?auto_2345983 ?auto_2345984 ) ) ( not ( = ?auto_2345983 ?auto_2345985 ) ) ( not ( = ?auto_2345983 ?auto_2345986 ) ) ( not ( = ?auto_2345983 ?auto_2345987 ) ) ( not ( = ?auto_2345983 ?auto_2345988 ) ) ( not ( = ?auto_2345983 ?auto_2345989 ) ) ( not ( = ?auto_2345983 ?auto_2345990 ) ) ( not ( = ?auto_2345983 ?auto_2345991 ) ) ( not ( = ?auto_2345983 ?auto_2345992 ) ) ( not ( = ?auto_2345983 ?auto_2345996 ) ) ( not ( = ?auto_2345984 ?auto_2345985 ) ) ( not ( = ?auto_2345984 ?auto_2345986 ) ) ( not ( = ?auto_2345984 ?auto_2345987 ) ) ( not ( = ?auto_2345984 ?auto_2345988 ) ) ( not ( = ?auto_2345984 ?auto_2345989 ) ) ( not ( = ?auto_2345984 ?auto_2345990 ) ) ( not ( = ?auto_2345984 ?auto_2345991 ) ) ( not ( = ?auto_2345984 ?auto_2345992 ) ) ( not ( = ?auto_2345984 ?auto_2345996 ) ) ( not ( = ?auto_2345985 ?auto_2345986 ) ) ( not ( = ?auto_2345985 ?auto_2345987 ) ) ( not ( = ?auto_2345985 ?auto_2345988 ) ) ( not ( = ?auto_2345985 ?auto_2345989 ) ) ( not ( = ?auto_2345985 ?auto_2345990 ) ) ( not ( = ?auto_2345985 ?auto_2345991 ) ) ( not ( = ?auto_2345985 ?auto_2345992 ) ) ( not ( = ?auto_2345985 ?auto_2345996 ) ) ( not ( = ?auto_2345986 ?auto_2345987 ) ) ( not ( = ?auto_2345986 ?auto_2345988 ) ) ( not ( = ?auto_2345986 ?auto_2345989 ) ) ( not ( = ?auto_2345986 ?auto_2345990 ) ) ( not ( = ?auto_2345986 ?auto_2345991 ) ) ( not ( = ?auto_2345986 ?auto_2345992 ) ) ( not ( = ?auto_2345986 ?auto_2345996 ) ) ( not ( = ?auto_2345987 ?auto_2345988 ) ) ( not ( = ?auto_2345987 ?auto_2345989 ) ) ( not ( = ?auto_2345987 ?auto_2345990 ) ) ( not ( = ?auto_2345987 ?auto_2345991 ) ) ( not ( = ?auto_2345987 ?auto_2345992 ) ) ( not ( = ?auto_2345987 ?auto_2345996 ) ) ( not ( = ?auto_2345988 ?auto_2345989 ) ) ( not ( = ?auto_2345988 ?auto_2345990 ) ) ( not ( = ?auto_2345988 ?auto_2345991 ) ) ( not ( = ?auto_2345988 ?auto_2345992 ) ) ( not ( = ?auto_2345988 ?auto_2345996 ) ) ( not ( = ?auto_2345989 ?auto_2345990 ) ) ( not ( = ?auto_2345989 ?auto_2345991 ) ) ( not ( = ?auto_2345989 ?auto_2345992 ) ) ( not ( = ?auto_2345989 ?auto_2345996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345990 ?auto_2345991 ?auto_2345992 )
      ( MAKE-15CRATE-VERIFY ?auto_2345977 ?auto_2345978 ?auto_2345979 ?auto_2345980 ?auto_2345981 ?auto_2345982 ?auto_2345983 ?auto_2345984 ?auto_2345985 ?auto_2345986 ?auto_2345987 ?auto_2345988 ?auto_2345989 ?auto_2345990 ?auto_2345991 ?auto_2345992 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2346203 - SURFACE
      ?auto_2346204 - SURFACE
      ?auto_2346205 - SURFACE
      ?auto_2346206 - SURFACE
      ?auto_2346207 - SURFACE
      ?auto_2346208 - SURFACE
      ?auto_2346209 - SURFACE
      ?auto_2346210 - SURFACE
      ?auto_2346211 - SURFACE
      ?auto_2346212 - SURFACE
      ?auto_2346213 - SURFACE
      ?auto_2346214 - SURFACE
      ?auto_2346215 - SURFACE
      ?auto_2346216 - SURFACE
      ?auto_2346217 - SURFACE
      ?auto_2346218 - SURFACE
    )
    :vars
    (
      ?auto_2346221 - HOIST
      ?auto_2346223 - PLACE
      ?auto_2346220 - PLACE
      ?auto_2346222 - HOIST
      ?auto_2346219 - SURFACE
      ?auto_2346224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2346221 ?auto_2346223 ) ( IS-CRATE ?auto_2346218 ) ( not ( = ?auto_2346217 ?auto_2346218 ) ) ( not ( = ?auto_2346216 ?auto_2346217 ) ) ( not ( = ?auto_2346216 ?auto_2346218 ) ) ( not ( = ?auto_2346220 ?auto_2346223 ) ) ( HOIST-AT ?auto_2346222 ?auto_2346220 ) ( not ( = ?auto_2346221 ?auto_2346222 ) ) ( AVAILABLE ?auto_2346222 ) ( SURFACE-AT ?auto_2346218 ?auto_2346220 ) ( ON ?auto_2346218 ?auto_2346219 ) ( CLEAR ?auto_2346218 ) ( not ( = ?auto_2346217 ?auto_2346219 ) ) ( not ( = ?auto_2346218 ?auto_2346219 ) ) ( not ( = ?auto_2346216 ?auto_2346219 ) ) ( TRUCK-AT ?auto_2346224 ?auto_2346223 ) ( SURFACE-AT ?auto_2346216 ?auto_2346223 ) ( CLEAR ?auto_2346216 ) ( IS-CRATE ?auto_2346217 ) ( AVAILABLE ?auto_2346221 ) ( IN ?auto_2346217 ?auto_2346224 ) ( ON ?auto_2346204 ?auto_2346203 ) ( ON ?auto_2346205 ?auto_2346204 ) ( ON ?auto_2346206 ?auto_2346205 ) ( ON ?auto_2346207 ?auto_2346206 ) ( ON ?auto_2346208 ?auto_2346207 ) ( ON ?auto_2346209 ?auto_2346208 ) ( ON ?auto_2346210 ?auto_2346209 ) ( ON ?auto_2346211 ?auto_2346210 ) ( ON ?auto_2346212 ?auto_2346211 ) ( ON ?auto_2346213 ?auto_2346212 ) ( ON ?auto_2346214 ?auto_2346213 ) ( ON ?auto_2346215 ?auto_2346214 ) ( ON ?auto_2346216 ?auto_2346215 ) ( not ( = ?auto_2346203 ?auto_2346204 ) ) ( not ( = ?auto_2346203 ?auto_2346205 ) ) ( not ( = ?auto_2346203 ?auto_2346206 ) ) ( not ( = ?auto_2346203 ?auto_2346207 ) ) ( not ( = ?auto_2346203 ?auto_2346208 ) ) ( not ( = ?auto_2346203 ?auto_2346209 ) ) ( not ( = ?auto_2346203 ?auto_2346210 ) ) ( not ( = ?auto_2346203 ?auto_2346211 ) ) ( not ( = ?auto_2346203 ?auto_2346212 ) ) ( not ( = ?auto_2346203 ?auto_2346213 ) ) ( not ( = ?auto_2346203 ?auto_2346214 ) ) ( not ( = ?auto_2346203 ?auto_2346215 ) ) ( not ( = ?auto_2346203 ?auto_2346216 ) ) ( not ( = ?auto_2346203 ?auto_2346217 ) ) ( not ( = ?auto_2346203 ?auto_2346218 ) ) ( not ( = ?auto_2346203 ?auto_2346219 ) ) ( not ( = ?auto_2346204 ?auto_2346205 ) ) ( not ( = ?auto_2346204 ?auto_2346206 ) ) ( not ( = ?auto_2346204 ?auto_2346207 ) ) ( not ( = ?auto_2346204 ?auto_2346208 ) ) ( not ( = ?auto_2346204 ?auto_2346209 ) ) ( not ( = ?auto_2346204 ?auto_2346210 ) ) ( not ( = ?auto_2346204 ?auto_2346211 ) ) ( not ( = ?auto_2346204 ?auto_2346212 ) ) ( not ( = ?auto_2346204 ?auto_2346213 ) ) ( not ( = ?auto_2346204 ?auto_2346214 ) ) ( not ( = ?auto_2346204 ?auto_2346215 ) ) ( not ( = ?auto_2346204 ?auto_2346216 ) ) ( not ( = ?auto_2346204 ?auto_2346217 ) ) ( not ( = ?auto_2346204 ?auto_2346218 ) ) ( not ( = ?auto_2346204 ?auto_2346219 ) ) ( not ( = ?auto_2346205 ?auto_2346206 ) ) ( not ( = ?auto_2346205 ?auto_2346207 ) ) ( not ( = ?auto_2346205 ?auto_2346208 ) ) ( not ( = ?auto_2346205 ?auto_2346209 ) ) ( not ( = ?auto_2346205 ?auto_2346210 ) ) ( not ( = ?auto_2346205 ?auto_2346211 ) ) ( not ( = ?auto_2346205 ?auto_2346212 ) ) ( not ( = ?auto_2346205 ?auto_2346213 ) ) ( not ( = ?auto_2346205 ?auto_2346214 ) ) ( not ( = ?auto_2346205 ?auto_2346215 ) ) ( not ( = ?auto_2346205 ?auto_2346216 ) ) ( not ( = ?auto_2346205 ?auto_2346217 ) ) ( not ( = ?auto_2346205 ?auto_2346218 ) ) ( not ( = ?auto_2346205 ?auto_2346219 ) ) ( not ( = ?auto_2346206 ?auto_2346207 ) ) ( not ( = ?auto_2346206 ?auto_2346208 ) ) ( not ( = ?auto_2346206 ?auto_2346209 ) ) ( not ( = ?auto_2346206 ?auto_2346210 ) ) ( not ( = ?auto_2346206 ?auto_2346211 ) ) ( not ( = ?auto_2346206 ?auto_2346212 ) ) ( not ( = ?auto_2346206 ?auto_2346213 ) ) ( not ( = ?auto_2346206 ?auto_2346214 ) ) ( not ( = ?auto_2346206 ?auto_2346215 ) ) ( not ( = ?auto_2346206 ?auto_2346216 ) ) ( not ( = ?auto_2346206 ?auto_2346217 ) ) ( not ( = ?auto_2346206 ?auto_2346218 ) ) ( not ( = ?auto_2346206 ?auto_2346219 ) ) ( not ( = ?auto_2346207 ?auto_2346208 ) ) ( not ( = ?auto_2346207 ?auto_2346209 ) ) ( not ( = ?auto_2346207 ?auto_2346210 ) ) ( not ( = ?auto_2346207 ?auto_2346211 ) ) ( not ( = ?auto_2346207 ?auto_2346212 ) ) ( not ( = ?auto_2346207 ?auto_2346213 ) ) ( not ( = ?auto_2346207 ?auto_2346214 ) ) ( not ( = ?auto_2346207 ?auto_2346215 ) ) ( not ( = ?auto_2346207 ?auto_2346216 ) ) ( not ( = ?auto_2346207 ?auto_2346217 ) ) ( not ( = ?auto_2346207 ?auto_2346218 ) ) ( not ( = ?auto_2346207 ?auto_2346219 ) ) ( not ( = ?auto_2346208 ?auto_2346209 ) ) ( not ( = ?auto_2346208 ?auto_2346210 ) ) ( not ( = ?auto_2346208 ?auto_2346211 ) ) ( not ( = ?auto_2346208 ?auto_2346212 ) ) ( not ( = ?auto_2346208 ?auto_2346213 ) ) ( not ( = ?auto_2346208 ?auto_2346214 ) ) ( not ( = ?auto_2346208 ?auto_2346215 ) ) ( not ( = ?auto_2346208 ?auto_2346216 ) ) ( not ( = ?auto_2346208 ?auto_2346217 ) ) ( not ( = ?auto_2346208 ?auto_2346218 ) ) ( not ( = ?auto_2346208 ?auto_2346219 ) ) ( not ( = ?auto_2346209 ?auto_2346210 ) ) ( not ( = ?auto_2346209 ?auto_2346211 ) ) ( not ( = ?auto_2346209 ?auto_2346212 ) ) ( not ( = ?auto_2346209 ?auto_2346213 ) ) ( not ( = ?auto_2346209 ?auto_2346214 ) ) ( not ( = ?auto_2346209 ?auto_2346215 ) ) ( not ( = ?auto_2346209 ?auto_2346216 ) ) ( not ( = ?auto_2346209 ?auto_2346217 ) ) ( not ( = ?auto_2346209 ?auto_2346218 ) ) ( not ( = ?auto_2346209 ?auto_2346219 ) ) ( not ( = ?auto_2346210 ?auto_2346211 ) ) ( not ( = ?auto_2346210 ?auto_2346212 ) ) ( not ( = ?auto_2346210 ?auto_2346213 ) ) ( not ( = ?auto_2346210 ?auto_2346214 ) ) ( not ( = ?auto_2346210 ?auto_2346215 ) ) ( not ( = ?auto_2346210 ?auto_2346216 ) ) ( not ( = ?auto_2346210 ?auto_2346217 ) ) ( not ( = ?auto_2346210 ?auto_2346218 ) ) ( not ( = ?auto_2346210 ?auto_2346219 ) ) ( not ( = ?auto_2346211 ?auto_2346212 ) ) ( not ( = ?auto_2346211 ?auto_2346213 ) ) ( not ( = ?auto_2346211 ?auto_2346214 ) ) ( not ( = ?auto_2346211 ?auto_2346215 ) ) ( not ( = ?auto_2346211 ?auto_2346216 ) ) ( not ( = ?auto_2346211 ?auto_2346217 ) ) ( not ( = ?auto_2346211 ?auto_2346218 ) ) ( not ( = ?auto_2346211 ?auto_2346219 ) ) ( not ( = ?auto_2346212 ?auto_2346213 ) ) ( not ( = ?auto_2346212 ?auto_2346214 ) ) ( not ( = ?auto_2346212 ?auto_2346215 ) ) ( not ( = ?auto_2346212 ?auto_2346216 ) ) ( not ( = ?auto_2346212 ?auto_2346217 ) ) ( not ( = ?auto_2346212 ?auto_2346218 ) ) ( not ( = ?auto_2346212 ?auto_2346219 ) ) ( not ( = ?auto_2346213 ?auto_2346214 ) ) ( not ( = ?auto_2346213 ?auto_2346215 ) ) ( not ( = ?auto_2346213 ?auto_2346216 ) ) ( not ( = ?auto_2346213 ?auto_2346217 ) ) ( not ( = ?auto_2346213 ?auto_2346218 ) ) ( not ( = ?auto_2346213 ?auto_2346219 ) ) ( not ( = ?auto_2346214 ?auto_2346215 ) ) ( not ( = ?auto_2346214 ?auto_2346216 ) ) ( not ( = ?auto_2346214 ?auto_2346217 ) ) ( not ( = ?auto_2346214 ?auto_2346218 ) ) ( not ( = ?auto_2346214 ?auto_2346219 ) ) ( not ( = ?auto_2346215 ?auto_2346216 ) ) ( not ( = ?auto_2346215 ?auto_2346217 ) ) ( not ( = ?auto_2346215 ?auto_2346218 ) ) ( not ( = ?auto_2346215 ?auto_2346219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2346216 ?auto_2346217 ?auto_2346218 )
      ( MAKE-15CRATE-VERIFY ?auto_2346203 ?auto_2346204 ?auto_2346205 ?auto_2346206 ?auto_2346207 ?auto_2346208 ?auto_2346209 ?auto_2346210 ?auto_2346211 ?auto_2346212 ?auto_2346213 ?auto_2346214 ?auto_2346215 ?auto_2346216 ?auto_2346217 ?auto_2346218 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2366621 - SURFACE
      ?auto_2366622 - SURFACE
      ?auto_2366623 - SURFACE
      ?auto_2366624 - SURFACE
      ?auto_2366625 - SURFACE
      ?auto_2366626 - SURFACE
      ?auto_2366627 - SURFACE
      ?auto_2366628 - SURFACE
      ?auto_2366629 - SURFACE
      ?auto_2366630 - SURFACE
      ?auto_2366631 - SURFACE
      ?auto_2366632 - SURFACE
      ?auto_2366633 - SURFACE
      ?auto_2366634 - SURFACE
      ?auto_2366635 - SURFACE
      ?auto_2366636 - SURFACE
      ?auto_2366637 - SURFACE
    )
    :vars
    (
      ?auto_2366639 - HOIST
      ?auto_2366638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2366639 ?auto_2366638 ) ( SURFACE-AT ?auto_2366636 ?auto_2366638 ) ( CLEAR ?auto_2366636 ) ( LIFTING ?auto_2366639 ?auto_2366637 ) ( IS-CRATE ?auto_2366637 ) ( not ( = ?auto_2366636 ?auto_2366637 ) ) ( ON ?auto_2366622 ?auto_2366621 ) ( ON ?auto_2366623 ?auto_2366622 ) ( ON ?auto_2366624 ?auto_2366623 ) ( ON ?auto_2366625 ?auto_2366624 ) ( ON ?auto_2366626 ?auto_2366625 ) ( ON ?auto_2366627 ?auto_2366626 ) ( ON ?auto_2366628 ?auto_2366627 ) ( ON ?auto_2366629 ?auto_2366628 ) ( ON ?auto_2366630 ?auto_2366629 ) ( ON ?auto_2366631 ?auto_2366630 ) ( ON ?auto_2366632 ?auto_2366631 ) ( ON ?auto_2366633 ?auto_2366632 ) ( ON ?auto_2366634 ?auto_2366633 ) ( ON ?auto_2366635 ?auto_2366634 ) ( ON ?auto_2366636 ?auto_2366635 ) ( not ( = ?auto_2366621 ?auto_2366622 ) ) ( not ( = ?auto_2366621 ?auto_2366623 ) ) ( not ( = ?auto_2366621 ?auto_2366624 ) ) ( not ( = ?auto_2366621 ?auto_2366625 ) ) ( not ( = ?auto_2366621 ?auto_2366626 ) ) ( not ( = ?auto_2366621 ?auto_2366627 ) ) ( not ( = ?auto_2366621 ?auto_2366628 ) ) ( not ( = ?auto_2366621 ?auto_2366629 ) ) ( not ( = ?auto_2366621 ?auto_2366630 ) ) ( not ( = ?auto_2366621 ?auto_2366631 ) ) ( not ( = ?auto_2366621 ?auto_2366632 ) ) ( not ( = ?auto_2366621 ?auto_2366633 ) ) ( not ( = ?auto_2366621 ?auto_2366634 ) ) ( not ( = ?auto_2366621 ?auto_2366635 ) ) ( not ( = ?auto_2366621 ?auto_2366636 ) ) ( not ( = ?auto_2366621 ?auto_2366637 ) ) ( not ( = ?auto_2366622 ?auto_2366623 ) ) ( not ( = ?auto_2366622 ?auto_2366624 ) ) ( not ( = ?auto_2366622 ?auto_2366625 ) ) ( not ( = ?auto_2366622 ?auto_2366626 ) ) ( not ( = ?auto_2366622 ?auto_2366627 ) ) ( not ( = ?auto_2366622 ?auto_2366628 ) ) ( not ( = ?auto_2366622 ?auto_2366629 ) ) ( not ( = ?auto_2366622 ?auto_2366630 ) ) ( not ( = ?auto_2366622 ?auto_2366631 ) ) ( not ( = ?auto_2366622 ?auto_2366632 ) ) ( not ( = ?auto_2366622 ?auto_2366633 ) ) ( not ( = ?auto_2366622 ?auto_2366634 ) ) ( not ( = ?auto_2366622 ?auto_2366635 ) ) ( not ( = ?auto_2366622 ?auto_2366636 ) ) ( not ( = ?auto_2366622 ?auto_2366637 ) ) ( not ( = ?auto_2366623 ?auto_2366624 ) ) ( not ( = ?auto_2366623 ?auto_2366625 ) ) ( not ( = ?auto_2366623 ?auto_2366626 ) ) ( not ( = ?auto_2366623 ?auto_2366627 ) ) ( not ( = ?auto_2366623 ?auto_2366628 ) ) ( not ( = ?auto_2366623 ?auto_2366629 ) ) ( not ( = ?auto_2366623 ?auto_2366630 ) ) ( not ( = ?auto_2366623 ?auto_2366631 ) ) ( not ( = ?auto_2366623 ?auto_2366632 ) ) ( not ( = ?auto_2366623 ?auto_2366633 ) ) ( not ( = ?auto_2366623 ?auto_2366634 ) ) ( not ( = ?auto_2366623 ?auto_2366635 ) ) ( not ( = ?auto_2366623 ?auto_2366636 ) ) ( not ( = ?auto_2366623 ?auto_2366637 ) ) ( not ( = ?auto_2366624 ?auto_2366625 ) ) ( not ( = ?auto_2366624 ?auto_2366626 ) ) ( not ( = ?auto_2366624 ?auto_2366627 ) ) ( not ( = ?auto_2366624 ?auto_2366628 ) ) ( not ( = ?auto_2366624 ?auto_2366629 ) ) ( not ( = ?auto_2366624 ?auto_2366630 ) ) ( not ( = ?auto_2366624 ?auto_2366631 ) ) ( not ( = ?auto_2366624 ?auto_2366632 ) ) ( not ( = ?auto_2366624 ?auto_2366633 ) ) ( not ( = ?auto_2366624 ?auto_2366634 ) ) ( not ( = ?auto_2366624 ?auto_2366635 ) ) ( not ( = ?auto_2366624 ?auto_2366636 ) ) ( not ( = ?auto_2366624 ?auto_2366637 ) ) ( not ( = ?auto_2366625 ?auto_2366626 ) ) ( not ( = ?auto_2366625 ?auto_2366627 ) ) ( not ( = ?auto_2366625 ?auto_2366628 ) ) ( not ( = ?auto_2366625 ?auto_2366629 ) ) ( not ( = ?auto_2366625 ?auto_2366630 ) ) ( not ( = ?auto_2366625 ?auto_2366631 ) ) ( not ( = ?auto_2366625 ?auto_2366632 ) ) ( not ( = ?auto_2366625 ?auto_2366633 ) ) ( not ( = ?auto_2366625 ?auto_2366634 ) ) ( not ( = ?auto_2366625 ?auto_2366635 ) ) ( not ( = ?auto_2366625 ?auto_2366636 ) ) ( not ( = ?auto_2366625 ?auto_2366637 ) ) ( not ( = ?auto_2366626 ?auto_2366627 ) ) ( not ( = ?auto_2366626 ?auto_2366628 ) ) ( not ( = ?auto_2366626 ?auto_2366629 ) ) ( not ( = ?auto_2366626 ?auto_2366630 ) ) ( not ( = ?auto_2366626 ?auto_2366631 ) ) ( not ( = ?auto_2366626 ?auto_2366632 ) ) ( not ( = ?auto_2366626 ?auto_2366633 ) ) ( not ( = ?auto_2366626 ?auto_2366634 ) ) ( not ( = ?auto_2366626 ?auto_2366635 ) ) ( not ( = ?auto_2366626 ?auto_2366636 ) ) ( not ( = ?auto_2366626 ?auto_2366637 ) ) ( not ( = ?auto_2366627 ?auto_2366628 ) ) ( not ( = ?auto_2366627 ?auto_2366629 ) ) ( not ( = ?auto_2366627 ?auto_2366630 ) ) ( not ( = ?auto_2366627 ?auto_2366631 ) ) ( not ( = ?auto_2366627 ?auto_2366632 ) ) ( not ( = ?auto_2366627 ?auto_2366633 ) ) ( not ( = ?auto_2366627 ?auto_2366634 ) ) ( not ( = ?auto_2366627 ?auto_2366635 ) ) ( not ( = ?auto_2366627 ?auto_2366636 ) ) ( not ( = ?auto_2366627 ?auto_2366637 ) ) ( not ( = ?auto_2366628 ?auto_2366629 ) ) ( not ( = ?auto_2366628 ?auto_2366630 ) ) ( not ( = ?auto_2366628 ?auto_2366631 ) ) ( not ( = ?auto_2366628 ?auto_2366632 ) ) ( not ( = ?auto_2366628 ?auto_2366633 ) ) ( not ( = ?auto_2366628 ?auto_2366634 ) ) ( not ( = ?auto_2366628 ?auto_2366635 ) ) ( not ( = ?auto_2366628 ?auto_2366636 ) ) ( not ( = ?auto_2366628 ?auto_2366637 ) ) ( not ( = ?auto_2366629 ?auto_2366630 ) ) ( not ( = ?auto_2366629 ?auto_2366631 ) ) ( not ( = ?auto_2366629 ?auto_2366632 ) ) ( not ( = ?auto_2366629 ?auto_2366633 ) ) ( not ( = ?auto_2366629 ?auto_2366634 ) ) ( not ( = ?auto_2366629 ?auto_2366635 ) ) ( not ( = ?auto_2366629 ?auto_2366636 ) ) ( not ( = ?auto_2366629 ?auto_2366637 ) ) ( not ( = ?auto_2366630 ?auto_2366631 ) ) ( not ( = ?auto_2366630 ?auto_2366632 ) ) ( not ( = ?auto_2366630 ?auto_2366633 ) ) ( not ( = ?auto_2366630 ?auto_2366634 ) ) ( not ( = ?auto_2366630 ?auto_2366635 ) ) ( not ( = ?auto_2366630 ?auto_2366636 ) ) ( not ( = ?auto_2366630 ?auto_2366637 ) ) ( not ( = ?auto_2366631 ?auto_2366632 ) ) ( not ( = ?auto_2366631 ?auto_2366633 ) ) ( not ( = ?auto_2366631 ?auto_2366634 ) ) ( not ( = ?auto_2366631 ?auto_2366635 ) ) ( not ( = ?auto_2366631 ?auto_2366636 ) ) ( not ( = ?auto_2366631 ?auto_2366637 ) ) ( not ( = ?auto_2366632 ?auto_2366633 ) ) ( not ( = ?auto_2366632 ?auto_2366634 ) ) ( not ( = ?auto_2366632 ?auto_2366635 ) ) ( not ( = ?auto_2366632 ?auto_2366636 ) ) ( not ( = ?auto_2366632 ?auto_2366637 ) ) ( not ( = ?auto_2366633 ?auto_2366634 ) ) ( not ( = ?auto_2366633 ?auto_2366635 ) ) ( not ( = ?auto_2366633 ?auto_2366636 ) ) ( not ( = ?auto_2366633 ?auto_2366637 ) ) ( not ( = ?auto_2366634 ?auto_2366635 ) ) ( not ( = ?auto_2366634 ?auto_2366636 ) ) ( not ( = ?auto_2366634 ?auto_2366637 ) ) ( not ( = ?auto_2366635 ?auto_2366636 ) ) ( not ( = ?auto_2366635 ?auto_2366637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2366636 ?auto_2366637 )
      ( MAKE-16CRATE-VERIFY ?auto_2366621 ?auto_2366622 ?auto_2366623 ?auto_2366624 ?auto_2366625 ?auto_2366626 ?auto_2366627 ?auto_2366628 ?auto_2366629 ?auto_2366630 ?auto_2366631 ?auto_2366632 ?auto_2366633 ?auto_2366634 ?auto_2366635 ?auto_2366636 ?auto_2366637 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2366820 - SURFACE
      ?auto_2366821 - SURFACE
      ?auto_2366822 - SURFACE
      ?auto_2366823 - SURFACE
      ?auto_2366824 - SURFACE
      ?auto_2366825 - SURFACE
      ?auto_2366826 - SURFACE
      ?auto_2366827 - SURFACE
      ?auto_2366828 - SURFACE
      ?auto_2366829 - SURFACE
      ?auto_2366830 - SURFACE
      ?auto_2366831 - SURFACE
      ?auto_2366832 - SURFACE
      ?auto_2366833 - SURFACE
      ?auto_2366834 - SURFACE
      ?auto_2366835 - SURFACE
      ?auto_2366836 - SURFACE
    )
    :vars
    (
      ?auto_2366838 - HOIST
      ?auto_2366839 - PLACE
      ?auto_2366837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2366838 ?auto_2366839 ) ( SURFACE-AT ?auto_2366835 ?auto_2366839 ) ( CLEAR ?auto_2366835 ) ( IS-CRATE ?auto_2366836 ) ( not ( = ?auto_2366835 ?auto_2366836 ) ) ( TRUCK-AT ?auto_2366837 ?auto_2366839 ) ( AVAILABLE ?auto_2366838 ) ( IN ?auto_2366836 ?auto_2366837 ) ( ON ?auto_2366835 ?auto_2366834 ) ( not ( = ?auto_2366834 ?auto_2366835 ) ) ( not ( = ?auto_2366834 ?auto_2366836 ) ) ( ON ?auto_2366821 ?auto_2366820 ) ( ON ?auto_2366822 ?auto_2366821 ) ( ON ?auto_2366823 ?auto_2366822 ) ( ON ?auto_2366824 ?auto_2366823 ) ( ON ?auto_2366825 ?auto_2366824 ) ( ON ?auto_2366826 ?auto_2366825 ) ( ON ?auto_2366827 ?auto_2366826 ) ( ON ?auto_2366828 ?auto_2366827 ) ( ON ?auto_2366829 ?auto_2366828 ) ( ON ?auto_2366830 ?auto_2366829 ) ( ON ?auto_2366831 ?auto_2366830 ) ( ON ?auto_2366832 ?auto_2366831 ) ( ON ?auto_2366833 ?auto_2366832 ) ( ON ?auto_2366834 ?auto_2366833 ) ( not ( = ?auto_2366820 ?auto_2366821 ) ) ( not ( = ?auto_2366820 ?auto_2366822 ) ) ( not ( = ?auto_2366820 ?auto_2366823 ) ) ( not ( = ?auto_2366820 ?auto_2366824 ) ) ( not ( = ?auto_2366820 ?auto_2366825 ) ) ( not ( = ?auto_2366820 ?auto_2366826 ) ) ( not ( = ?auto_2366820 ?auto_2366827 ) ) ( not ( = ?auto_2366820 ?auto_2366828 ) ) ( not ( = ?auto_2366820 ?auto_2366829 ) ) ( not ( = ?auto_2366820 ?auto_2366830 ) ) ( not ( = ?auto_2366820 ?auto_2366831 ) ) ( not ( = ?auto_2366820 ?auto_2366832 ) ) ( not ( = ?auto_2366820 ?auto_2366833 ) ) ( not ( = ?auto_2366820 ?auto_2366834 ) ) ( not ( = ?auto_2366820 ?auto_2366835 ) ) ( not ( = ?auto_2366820 ?auto_2366836 ) ) ( not ( = ?auto_2366821 ?auto_2366822 ) ) ( not ( = ?auto_2366821 ?auto_2366823 ) ) ( not ( = ?auto_2366821 ?auto_2366824 ) ) ( not ( = ?auto_2366821 ?auto_2366825 ) ) ( not ( = ?auto_2366821 ?auto_2366826 ) ) ( not ( = ?auto_2366821 ?auto_2366827 ) ) ( not ( = ?auto_2366821 ?auto_2366828 ) ) ( not ( = ?auto_2366821 ?auto_2366829 ) ) ( not ( = ?auto_2366821 ?auto_2366830 ) ) ( not ( = ?auto_2366821 ?auto_2366831 ) ) ( not ( = ?auto_2366821 ?auto_2366832 ) ) ( not ( = ?auto_2366821 ?auto_2366833 ) ) ( not ( = ?auto_2366821 ?auto_2366834 ) ) ( not ( = ?auto_2366821 ?auto_2366835 ) ) ( not ( = ?auto_2366821 ?auto_2366836 ) ) ( not ( = ?auto_2366822 ?auto_2366823 ) ) ( not ( = ?auto_2366822 ?auto_2366824 ) ) ( not ( = ?auto_2366822 ?auto_2366825 ) ) ( not ( = ?auto_2366822 ?auto_2366826 ) ) ( not ( = ?auto_2366822 ?auto_2366827 ) ) ( not ( = ?auto_2366822 ?auto_2366828 ) ) ( not ( = ?auto_2366822 ?auto_2366829 ) ) ( not ( = ?auto_2366822 ?auto_2366830 ) ) ( not ( = ?auto_2366822 ?auto_2366831 ) ) ( not ( = ?auto_2366822 ?auto_2366832 ) ) ( not ( = ?auto_2366822 ?auto_2366833 ) ) ( not ( = ?auto_2366822 ?auto_2366834 ) ) ( not ( = ?auto_2366822 ?auto_2366835 ) ) ( not ( = ?auto_2366822 ?auto_2366836 ) ) ( not ( = ?auto_2366823 ?auto_2366824 ) ) ( not ( = ?auto_2366823 ?auto_2366825 ) ) ( not ( = ?auto_2366823 ?auto_2366826 ) ) ( not ( = ?auto_2366823 ?auto_2366827 ) ) ( not ( = ?auto_2366823 ?auto_2366828 ) ) ( not ( = ?auto_2366823 ?auto_2366829 ) ) ( not ( = ?auto_2366823 ?auto_2366830 ) ) ( not ( = ?auto_2366823 ?auto_2366831 ) ) ( not ( = ?auto_2366823 ?auto_2366832 ) ) ( not ( = ?auto_2366823 ?auto_2366833 ) ) ( not ( = ?auto_2366823 ?auto_2366834 ) ) ( not ( = ?auto_2366823 ?auto_2366835 ) ) ( not ( = ?auto_2366823 ?auto_2366836 ) ) ( not ( = ?auto_2366824 ?auto_2366825 ) ) ( not ( = ?auto_2366824 ?auto_2366826 ) ) ( not ( = ?auto_2366824 ?auto_2366827 ) ) ( not ( = ?auto_2366824 ?auto_2366828 ) ) ( not ( = ?auto_2366824 ?auto_2366829 ) ) ( not ( = ?auto_2366824 ?auto_2366830 ) ) ( not ( = ?auto_2366824 ?auto_2366831 ) ) ( not ( = ?auto_2366824 ?auto_2366832 ) ) ( not ( = ?auto_2366824 ?auto_2366833 ) ) ( not ( = ?auto_2366824 ?auto_2366834 ) ) ( not ( = ?auto_2366824 ?auto_2366835 ) ) ( not ( = ?auto_2366824 ?auto_2366836 ) ) ( not ( = ?auto_2366825 ?auto_2366826 ) ) ( not ( = ?auto_2366825 ?auto_2366827 ) ) ( not ( = ?auto_2366825 ?auto_2366828 ) ) ( not ( = ?auto_2366825 ?auto_2366829 ) ) ( not ( = ?auto_2366825 ?auto_2366830 ) ) ( not ( = ?auto_2366825 ?auto_2366831 ) ) ( not ( = ?auto_2366825 ?auto_2366832 ) ) ( not ( = ?auto_2366825 ?auto_2366833 ) ) ( not ( = ?auto_2366825 ?auto_2366834 ) ) ( not ( = ?auto_2366825 ?auto_2366835 ) ) ( not ( = ?auto_2366825 ?auto_2366836 ) ) ( not ( = ?auto_2366826 ?auto_2366827 ) ) ( not ( = ?auto_2366826 ?auto_2366828 ) ) ( not ( = ?auto_2366826 ?auto_2366829 ) ) ( not ( = ?auto_2366826 ?auto_2366830 ) ) ( not ( = ?auto_2366826 ?auto_2366831 ) ) ( not ( = ?auto_2366826 ?auto_2366832 ) ) ( not ( = ?auto_2366826 ?auto_2366833 ) ) ( not ( = ?auto_2366826 ?auto_2366834 ) ) ( not ( = ?auto_2366826 ?auto_2366835 ) ) ( not ( = ?auto_2366826 ?auto_2366836 ) ) ( not ( = ?auto_2366827 ?auto_2366828 ) ) ( not ( = ?auto_2366827 ?auto_2366829 ) ) ( not ( = ?auto_2366827 ?auto_2366830 ) ) ( not ( = ?auto_2366827 ?auto_2366831 ) ) ( not ( = ?auto_2366827 ?auto_2366832 ) ) ( not ( = ?auto_2366827 ?auto_2366833 ) ) ( not ( = ?auto_2366827 ?auto_2366834 ) ) ( not ( = ?auto_2366827 ?auto_2366835 ) ) ( not ( = ?auto_2366827 ?auto_2366836 ) ) ( not ( = ?auto_2366828 ?auto_2366829 ) ) ( not ( = ?auto_2366828 ?auto_2366830 ) ) ( not ( = ?auto_2366828 ?auto_2366831 ) ) ( not ( = ?auto_2366828 ?auto_2366832 ) ) ( not ( = ?auto_2366828 ?auto_2366833 ) ) ( not ( = ?auto_2366828 ?auto_2366834 ) ) ( not ( = ?auto_2366828 ?auto_2366835 ) ) ( not ( = ?auto_2366828 ?auto_2366836 ) ) ( not ( = ?auto_2366829 ?auto_2366830 ) ) ( not ( = ?auto_2366829 ?auto_2366831 ) ) ( not ( = ?auto_2366829 ?auto_2366832 ) ) ( not ( = ?auto_2366829 ?auto_2366833 ) ) ( not ( = ?auto_2366829 ?auto_2366834 ) ) ( not ( = ?auto_2366829 ?auto_2366835 ) ) ( not ( = ?auto_2366829 ?auto_2366836 ) ) ( not ( = ?auto_2366830 ?auto_2366831 ) ) ( not ( = ?auto_2366830 ?auto_2366832 ) ) ( not ( = ?auto_2366830 ?auto_2366833 ) ) ( not ( = ?auto_2366830 ?auto_2366834 ) ) ( not ( = ?auto_2366830 ?auto_2366835 ) ) ( not ( = ?auto_2366830 ?auto_2366836 ) ) ( not ( = ?auto_2366831 ?auto_2366832 ) ) ( not ( = ?auto_2366831 ?auto_2366833 ) ) ( not ( = ?auto_2366831 ?auto_2366834 ) ) ( not ( = ?auto_2366831 ?auto_2366835 ) ) ( not ( = ?auto_2366831 ?auto_2366836 ) ) ( not ( = ?auto_2366832 ?auto_2366833 ) ) ( not ( = ?auto_2366832 ?auto_2366834 ) ) ( not ( = ?auto_2366832 ?auto_2366835 ) ) ( not ( = ?auto_2366832 ?auto_2366836 ) ) ( not ( = ?auto_2366833 ?auto_2366834 ) ) ( not ( = ?auto_2366833 ?auto_2366835 ) ) ( not ( = ?auto_2366833 ?auto_2366836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2366834 ?auto_2366835 ?auto_2366836 )
      ( MAKE-16CRATE-VERIFY ?auto_2366820 ?auto_2366821 ?auto_2366822 ?auto_2366823 ?auto_2366824 ?auto_2366825 ?auto_2366826 ?auto_2366827 ?auto_2366828 ?auto_2366829 ?auto_2366830 ?auto_2366831 ?auto_2366832 ?auto_2366833 ?auto_2366834 ?auto_2366835 ?auto_2366836 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367036 - SURFACE
      ?auto_2367037 - SURFACE
      ?auto_2367038 - SURFACE
      ?auto_2367039 - SURFACE
      ?auto_2367040 - SURFACE
      ?auto_2367041 - SURFACE
      ?auto_2367042 - SURFACE
      ?auto_2367043 - SURFACE
      ?auto_2367044 - SURFACE
      ?auto_2367045 - SURFACE
      ?auto_2367046 - SURFACE
      ?auto_2367047 - SURFACE
      ?auto_2367048 - SURFACE
      ?auto_2367049 - SURFACE
      ?auto_2367050 - SURFACE
      ?auto_2367051 - SURFACE
      ?auto_2367052 - SURFACE
    )
    :vars
    (
      ?auto_2367055 - HOIST
      ?auto_2367054 - PLACE
      ?auto_2367056 - TRUCK
      ?auto_2367053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367055 ?auto_2367054 ) ( SURFACE-AT ?auto_2367051 ?auto_2367054 ) ( CLEAR ?auto_2367051 ) ( IS-CRATE ?auto_2367052 ) ( not ( = ?auto_2367051 ?auto_2367052 ) ) ( AVAILABLE ?auto_2367055 ) ( IN ?auto_2367052 ?auto_2367056 ) ( ON ?auto_2367051 ?auto_2367050 ) ( not ( = ?auto_2367050 ?auto_2367051 ) ) ( not ( = ?auto_2367050 ?auto_2367052 ) ) ( TRUCK-AT ?auto_2367056 ?auto_2367053 ) ( not ( = ?auto_2367053 ?auto_2367054 ) ) ( ON ?auto_2367037 ?auto_2367036 ) ( ON ?auto_2367038 ?auto_2367037 ) ( ON ?auto_2367039 ?auto_2367038 ) ( ON ?auto_2367040 ?auto_2367039 ) ( ON ?auto_2367041 ?auto_2367040 ) ( ON ?auto_2367042 ?auto_2367041 ) ( ON ?auto_2367043 ?auto_2367042 ) ( ON ?auto_2367044 ?auto_2367043 ) ( ON ?auto_2367045 ?auto_2367044 ) ( ON ?auto_2367046 ?auto_2367045 ) ( ON ?auto_2367047 ?auto_2367046 ) ( ON ?auto_2367048 ?auto_2367047 ) ( ON ?auto_2367049 ?auto_2367048 ) ( ON ?auto_2367050 ?auto_2367049 ) ( not ( = ?auto_2367036 ?auto_2367037 ) ) ( not ( = ?auto_2367036 ?auto_2367038 ) ) ( not ( = ?auto_2367036 ?auto_2367039 ) ) ( not ( = ?auto_2367036 ?auto_2367040 ) ) ( not ( = ?auto_2367036 ?auto_2367041 ) ) ( not ( = ?auto_2367036 ?auto_2367042 ) ) ( not ( = ?auto_2367036 ?auto_2367043 ) ) ( not ( = ?auto_2367036 ?auto_2367044 ) ) ( not ( = ?auto_2367036 ?auto_2367045 ) ) ( not ( = ?auto_2367036 ?auto_2367046 ) ) ( not ( = ?auto_2367036 ?auto_2367047 ) ) ( not ( = ?auto_2367036 ?auto_2367048 ) ) ( not ( = ?auto_2367036 ?auto_2367049 ) ) ( not ( = ?auto_2367036 ?auto_2367050 ) ) ( not ( = ?auto_2367036 ?auto_2367051 ) ) ( not ( = ?auto_2367036 ?auto_2367052 ) ) ( not ( = ?auto_2367037 ?auto_2367038 ) ) ( not ( = ?auto_2367037 ?auto_2367039 ) ) ( not ( = ?auto_2367037 ?auto_2367040 ) ) ( not ( = ?auto_2367037 ?auto_2367041 ) ) ( not ( = ?auto_2367037 ?auto_2367042 ) ) ( not ( = ?auto_2367037 ?auto_2367043 ) ) ( not ( = ?auto_2367037 ?auto_2367044 ) ) ( not ( = ?auto_2367037 ?auto_2367045 ) ) ( not ( = ?auto_2367037 ?auto_2367046 ) ) ( not ( = ?auto_2367037 ?auto_2367047 ) ) ( not ( = ?auto_2367037 ?auto_2367048 ) ) ( not ( = ?auto_2367037 ?auto_2367049 ) ) ( not ( = ?auto_2367037 ?auto_2367050 ) ) ( not ( = ?auto_2367037 ?auto_2367051 ) ) ( not ( = ?auto_2367037 ?auto_2367052 ) ) ( not ( = ?auto_2367038 ?auto_2367039 ) ) ( not ( = ?auto_2367038 ?auto_2367040 ) ) ( not ( = ?auto_2367038 ?auto_2367041 ) ) ( not ( = ?auto_2367038 ?auto_2367042 ) ) ( not ( = ?auto_2367038 ?auto_2367043 ) ) ( not ( = ?auto_2367038 ?auto_2367044 ) ) ( not ( = ?auto_2367038 ?auto_2367045 ) ) ( not ( = ?auto_2367038 ?auto_2367046 ) ) ( not ( = ?auto_2367038 ?auto_2367047 ) ) ( not ( = ?auto_2367038 ?auto_2367048 ) ) ( not ( = ?auto_2367038 ?auto_2367049 ) ) ( not ( = ?auto_2367038 ?auto_2367050 ) ) ( not ( = ?auto_2367038 ?auto_2367051 ) ) ( not ( = ?auto_2367038 ?auto_2367052 ) ) ( not ( = ?auto_2367039 ?auto_2367040 ) ) ( not ( = ?auto_2367039 ?auto_2367041 ) ) ( not ( = ?auto_2367039 ?auto_2367042 ) ) ( not ( = ?auto_2367039 ?auto_2367043 ) ) ( not ( = ?auto_2367039 ?auto_2367044 ) ) ( not ( = ?auto_2367039 ?auto_2367045 ) ) ( not ( = ?auto_2367039 ?auto_2367046 ) ) ( not ( = ?auto_2367039 ?auto_2367047 ) ) ( not ( = ?auto_2367039 ?auto_2367048 ) ) ( not ( = ?auto_2367039 ?auto_2367049 ) ) ( not ( = ?auto_2367039 ?auto_2367050 ) ) ( not ( = ?auto_2367039 ?auto_2367051 ) ) ( not ( = ?auto_2367039 ?auto_2367052 ) ) ( not ( = ?auto_2367040 ?auto_2367041 ) ) ( not ( = ?auto_2367040 ?auto_2367042 ) ) ( not ( = ?auto_2367040 ?auto_2367043 ) ) ( not ( = ?auto_2367040 ?auto_2367044 ) ) ( not ( = ?auto_2367040 ?auto_2367045 ) ) ( not ( = ?auto_2367040 ?auto_2367046 ) ) ( not ( = ?auto_2367040 ?auto_2367047 ) ) ( not ( = ?auto_2367040 ?auto_2367048 ) ) ( not ( = ?auto_2367040 ?auto_2367049 ) ) ( not ( = ?auto_2367040 ?auto_2367050 ) ) ( not ( = ?auto_2367040 ?auto_2367051 ) ) ( not ( = ?auto_2367040 ?auto_2367052 ) ) ( not ( = ?auto_2367041 ?auto_2367042 ) ) ( not ( = ?auto_2367041 ?auto_2367043 ) ) ( not ( = ?auto_2367041 ?auto_2367044 ) ) ( not ( = ?auto_2367041 ?auto_2367045 ) ) ( not ( = ?auto_2367041 ?auto_2367046 ) ) ( not ( = ?auto_2367041 ?auto_2367047 ) ) ( not ( = ?auto_2367041 ?auto_2367048 ) ) ( not ( = ?auto_2367041 ?auto_2367049 ) ) ( not ( = ?auto_2367041 ?auto_2367050 ) ) ( not ( = ?auto_2367041 ?auto_2367051 ) ) ( not ( = ?auto_2367041 ?auto_2367052 ) ) ( not ( = ?auto_2367042 ?auto_2367043 ) ) ( not ( = ?auto_2367042 ?auto_2367044 ) ) ( not ( = ?auto_2367042 ?auto_2367045 ) ) ( not ( = ?auto_2367042 ?auto_2367046 ) ) ( not ( = ?auto_2367042 ?auto_2367047 ) ) ( not ( = ?auto_2367042 ?auto_2367048 ) ) ( not ( = ?auto_2367042 ?auto_2367049 ) ) ( not ( = ?auto_2367042 ?auto_2367050 ) ) ( not ( = ?auto_2367042 ?auto_2367051 ) ) ( not ( = ?auto_2367042 ?auto_2367052 ) ) ( not ( = ?auto_2367043 ?auto_2367044 ) ) ( not ( = ?auto_2367043 ?auto_2367045 ) ) ( not ( = ?auto_2367043 ?auto_2367046 ) ) ( not ( = ?auto_2367043 ?auto_2367047 ) ) ( not ( = ?auto_2367043 ?auto_2367048 ) ) ( not ( = ?auto_2367043 ?auto_2367049 ) ) ( not ( = ?auto_2367043 ?auto_2367050 ) ) ( not ( = ?auto_2367043 ?auto_2367051 ) ) ( not ( = ?auto_2367043 ?auto_2367052 ) ) ( not ( = ?auto_2367044 ?auto_2367045 ) ) ( not ( = ?auto_2367044 ?auto_2367046 ) ) ( not ( = ?auto_2367044 ?auto_2367047 ) ) ( not ( = ?auto_2367044 ?auto_2367048 ) ) ( not ( = ?auto_2367044 ?auto_2367049 ) ) ( not ( = ?auto_2367044 ?auto_2367050 ) ) ( not ( = ?auto_2367044 ?auto_2367051 ) ) ( not ( = ?auto_2367044 ?auto_2367052 ) ) ( not ( = ?auto_2367045 ?auto_2367046 ) ) ( not ( = ?auto_2367045 ?auto_2367047 ) ) ( not ( = ?auto_2367045 ?auto_2367048 ) ) ( not ( = ?auto_2367045 ?auto_2367049 ) ) ( not ( = ?auto_2367045 ?auto_2367050 ) ) ( not ( = ?auto_2367045 ?auto_2367051 ) ) ( not ( = ?auto_2367045 ?auto_2367052 ) ) ( not ( = ?auto_2367046 ?auto_2367047 ) ) ( not ( = ?auto_2367046 ?auto_2367048 ) ) ( not ( = ?auto_2367046 ?auto_2367049 ) ) ( not ( = ?auto_2367046 ?auto_2367050 ) ) ( not ( = ?auto_2367046 ?auto_2367051 ) ) ( not ( = ?auto_2367046 ?auto_2367052 ) ) ( not ( = ?auto_2367047 ?auto_2367048 ) ) ( not ( = ?auto_2367047 ?auto_2367049 ) ) ( not ( = ?auto_2367047 ?auto_2367050 ) ) ( not ( = ?auto_2367047 ?auto_2367051 ) ) ( not ( = ?auto_2367047 ?auto_2367052 ) ) ( not ( = ?auto_2367048 ?auto_2367049 ) ) ( not ( = ?auto_2367048 ?auto_2367050 ) ) ( not ( = ?auto_2367048 ?auto_2367051 ) ) ( not ( = ?auto_2367048 ?auto_2367052 ) ) ( not ( = ?auto_2367049 ?auto_2367050 ) ) ( not ( = ?auto_2367049 ?auto_2367051 ) ) ( not ( = ?auto_2367049 ?auto_2367052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2367050 ?auto_2367051 ?auto_2367052 )
      ( MAKE-16CRATE-VERIFY ?auto_2367036 ?auto_2367037 ?auto_2367038 ?auto_2367039 ?auto_2367040 ?auto_2367041 ?auto_2367042 ?auto_2367043 ?auto_2367044 ?auto_2367045 ?auto_2367046 ?auto_2367047 ?auto_2367048 ?auto_2367049 ?auto_2367050 ?auto_2367051 ?auto_2367052 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367268 - SURFACE
      ?auto_2367269 - SURFACE
      ?auto_2367270 - SURFACE
      ?auto_2367271 - SURFACE
      ?auto_2367272 - SURFACE
      ?auto_2367273 - SURFACE
      ?auto_2367274 - SURFACE
      ?auto_2367275 - SURFACE
      ?auto_2367276 - SURFACE
      ?auto_2367277 - SURFACE
      ?auto_2367278 - SURFACE
      ?auto_2367279 - SURFACE
      ?auto_2367280 - SURFACE
      ?auto_2367281 - SURFACE
      ?auto_2367282 - SURFACE
      ?auto_2367283 - SURFACE
      ?auto_2367284 - SURFACE
    )
    :vars
    (
      ?auto_2367287 - HOIST
      ?auto_2367285 - PLACE
      ?auto_2367286 - TRUCK
      ?auto_2367288 - PLACE
      ?auto_2367289 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367287 ?auto_2367285 ) ( SURFACE-AT ?auto_2367283 ?auto_2367285 ) ( CLEAR ?auto_2367283 ) ( IS-CRATE ?auto_2367284 ) ( not ( = ?auto_2367283 ?auto_2367284 ) ) ( AVAILABLE ?auto_2367287 ) ( ON ?auto_2367283 ?auto_2367282 ) ( not ( = ?auto_2367282 ?auto_2367283 ) ) ( not ( = ?auto_2367282 ?auto_2367284 ) ) ( TRUCK-AT ?auto_2367286 ?auto_2367288 ) ( not ( = ?auto_2367288 ?auto_2367285 ) ) ( HOIST-AT ?auto_2367289 ?auto_2367288 ) ( LIFTING ?auto_2367289 ?auto_2367284 ) ( not ( = ?auto_2367287 ?auto_2367289 ) ) ( ON ?auto_2367269 ?auto_2367268 ) ( ON ?auto_2367270 ?auto_2367269 ) ( ON ?auto_2367271 ?auto_2367270 ) ( ON ?auto_2367272 ?auto_2367271 ) ( ON ?auto_2367273 ?auto_2367272 ) ( ON ?auto_2367274 ?auto_2367273 ) ( ON ?auto_2367275 ?auto_2367274 ) ( ON ?auto_2367276 ?auto_2367275 ) ( ON ?auto_2367277 ?auto_2367276 ) ( ON ?auto_2367278 ?auto_2367277 ) ( ON ?auto_2367279 ?auto_2367278 ) ( ON ?auto_2367280 ?auto_2367279 ) ( ON ?auto_2367281 ?auto_2367280 ) ( ON ?auto_2367282 ?auto_2367281 ) ( not ( = ?auto_2367268 ?auto_2367269 ) ) ( not ( = ?auto_2367268 ?auto_2367270 ) ) ( not ( = ?auto_2367268 ?auto_2367271 ) ) ( not ( = ?auto_2367268 ?auto_2367272 ) ) ( not ( = ?auto_2367268 ?auto_2367273 ) ) ( not ( = ?auto_2367268 ?auto_2367274 ) ) ( not ( = ?auto_2367268 ?auto_2367275 ) ) ( not ( = ?auto_2367268 ?auto_2367276 ) ) ( not ( = ?auto_2367268 ?auto_2367277 ) ) ( not ( = ?auto_2367268 ?auto_2367278 ) ) ( not ( = ?auto_2367268 ?auto_2367279 ) ) ( not ( = ?auto_2367268 ?auto_2367280 ) ) ( not ( = ?auto_2367268 ?auto_2367281 ) ) ( not ( = ?auto_2367268 ?auto_2367282 ) ) ( not ( = ?auto_2367268 ?auto_2367283 ) ) ( not ( = ?auto_2367268 ?auto_2367284 ) ) ( not ( = ?auto_2367269 ?auto_2367270 ) ) ( not ( = ?auto_2367269 ?auto_2367271 ) ) ( not ( = ?auto_2367269 ?auto_2367272 ) ) ( not ( = ?auto_2367269 ?auto_2367273 ) ) ( not ( = ?auto_2367269 ?auto_2367274 ) ) ( not ( = ?auto_2367269 ?auto_2367275 ) ) ( not ( = ?auto_2367269 ?auto_2367276 ) ) ( not ( = ?auto_2367269 ?auto_2367277 ) ) ( not ( = ?auto_2367269 ?auto_2367278 ) ) ( not ( = ?auto_2367269 ?auto_2367279 ) ) ( not ( = ?auto_2367269 ?auto_2367280 ) ) ( not ( = ?auto_2367269 ?auto_2367281 ) ) ( not ( = ?auto_2367269 ?auto_2367282 ) ) ( not ( = ?auto_2367269 ?auto_2367283 ) ) ( not ( = ?auto_2367269 ?auto_2367284 ) ) ( not ( = ?auto_2367270 ?auto_2367271 ) ) ( not ( = ?auto_2367270 ?auto_2367272 ) ) ( not ( = ?auto_2367270 ?auto_2367273 ) ) ( not ( = ?auto_2367270 ?auto_2367274 ) ) ( not ( = ?auto_2367270 ?auto_2367275 ) ) ( not ( = ?auto_2367270 ?auto_2367276 ) ) ( not ( = ?auto_2367270 ?auto_2367277 ) ) ( not ( = ?auto_2367270 ?auto_2367278 ) ) ( not ( = ?auto_2367270 ?auto_2367279 ) ) ( not ( = ?auto_2367270 ?auto_2367280 ) ) ( not ( = ?auto_2367270 ?auto_2367281 ) ) ( not ( = ?auto_2367270 ?auto_2367282 ) ) ( not ( = ?auto_2367270 ?auto_2367283 ) ) ( not ( = ?auto_2367270 ?auto_2367284 ) ) ( not ( = ?auto_2367271 ?auto_2367272 ) ) ( not ( = ?auto_2367271 ?auto_2367273 ) ) ( not ( = ?auto_2367271 ?auto_2367274 ) ) ( not ( = ?auto_2367271 ?auto_2367275 ) ) ( not ( = ?auto_2367271 ?auto_2367276 ) ) ( not ( = ?auto_2367271 ?auto_2367277 ) ) ( not ( = ?auto_2367271 ?auto_2367278 ) ) ( not ( = ?auto_2367271 ?auto_2367279 ) ) ( not ( = ?auto_2367271 ?auto_2367280 ) ) ( not ( = ?auto_2367271 ?auto_2367281 ) ) ( not ( = ?auto_2367271 ?auto_2367282 ) ) ( not ( = ?auto_2367271 ?auto_2367283 ) ) ( not ( = ?auto_2367271 ?auto_2367284 ) ) ( not ( = ?auto_2367272 ?auto_2367273 ) ) ( not ( = ?auto_2367272 ?auto_2367274 ) ) ( not ( = ?auto_2367272 ?auto_2367275 ) ) ( not ( = ?auto_2367272 ?auto_2367276 ) ) ( not ( = ?auto_2367272 ?auto_2367277 ) ) ( not ( = ?auto_2367272 ?auto_2367278 ) ) ( not ( = ?auto_2367272 ?auto_2367279 ) ) ( not ( = ?auto_2367272 ?auto_2367280 ) ) ( not ( = ?auto_2367272 ?auto_2367281 ) ) ( not ( = ?auto_2367272 ?auto_2367282 ) ) ( not ( = ?auto_2367272 ?auto_2367283 ) ) ( not ( = ?auto_2367272 ?auto_2367284 ) ) ( not ( = ?auto_2367273 ?auto_2367274 ) ) ( not ( = ?auto_2367273 ?auto_2367275 ) ) ( not ( = ?auto_2367273 ?auto_2367276 ) ) ( not ( = ?auto_2367273 ?auto_2367277 ) ) ( not ( = ?auto_2367273 ?auto_2367278 ) ) ( not ( = ?auto_2367273 ?auto_2367279 ) ) ( not ( = ?auto_2367273 ?auto_2367280 ) ) ( not ( = ?auto_2367273 ?auto_2367281 ) ) ( not ( = ?auto_2367273 ?auto_2367282 ) ) ( not ( = ?auto_2367273 ?auto_2367283 ) ) ( not ( = ?auto_2367273 ?auto_2367284 ) ) ( not ( = ?auto_2367274 ?auto_2367275 ) ) ( not ( = ?auto_2367274 ?auto_2367276 ) ) ( not ( = ?auto_2367274 ?auto_2367277 ) ) ( not ( = ?auto_2367274 ?auto_2367278 ) ) ( not ( = ?auto_2367274 ?auto_2367279 ) ) ( not ( = ?auto_2367274 ?auto_2367280 ) ) ( not ( = ?auto_2367274 ?auto_2367281 ) ) ( not ( = ?auto_2367274 ?auto_2367282 ) ) ( not ( = ?auto_2367274 ?auto_2367283 ) ) ( not ( = ?auto_2367274 ?auto_2367284 ) ) ( not ( = ?auto_2367275 ?auto_2367276 ) ) ( not ( = ?auto_2367275 ?auto_2367277 ) ) ( not ( = ?auto_2367275 ?auto_2367278 ) ) ( not ( = ?auto_2367275 ?auto_2367279 ) ) ( not ( = ?auto_2367275 ?auto_2367280 ) ) ( not ( = ?auto_2367275 ?auto_2367281 ) ) ( not ( = ?auto_2367275 ?auto_2367282 ) ) ( not ( = ?auto_2367275 ?auto_2367283 ) ) ( not ( = ?auto_2367275 ?auto_2367284 ) ) ( not ( = ?auto_2367276 ?auto_2367277 ) ) ( not ( = ?auto_2367276 ?auto_2367278 ) ) ( not ( = ?auto_2367276 ?auto_2367279 ) ) ( not ( = ?auto_2367276 ?auto_2367280 ) ) ( not ( = ?auto_2367276 ?auto_2367281 ) ) ( not ( = ?auto_2367276 ?auto_2367282 ) ) ( not ( = ?auto_2367276 ?auto_2367283 ) ) ( not ( = ?auto_2367276 ?auto_2367284 ) ) ( not ( = ?auto_2367277 ?auto_2367278 ) ) ( not ( = ?auto_2367277 ?auto_2367279 ) ) ( not ( = ?auto_2367277 ?auto_2367280 ) ) ( not ( = ?auto_2367277 ?auto_2367281 ) ) ( not ( = ?auto_2367277 ?auto_2367282 ) ) ( not ( = ?auto_2367277 ?auto_2367283 ) ) ( not ( = ?auto_2367277 ?auto_2367284 ) ) ( not ( = ?auto_2367278 ?auto_2367279 ) ) ( not ( = ?auto_2367278 ?auto_2367280 ) ) ( not ( = ?auto_2367278 ?auto_2367281 ) ) ( not ( = ?auto_2367278 ?auto_2367282 ) ) ( not ( = ?auto_2367278 ?auto_2367283 ) ) ( not ( = ?auto_2367278 ?auto_2367284 ) ) ( not ( = ?auto_2367279 ?auto_2367280 ) ) ( not ( = ?auto_2367279 ?auto_2367281 ) ) ( not ( = ?auto_2367279 ?auto_2367282 ) ) ( not ( = ?auto_2367279 ?auto_2367283 ) ) ( not ( = ?auto_2367279 ?auto_2367284 ) ) ( not ( = ?auto_2367280 ?auto_2367281 ) ) ( not ( = ?auto_2367280 ?auto_2367282 ) ) ( not ( = ?auto_2367280 ?auto_2367283 ) ) ( not ( = ?auto_2367280 ?auto_2367284 ) ) ( not ( = ?auto_2367281 ?auto_2367282 ) ) ( not ( = ?auto_2367281 ?auto_2367283 ) ) ( not ( = ?auto_2367281 ?auto_2367284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2367282 ?auto_2367283 ?auto_2367284 )
      ( MAKE-16CRATE-VERIFY ?auto_2367268 ?auto_2367269 ?auto_2367270 ?auto_2367271 ?auto_2367272 ?auto_2367273 ?auto_2367274 ?auto_2367275 ?auto_2367276 ?auto_2367277 ?auto_2367278 ?auto_2367279 ?auto_2367280 ?auto_2367281 ?auto_2367282 ?auto_2367283 ?auto_2367284 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367516 - SURFACE
      ?auto_2367517 - SURFACE
      ?auto_2367518 - SURFACE
      ?auto_2367519 - SURFACE
      ?auto_2367520 - SURFACE
      ?auto_2367521 - SURFACE
      ?auto_2367522 - SURFACE
      ?auto_2367523 - SURFACE
      ?auto_2367524 - SURFACE
      ?auto_2367525 - SURFACE
      ?auto_2367526 - SURFACE
      ?auto_2367527 - SURFACE
      ?auto_2367528 - SURFACE
      ?auto_2367529 - SURFACE
      ?auto_2367530 - SURFACE
      ?auto_2367531 - SURFACE
      ?auto_2367532 - SURFACE
    )
    :vars
    (
      ?auto_2367534 - HOIST
      ?auto_2367533 - PLACE
      ?auto_2367535 - TRUCK
      ?auto_2367538 - PLACE
      ?auto_2367536 - HOIST
      ?auto_2367537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367534 ?auto_2367533 ) ( SURFACE-AT ?auto_2367531 ?auto_2367533 ) ( CLEAR ?auto_2367531 ) ( IS-CRATE ?auto_2367532 ) ( not ( = ?auto_2367531 ?auto_2367532 ) ) ( AVAILABLE ?auto_2367534 ) ( ON ?auto_2367531 ?auto_2367530 ) ( not ( = ?auto_2367530 ?auto_2367531 ) ) ( not ( = ?auto_2367530 ?auto_2367532 ) ) ( TRUCK-AT ?auto_2367535 ?auto_2367538 ) ( not ( = ?auto_2367538 ?auto_2367533 ) ) ( HOIST-AT ?auto_2367536 ?auto_2367538 ) ( not ( = ?auto_2367534 ?auto_2367536 ) ) ( AVAILABLE ?auto_2367536 ) ( SURFACE-AT ?auto_2367532 ?auto_2367538 ) ( ON ?auto_2367532 ?auto_2367537 ) ( CLEAR ?auto_2367532 ) ( not ( = ?auto_2367531 ?auto_2367537 ) ) ( not ( = ?auto_2367532 ?auto_2367537 ) ) ( not ( = ?auto_2367530 ?auto_2367537 ) ) ( ON ?auto_2367517 ?auto_2367516 ) ( ON ?auto_2367518 ?auto_2367517 ) ( ON ?auto_2367519 ?auto_2367518 ) ( ON ?auto_2367520 ?auto_2367519 ) ( ON ?auto_2367521 ?auto_2367520 ) ( ON ?auto_2367522 ?auto_2367521 ) ( ON ?auto_2367523 ?auto_2367522 ) ( ON ?auto_2367524 ?auto_2367523 ) ( ON ?auto_2367525 ?auto_2367524 ) ( ON ?auto_2367526 ?auto_2367525 ) ( ON ?auto_2367527 ?auto_2367526 ) ( ON ?auto_2367528 ?auto_2367527 ) ( ON ?auto_2367529 ?auto_2367528 ) ( ON ?auto_2367530 ?auto_2367529 ) ( not ( = ?auto_2367516 ?auto_2367517 ) ) ( not ( = ?auto_2367516 ?auto_2367518 ) ) ( not ( = ?auto_2367516 ?auto_2367519 ) ) ( not ( = ?auto_2367516 ?auto_2367520 ) ) ( not ( = ?auto_2367516 ?auto_2367521 ) ) ( not ( = ?auto_2367516 ?auto_2367522 ) ) ( not ( = ?auto_2367516 ?auto_2367523 ) ) ( not ( = ?auto_2367516 ?auto_2367524 ) ) ( not ( = ?auto_2367516 ?auto_2367525 ) ) ( not ( = ?auto_2367516 ?auto_2367526 ) ) ( not ( = ?auto_2367516 ?auto_2367527 ) ) ( not ( = ?auto_2367516 ?auto_2367528 ) ) ( not ( = ?auto_2367516 ?auto_2367529 ) ) ( not ( = ?auto_2367516 ?auto_2367530 ) ) ( not ( = ?auto_2367516 ?auto_2367531 ) ) ( not ( = ?auto_2367516 ?auto_2367532 ) ) ( not ( = ?auto_2367516 ?auto_2367537 ) ) ( not ( = ?auto_2367517 ?auto_2367518 ) ) ( not ( = ?auto_2367517 ?auto_2367519 ) ) ( not ( = ?auto_2367517 ?auto_2367520 ) ) ( not ( = ?auto_2367517 ?auto_2367521 ) ) ( not ( = ?auto_2367517 ?auto_2367522 ) ) ( not ( = ?auto_2367517 ?auto_2367523 ) ) ( not ( = ?auto_2367517 ?auto_2367524 ) ) ( not ( = ?auto_2367517 ?auto_2367525 ) ) ( not ( = ?auto_2367517 ?auto_2367526 ) ) ( not ( = ?auto_2367517 ?auto_2367527 ) ) ( not ( = ?auto_2367517 ?auto_2367528 ) ) ( not ( = ?auto_2367517 ?auto_2367529 ) ) ( not ( = ?auto_2367517 ?auto_2367530 ) ) ( not ( = ?auto_2367517 ?auto_2367531 ) ) ( not ( = ?auto_2367517 ?auto_2367532 ) ) ( not ( = ?auto_2367517 ?auto_2367537 ) ) ( not ( = ?auto_2367518 ?auto_2367519 ) ) ( not ( = ?auto_2367518 ?auto_2367520 ) ) ( not ( = ?auto_2367518 ?auto_2367521 ) ) ( not ( = ?auto_2367518 ?auto_2367522 ) ) ( not ( = ?auto_2367518 ?auto_2367523 ) ) ( not ( = ?auto_2367518 ?auto_2367524 ) ) ( not ( = ?auto_2367518 ?auto_2367525 ) ) ( not ( = ?auto_2367518 ?auto_2367526 ) ) ( not ( = ?auto_2367518 ?auto_2367527 ) ) ( not ( = ?auto_2367518 ?auto_2367528 ) ) ( not ( = ?auto_2367518 ?auto_2367529 ) ) ( not ( = ?auto_2367518 ?auto_2367530 ) ) ( not ( = ?auto_2367518 ?auto_2367531 ) ) ( not ( = ?auto_2367518 ?auto_2367532 ) ) ( not ( = ?auto_2367518 ?auto_2367537 ) ) ( not ( = ?auto_2367519 ?auto_2367520 ) ) ( not ( = ?auto_2367519 ?auto_2367521 ) ) ( not ( = ?auto_2367519 ?auto_2367522 ) ) ( not ( = ?auto_2367519 ?auto_2367523 ) ) ( not ( = ?auto_2367519 ?auto_2367524 ) ) ( not ( = ?auto_2367519 ?auto_2367525 ) ) ( not ( = ?auto_2367519 ?auto_2367526 ) ) ( not ( = ?auto_2367519 ?auto_2367527 ) ) ( not ( = ?auto_2367519 ?auto_2367528 ) ) ( not ( = ?auto_2367519 ?auto_2367529 ) ) ( not ( = ?auto_2367519 ?auto_2367530 ) ) ( not ( = ?auto_2367519 ?auto_2367531 ) ) ( not ( = ?auto_2367519 ?auto_2367532 ) ) ( not ( = ?auto_2367519 ?auto_2367537 ) ) ( not ( = ?auto_2367520 ?auto_2367521 ) ) ( not ( = ?auto_2367520 ?auto_2367522 ) ) ( not ( = ?auto_2367520 ?auto_2367523 ) ) ( not ( = ?auto_2367520 ?auto_2367524 ) ) ( not ( = ?auto_2367520 ?auto_2367525 ) ) ( not ( = ?auto_2367520 ?auto_2367526 ) ) ( not ( = ?auto_2367520 ?auto_2367527 ) ) ( not ( = ?auto_2367520 ?auto_2367528 ) ) ( not ( = ?auto_2367520 ?auto_2367529 ) ) ( not ( = ?auto_2367520 ?auto_2367530 ) ) ( not ( = ?auto_2367520 ?auto_2367531 ) ) ( not ( = ?auto_2367520 ?auto_2367532 ) ) ( not ( = ?auto_2367520 ?auto_2367537 ) ) ( not ( = ?auto_2367521 ?auto_2367522 ) ) ( not ( = ?auto_2367521 ?auto_2367523 ) ) ( not ( = ?auto_2367521 ?auto_2367524 ) ) ( not ( = ?auto_2367521 ?auto_2367525 ) ) ( not ( = ?auto_2367521 ?auto_2367526 ) ) ( not ( = ?auto_2367521 ?auto_2367527 ) ) ( not ( = ?auto_2367521 ?auto_2367528 ) ) ( not ( = ?auto_2367521 ?auto_2367529 ) ) ( not ( = ?auto_2367521 ?auto_2367530 ) ) ( not ( = ?auto_2367521 ?auto_2367531 ) ) ( not ( = ?auto_2367521 ?auto_2367532 ) ) ( not ( = ?auto_2367521 ?auto_2367537 ) ) ( not ( = ?auto_2367522 ?auto_2367523 ) ) ( not ( = ?auto_2367522 ?auto_2367524 ) ) ( not ( = ?auto_2367522 ?auto_2367525 ) ) ( not ( = ?auto_2367522 ?auto_2367526 ) ) ( not ( = ?auto_2367522 ?auto_2367527 ) ) ( not ( = ?auto_2367522 ?auto_2367528 ) ) ( not ( = ?auto_2367522 ?auto_2367529 ) ) ( not ( = ?auto_2367522 ?auto_2367530 ) ) ( not ( = ?auto_2367522 ?auto_2367531 ) ) ( not ( = ?auto_2367522 ?auto_2367532 ) ) ( not ( = ?auto_2367522 ?auto_2367537 ) ) ( not ( = ?auto_2367523 ?auto_2367524 ) ) ( not ( = ?auto_2367523 ?auto_2367525 ) ) ( not ( = ?auto_2367523 ?auto_2367526 ) ) ( not ( = ?auto_2367523 ?auto_2367527 ) ) ( not ( = ?auto_2367523 ?auto_2367528 ) ) ( not ( = ?auto_2367523 ?auto_2367529 ) ) ( not ( = ?auto_2367523 ?auto_2367530 ) ) ( not ( = ?auto_2367523 ?auto_2367531 ) ) ( not ( = ?auto_2367523 ?auto_2367532 ) ) ( not ( = ?auto_2367523 ?auto_2367537 ) ) ( not ( = ?auto_2367524 ?auto_2367525 ) ) ( not ( = ?auto_2367524 ?auto_2367526 ) ) ( not ( = ?auto_2367524 ?auto_2367527 ) ) ( not ( = ?auto_2367524 ?auto_2367528 ) ) ( not ( = ?auto_2367524 ?auto_2367529 ) ) ( not ( = ?auto_2367524 ?auto_2367530 ) ) ( not ( = ?auto_2367524 ?auto_2367531 ) ) ( not ( = ?auto_2367524 ?auto_2367532 ) ) ( not ( = ?auto_2367524 ?auto_2367537 ) ) ( not ( = ?auto_2367525 ?auto_2367526 ) ) ( not ( = ?auto_2367525 ?auto_2367527 ) ) ( not ( = ?auto_2367525 ?auto_2367528 ) ) ( not ( = ?auto_2367525 ?auto_2367529 ) ) ( not ( = ?auto_2367525 ?auto_2367530 ) ) ( not ( = ?auto_2367525 ?auto_2367531 ) ) ( not ( = ?auto_2367525 ?auto_2367532 ) ) ( not ( = ?auto_2367525 ?auto_2367537 ) ) ( not ( = ?auto_2367526 ?auto_2367527 ) ) ( not ( = ?auto_2367526 ?auto_2367528 ) ) ( not ( = ?auto_2367526 ?auto_2367529 ) ) ( not ( = ?auto_2367526 ?auto_2367530 ) ) ( not ( = ?auto_2367526 ?auto_2367531 ) ) ( not ( = ?auto_2367526 ?auto_2367532 ) ) ( not ( = ?auto_2367526 ?auto_2367537 ) ) ( not ( = ?auto_2367527 ?auto_2367528 ) ) ( not ( = ?auto_2367527 ?auto_2367529 ) ) ( not ( = ?auto_2367527 ?auto_2367530 ) ) ( not ( = ?auto_2367527 ?auto_2367531 ) ) ( not ( = ?auto_2367527 ?auto_2367532 ) ) ( not ( = ?auto_2367527 ?auto_2367537 ) ) ( not ( = ?auto_2367528 ?auto_2367529 ) ) ( not ( = ?auto_2367528 ?auto_2367530 ) ) ( not ( = ?auto_2367528 ?auto_2367531 ) ) ( not ( = ?auto_2367528 ?auto_2367532 ) ) ( not ( = ?auto_2367528 ?auto_2367537 ) ) ( not ( = ?auto_2367529 ?auto_2367530 ) ) ( not ( = ?auto_2367529 ?auto_2367531 ) ) ( not ( = ?auto_2367529 ?auto_2367532 ) ) ( not ( = ?auto_2367529 ?auto_2367537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2367530 ?auto_2367531 ?auto_2367532 )
      ( MAKE-16CRATE-VERIFY ?auto_2367516 ?auto_2367517 ?auto_2367518 ?auto_2367519 ?auto_2367520 ?auto_2367521 ?auto_2367522 ?auto_2367523 ?auto_2367524 ?auto_2367525 ?auto_2367526 ?auto_2367527 ?auto_2367528 ?auto_2367529 ?auto_2367530 ?auto_2367531 ?auto_2367532 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367765 - SURFACE
      ?auto_2367766 - SURFACE
      ?auto_2367767 - SURFACE
      ?auto_2367768 - SURFACE
      ?auto_2367769 - SURFACE
      ?auto_2367770 - SURFACE
      ?auto_2367771 - SURFACE
      ?auto_2367772 - SURFACE
      ?auto_2367773 - SURFACE
      ?auto_2367774 - SURFACE
      ?auto_2367775 - SURFACE
      ?auto_2367776 - SURFACE
      ?auto_2367777 - SURFACE
      ?auto_2367778 - SURFACE
      ?auto_2367779 - SURFACE
      ?auto_2367780 - SURFACE
      ?auto_2367781 - SURFACE
    )
    :vars
    (
      ?auto_2367784 - HOIST
      ?auto_2367783 - PLACE
      ?auto_2367786 - PLACE
      ?auto_2367782 - HOIST
      ?auto_2367785 - SURFACE
      ?auto_2367787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367784 ?auto_2367783 ) ( SURFACE-AT ?auto_2367780 ?auto_2367783 ) ( CLEAR ?auto_2367780 ) ( IS-CRATE ?auto_2367781 ) ( not ( = ?auto_2367780 ?auto_2367781 ) ) ( AVAILABLE ?auto_2367784 ) ( ON ?auto_2367780 ?auto_2367779 ) ( not ( = ?auto_2367779 ?auto_2367780 ) ) ( not ( = ?auto_2367779 ?auto_2367781 ) ) ( not ( = ?auto_2367786 ?auto_2367783 ) ) ( HOIST-AT ?auto_2367782 ?auto_2367786 ) ( not ( = ?auto_2367784 ?auto_2367782 ) ) ( AVAILABLE ?auto_2367782 ) ( SURFACE-AT ?auto_2367781 ?auto_2367786 ) ( ON ?auto_2367781 ?auto_2367785 ) ( CLEAR ?auto_2367781 ) ( not ( = ?auto_2367780 ?auto_2367785 ) ) ( not ( = ?auto_2367781 ?auto_2367785 ) ) ( not ( = ?auto_2367779 ?auto_2367785 ) ) ( TRUCK-AT ?auto_2367787 ?auto_2367783 ) ( ON ?auto_2367766 ?auto_2367765 ) ( ON ?auto_2367767 ?auto_2367766 ) ( ON ?auto_2367768 ?auto_2367767 ) ( ON ?auto_2367769 ?auto_2367768 ) ( ON ?auto_2367770 ?auto_2367769 ) ( ON ?auto_2367771 ?auto_2367770 ) ( ON ?auto_2367772 ?auto_2367771 ) ( ON ?auto_2367773 ?auto_2367772 ) ( ON ?auto_2367774 ?auto_2367773 ) ( ON ?auto_2367775 ?auto_2367774 ) ( ON ?auto_2367776 ?auto_2367775 ) ( ON ?auto_2367777 ?auto_2367776 ) ( ON ?auto_2367778 ?auto_2367777 ) ( ON ?auto_2367779 ?auto_2367778 ) ( not ( = ?auto_2367765 ?auto_2367766 ) ) ( not ( = ?auto_2367765 ?auto_2367767 ) ) ( not ( = ?auto_2367765 ?auto_2367768 ) ) ( not ( = ?auto_2367765 ?auto_2367769 ) ) ( not ( = ?auto_2367765 ?auto_2367770 ) ) ( not ( = ?auto_2367765 ?auto_2367771 ) ) ( not ( = ?auto_2367765 ?auto_2367772 ) ) ( not ( = ?auto_2367765 ?auto_2367773 ) ) ( not ( = ?auto_2367765 ?auto_2367774 ) ) ( not ( = ?auto_2367765 ?auto_2367775 ) ) ( not ( = ?auto_2367765 ?auto_2367776 ) ) ( not ( = ?auto_2367765 ?auto_2367777 ) ) ( not ( = ?auto_2367765 ?auto_2367778 ) ) ( not ( = ?auto_2367765 ?auto_2367779 ) ) ( not ( = ?auto_2367765 ?auto_2367780 ) ) ( not ( = ?auto_2367765 ?auto_2367781 ) ) ( not ( = ?auto_2367765 ?auto_2367785 ) ) ( not ( = ?auto_2367766 ?auto_2367767 ) ) ( not ( = ?auto_2367766 ?auto_2367768 ) ) ( not ( = ?auto_2367766 ?auto_2367769 ) ) ( not ( = ?auto_2367766 ?auto_2367770 ) ) ( not ( = ?auto_2367766 ?auto_2367771 ) ) ( not ( = ?auto_2367766 ?auto_2367772 ) ) ( not ( = ?auto_2367766 ?auto_2367773 ) ) ( not ( = ?auto_2367766 ?auto_2367774 ) ) ( not ( = ?auto_2367766 ?auto_2367775 ) ) ( not ( = ?auto_2367766 ?auto_2367776 ) ) ( not ( = ?auto_2367766 ?auto_2367777 ) ) ( not ( = ?auto_2367766 ?auto_2367778 ) ) ( not ( = ?auto_2367766 ?auto_2367779 ) ) ( not ( = ?auto_2367766 ?auto_2367780 ) ) ( not ( = ?auto_2367766 ?auto_2367781 ) ) ( not ( = ?auto_2367766 ?auto_2367785 ) ) ( not ( = ?auto_2367767 ?auto_2367768 ) ) ( not ( = ?auto_2367767 ?auto_2367769 ) ) ( not ( = ?auto_2367767 ?auto_2367770 ) ) ( not ( = ?auto_2367767 ?auto_2367771 ) ) ( not ( = ?auto_2367767 ?auto_2367772 ) ) ( not ( = ?auto_2367767 ?auto_2367773 ) ) ( not ( = ?auto_2367767 ?auto_2367774 ) ) ( not ( = ?auto_2367767 ?auto_2367775 ) ) ( not ( = ?auto_2367767 ?auto_2367776 ) ) ( not ( = ?auto_2367767 ?auto_2367777 ) ) ( not ( = ?auto_2367767 ?auto_2367778 ) ) ( not ( = ?auto_2367767 ?auto_2367779 ) ) ( not ( = ?auto_2367767 ?auto_2367780 ) ) ( not ( = ?auto_2367767 ?auto_2367781 ) ) ( not ( = ?auto_2367767 ?auto_2367785 ) ) ( not ( = ?auto_2367768 ?auto_2367769 ) ) ( not ( = ?auto_2367768 ?auto_2367770 ) ) ( not ( = ?auto_2367768 ?auto_2367771 ) ) ( not ( = ?auto_2367768 ?auto_2367772 ) ) ( not ( = ?auto_2367768 ?auto_2367773 ) ) ( not ( = ?auto_2367768 ?auto_2367774 ) ) ( not ( = ?auto_2367768 ?auto_2367775 ) ) ( not ( = ?auto_2367768 ?auto_2367776 ) ) ( not ( = ?auto_2367768 ?auto_2367777 ) ) ( not ( = ?auto_2367768 ?auto_2367778 ) ) ( not ( = ?auto_2367768 ?auto_2367779 ) ) ( not ( = ?auto_2367768 ?auto_2367780 ) ) ( not ( = ?auto_2367768 ?auto_2367781 ) ) ( not ( = ?auto_2367768 ?auto_2367785 ) ) ( not ( = ?auto_2367769 ?auto_2367770 ) ) ( not ( = ?auto_2367769 ?auto_2367771 ) ) ( not ( = ?auto_2367769 ?auto_2367772 ) ) ( not ( = ?auto_2367769 ?auto_2367773 ) ) ( not ( = ?auto_2367769 ?auto_2367774 ) ) ( not ( = ?auto_2367769 ?auto_2367775 ) ) ( not ( = ?auto_2367769 ?auto_2367776 ) ) ( not ( = ?auto_2367769 ?auto_2367777 ) ) ( not ( = ?auto_2367769 ?auto_2367778 ) ) ( not ( = ?auto_2367769 ?auto_2367779 ) ) ( not ( = ?auto_2367769 ?auto_2367780 ) ) ( not ( = ?auto_2367769 ?auto_2367781 ) ) ( not ( = ?auto_2367769 ?auto_2367785 ) ) ( not ( = ?auto_2367770 ?auto_2367771 ) ) ( not ( = ?auto_2367770 ?auto_2367772 ) ) ( not ( = ?auto_2367770 ?auto_2367773 ) ) ( not ( = ?auto_2367770 ?auto_2367774 ) ) ( not ( = ?auto_2367770 ?auto_2367775 ) ) ( not ( = ?auto_2367770 ?auto_2367776 ) ) ( not ( = ?auto_2367770 ?auto_2367777 ) ) ( not ( = ?auto_2367770 ?auto_2367778 ) ) ( not ( = ?auto_2367770 ?auto_2367779 ) ) ( not ( = ?auto_2367770 ?auto_2367780 ) ) ( not ( = ?auto_2367770 ?auto_2367781 ) ) ( not ( = ?auto_2367770 ?auto_2367785 ) ) ( not ( = ?auto_2367771 ?auto_2367772 ) ) ( not ( = ?auto_2367771 ?auto_2367773 ) ) ( not ( = ?auto_2367771 ?auto_2367774 ) ) ( not ( = ?auto_2367771 ?auto_2367775 ) ) ( not ( = ?auto_2367771 ?auto_2367776 ) ) ( not ( = ?auto_2367771 ?auto_2367777 ) ) ( not ( = ?auto_2367771 ?auto_2367778 ) ) ( not ( = ?auto_2367771 ?auto_2367779 ) ) ( not ( = ?auto_2367771 ?auto_2367780 ) ) ( not ( = ?auto_2367771 ?auto_2367781 ) ) ( not ( = ?auto_2367771 ?auto_2367785 ) ) ( not ( = ?auto_2367772 ?auto_2367773 ) ) ( not ( = ?auto_2367772 ?auto_2367774 ) ) ( not ( = ?auto_2367772 ?auto_2367775 ) ) ( not ( = ?auto_2367772 ?auto_2367776 ) ) ( not ( = ?auto_2367772 ?auto_2367777 ) ) ( not ( = ?auto_2367772 ?auto_2367778 ) ) ( not ( = ?auto_2367772 ?auto_2367779 ) ) ( not ( = ?auto_2367772 ?auto_2367780 ) ) ( not ( = ?auto_2367772 ?auto_2367781 ) ) ( not ( = ?auto_2367772 ?auto_2367785 ) ) ( not ( = ?auto_2367773 ?auto_2367774 ) ) ( not ( = ?auto_2367773 ?auto_2367775 ) ) ( not ( = ?auto_2367773 ?auto_2367776 ) ) ( not ( = ?auto_2367773 ?auto_2367777 ) ) ( not ( = ?auto_2367773 ?auto_2367778 ) ) ( not ( = ?auto_2367773 ?auto_2367779 ) ) ( not ( = ?auto_2367773 ?auto_2367780 ) ) ( not ( = ?auto_2367773 ?auto_2367781 ) ) ( not ( = ?auto_2367773 ?auto_2367785 ) ) ( not ( = ?auto_2367774 ?auto_2367775 ) ) ( not ( = ?auto_2367774 ?auto_2367776 ) ) ( not ( = ?auto_2367774 ?auto_2367777 ) ) ( not ( = ?auto_2367774 ?auto_2367778 ) ) ( not ( = ?auto_2367774 ?auto_2367779 ) ) ( not ( = ?auto_2367774 ?auto_2367780 ) ) ( not ( = ?auto_2367774 ?auto_2367781 ) ) ( not ( = ?auto_2367774 ?auto_2367785 ) ) ( not ( = ?auto_2367775 ?auto_2367776 ) ) ( not ( = ?auto_2367775 ?auto_2367777 ) ) ( not ( = ?auto_2367775 ?auto_2367778 ) ) ( not ( = ?auto_2367775 ?auto_2367779 ) ) ( not ( = ?auto_2367775 ?auto_2367780 ) ) ( not ( = ?auto_2367775 ?auto_2367781 ) ) ( not ( = ?auto_2367775 ?auto_2367785 ) ) ( not ( = ?auto_2367776 ?auto_2367777 ) ) ( not ( = ?auto_2367776 ?auto_2367778 ) ) ( not ( = ?auto_2367776 ?auto_2367779 ) ) ( not ( = ?auto_2367776 ?auto_2367780 ) ) ( not ( = ?auto_2367776 ?auto_2367781 ) ) ( not ( = ?auto_2367776 ?auto_2367785 ) ) ( not ( = ?auto_2367777 ?auto_2367778 ) ) ( not ( = ?auto_2367777 ?auto_2367779 ) ) ( not ( = ?auto_2367777 ?auto_2367780 ) ) ( not ( = ?auto_2367777 ?auto_2367781 ) ) ( not ( = ?auto_2367777 ?auto_2367785 ) ) ( not ( = ?auto_2367778 ?auto_2367779 ) ) ( not ( = ?auto_2367778 ?auto_2367780 ) ) ( not ( = ?auto_2367778 ?auto_2367781 ) ) ( not ( = ?auto_2367778 ?auto_2367785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2367779 ?auto_2367780 ?auto_2367781 )
      ( MAKE-16CRATE-VERIFY ?auto_2367765 ?auto_2367766 ?auto_2367767 ?auto_2367768 ?auto_2367769 ?auto_2367770 ?auto_2367771 ?auto_2367772 ?auto_2367773 ?auto_2367774 ?auto_2367775 ?auto_2367776 ?auto_2367777 ?auto_2367778 ?auto_2367779 ?auto_2367780 ?auto_2367781 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368014 - SURFACE
      ?auto_2368015 - SURFACE
      ?auto_2368016 - SURFACE
      ?auto_2368017 - SURFACE
      ?auto_2368018 - SURFACE
      ?auto_2368019 - SURFACE
      ?auto_2368020 - SURFACE
      ?auto_2368021 - SURFACE
      ?auto_2368022 - SURFACE
      ?auto_2368023 - SURFACE
      ?auto_2368024 - SURFACE
      ?auto_2368025 - SURFACE
      ?auto_2368026 - SURFACE
      ?auto_2368027 - SURFACE
      ?auto_2368028 - SURFACE
      ?auto_2368029 - SURFACE
      ?auto_2368030 - SURFACE
    )
    :vars
    (
      ?auto_2368034 - HOIST
      ?auto_2368033 - PLACE
      ?auto_2368032 - PLACE
      ?auto_2368035 - HOIST
      ?auto_2368031 - SURFACE
      ?auto_2368036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368034 ?auto_2368033 ) ( IS-CRATE ?auto_2368030 ) ( not ( = ?auto_2368029 ?auto_2368030 ) ) ( not ( = ?auto_2368028 ?auto_2368029 ) ) ( not ( = ?auto_2368028 ?auto_2368030 ) ) ( not ( = ?auto_2368032 ?auto_2368033 ) ) ( HOIST-AT ?auto_2368035 ?auto_2368032 ) ( not ( = ?auto_2368034 ?auto_2368035 ) ) ( AVAILABLE ?auto_2368035 ) ( SURFACE-AT ?auto_2368030 ?auto_2368032 ) ( ON ?auto_2368030 ?auto_2368031 ) ( CLEAR ?auto_2368030 ) ( not ( = ?auto_2368029 ?auto_2368031 ) ) ( not ( = ?auto_2368030 ?auto_2368031 ) ) ( not ( = ?auto_2368028 ?auto_2368031 ) ) ( TRUCK-AT ?auto_2368036 ?auto_2368033 ) ( SURFACE-AT ?auto_2368028 ?auto_2368033 ) ( CLEAR ?auto_2368028 ) ( LIFTING ?auto_2368034 ?auto_2368029 ) ( IS-CRATE ?auto_2368029 ) ( ON ?auto_2368015 ?auto_2368014 ) ( ON ?auto_2368016 ?auto_2368015 ) ( ON ?auto_2368017 ?auto_2368016 ) ( ON ?auto_2368018 ?auto_2368017 ) ( ON ?auto_2368019 ?auto_2368018 ) ( ON ?auto_2368020 ?auto_2368019 ) ( ON ?auto_2368021 ?auto_2368020 ) ( ON ?auto_2368022 ?auto_2368021 ) ( ON ?auto_2368023 ?auto_2368022 ) ( ON ?auto_2368024 ?auto_2368023 ) ( ON ?auto_2368025 ?auto_2368024 ) ( ON ?auto_2368026 ?auto_2368025 ) ( ON ?auto_2368027 ?auto_2368026 ) ( ON ?auto_2368028 ?auto_2368027 ) ( not ( = ?auto_2368014 ?auto_2368015 ) ) ( not ( = ?auto_2368014 ?auto_2368016 ) ) ( not ( = ?auto_2368014 ?auto_2368017 ) ) ( not ( = ?auto_2368014 ?auto_2368018 ) ) ( not ( = ?auto_2368014 ?auto_2368019 ) ) ( not ( = ?auto_2368014 ?auto_2368020 ) ) ( not ( = ?auto_2368014 ?auto_2368021 ) ) ( not ( = ?auto_2368014 ?auto_2368022 ) ) ( not ( = ?auto_2368014 ?auto_2368023 ) ) ( not ( = ?auto_2368014 ?auto_2368024 ) ) ( not ( = ?auto_2368014 ?auto_2368025 ) ) ( not ( = ?auto_2368014 ?auto_2368026 ) ) ( not ( = ?auto_2368014 ?auto_2368027 ) ) ( not ( = ?auto_2368014 ?auto_2368028 ) ) ( not ( = ?auto_2368014 ?auto_2368029 ) ) ( not ( = ?auto_2368014 ?auto_2368030 ) ) ( not ( = ?auto_2368014 ?auto_2368031 ) ) ( not ( = ?auto_2368015 ?auto_2368016 ) ) ( not ( = ?auto_2368015 ?auto_2368017 ) ) ( not ( = ?auto_2368015 ?auto_2368018 ) ) ( not ( = ?auto_2368015 ?auto_2368019 ) ) ( not ( = ?auto_2368015 ?auto_2368020 ) ) ( not ( = ?auto_2368015 ?auto_2368021 ) ) ( not ( = ?auto_2368015 ?auto_2368022 ) ) ( not ( = ?auto_2368015 ?auto_2368023 ) ) ( not ( = ?auto_2368015 ?auto_2368024 ) ) ( not ( = ?auto_2368015 ?auto_2368025 ) ) ( not ( = ?auto_2368015 ?auto_2368026 ) ) ( not ( = ?auto_2368015 ?auto_2368027 ) ) ( not ( = ?auto_2368015 ?auto_2368028 ) ) ( not ( = ?auto_2368015 ?auto_2368029 ) ) ( not ( = ?auto_2368015 ?auto_2368030 ) ) ( not ( = ?auto_2368015 ?auto_2368031 ) ) ( not ( = ?auto_2368016 ?auto_2368017 ) ) ( not ( = ?auto_2368016 ?auto_2368018 ) ) ( not ( = ?auto_2368016 ?auto_2368019 ) ) ( not ( = ?auto_2368016 ?auto_2368020 ) ) ( not ( = ?auto_2368016 ?auto_2368021 ) ) ( not ( = ?auto_2368016 ?auto_2368022 ) ) ( not ( = ?auto_2368016 ?auto_2368023 ) ) ( not ( = ?auto_2368016 ?auto_2368024 ) ) ( not ( = ?auto_2368016 ?auto_2368025 ) ) ( not ( = ?auto_2368016 ?auto_2368026 ) ) ( not ( = ?auto_2368016 ?auto_2368027 ) ) ( not ( = ?auto_2368016 ?auto_2368028 ) ) ( not ( = ?auto_2368016 ?auto_2368029 ) ) ( not ( = ?auto_2368016 ?auto_2368030 ) ) ( not ( = ?auto_2368016 ?auto_2368031 ) ) ( not ( = ?auto_2368017 ?auto_2368018 ) ) ( not ( = ?auto_2368017 ?auto_2368019 ) ) ( not ( = ?auto_2368017 ?auto_2368020 ) ) ( not ( = ?auto_2368017 ?auto_2368021 ) ) ( not ( = ?auto_2368017 ?auto_2368022 ) ) ( not ( = ?auto_2368017 ?auto_2368023 ) ) ( not ( = ?auto_2368017 ?auto_2368024 ) ) ( not ( = ?auto_2368017 ?auto_2368025 ) ) ( not ( = ?auto_2368017 ?auto_2368026 ) ) ( not ( = ?auto_2368017 ?auto_2368027 ) ) ( not ( = ?auto_2368017 ?auto_2368028 ) ) ( not ( = ?auto_2368017 ?auto_2368029 ) ) ( not ( = ?auto_2368017 ?auto_2368030 ) ) ( not ( = ?auto_2368017 ?auto_2368031 ) ) ( not ( = ?auto_2368018 ?auto_2368019 ) ) ( not ( = ?auto_2368018 ?auto_2368020 ) ) ( not ( = ?auto_2368018 ?auto_2368021 ) ) ( not ( = ?auto_2368018 ?auto_2368022 ) ) ( not ( = ?auto_2368018 ?auto_2368023 ) ) ( not ( = ?auto_2368018 ?auto_2368024 ) ) ( not ( = ?auto_2368018 ?auto_2368025 ) ) ( not ( = ?auto_2368018 ?auto_2368026 ) ) ( not ( = ?auto_2368018 ?auto_2368027 ) ) ( not ( = ?auto_2368018 ?auto_2368028 ) ) ( not ( = ?auto_2368018 ?auto_2368029 ) ) ( not ( = ?auto_2368018 ?auto_2368030 ) ) ( not ( = ?auto_2368018 ?auto_2368031 ) ) ( not ( = ?auto_2368019 ?auto_2368020 ) ) ( not ( = ?auto_2368019 ?auto_2368021 ) ) ( not ( = ?auto_2368019 ?auto_2368022 ) ) ( not ( = ?auto_2368019 ?auto_2368023 ) ) ( not ( = ?auto_2368019 ?auto_2368024 ) ) ( not ( = ?auto_2368019 ?auto_2368025 ) ) ( not ( = ?auto_2368019 ?auto_2368026 ) ) ( not ( = ?auto_2368019 ?auto_2368027 ) ) ( not ( = ?auto_2368019 ?auto_2368028 ) ) ( not ( = ?auto_2368019 ?auto_2368029 ) ) ( not ( = ?auto_2368019 ?auto_2368030 ) ) ( not ( = ?auto_2368019 ?auto_2368031 ) ) ( not ( = ?auto_2368020 ?auto_2368021 ) ) ( not ( = ?auto_2368020 ?auto_2368022 ) ) ( not ( = ?auto_2368020 ?auto_2368023 ) ) ( not ( = ?auto_2368020 ?auto_2368024 ) ) ( not ( = ?auto_2368020 ?auto_2368025 ) ) ( not ( = ?auto_2368020 ?auto_2368026 ) ) ( not ( = ?auto_2368020 ?auto_2368027 ) ) ( not ( = ?auto_2368020 ?auto_2368028 ) ) ( not ( = ?auto_2368020 ?auto_2368029 ) ) ( not ( = ?auto_2368020 ?auto_2368030 ) ) ( not ( = ?auto_2368020 ?auto_2368031 ) ) ( not ( = ?auto_2368021 ?auto_2368022 ) ) ( not ( = ?auto_2368021 ?auto_2368023 ) ) ( not ( = ?auto_2368021 ?auto_2368024 ) ) ( not ( = ?auto_2368021 ?auto_2368025 ) ) ( not ( = ?auto_2368021 ?auto_2368026 ) ) ( not ( = ?auto_2368021 ?auto_2368027 ) ) ( not ( = ?auto_2368021 ?auto_2368028 ) ) ( not ( = ?auto_2368021 ?auto_2368029 ) ) ( not ( = ?auto_2368021 ?auto_2368030 ) ) ( not ( = ?auto_2368021 ?auto_2368031 ) ) ( not ( = ?auto_2368022 ?auto_2368023 ) ) ( not ( = ?auto_2368022 ?auto_2368024 ) ) ( not ( = ?auto_2368022 ?auto_2368025 ) ) ( not ( = ?auto_2368022 ?auto_2368026 ) ) ( not ( = ?auto_2368022 ?auto_2368027 ) ) ( not ( = ?auto_2368022 ?auto_2368028 ) ) ( not ( = ?auto_2368022 ?auto_2368029 ) ) ( not ( = ?auto_2368022 ?auto_2368030 ) ) ( not ( = ?auto_2368022 ?auto_2368031 ) ) ( not ( = ?auto_2368023 ?auto_2368024 ) ) ( not ( = ?auto_2368023 ?auto_2368025 ) ) ( not ( = ?auto_2368023 ?auto_2368026 ) ) ( not ( = ?auto_2368023 ?auto_2368027 ) ) ( not ( = ?auto_2368023 ?auto_2368028 ) ) ( not ( = ?auto_2368023 ?auto_2368029 ) ) ( not ( = ?auto_2368023 ?auto_2368030 ) ) ( not ( = ?auto_2368023 ?auto_2368031 ) ) ( not ( = ?auto_2368024 ?auto_2368025 ) ) ( not ( = ?auto_2368024 ?auto_2368026 ) ) ( not ( = ?auto_2368024 ?auto_2368027 ) ) ( not ( = ?auto_2368024 ?auto_2368028 ) ) ( not ( = ?auto_2368024 ?auto_2368029 ) ) ( not ( = ?auto_2368024 ?auto_2368030 ) ) ( not ( = ?auto_2368024 ?auto_2368031 ) ) ( not ( = ?auto_2368025 ?auto_2368026 ) ) ( not ( = ?auto_2368025 ?auto_2368027 ) ) ( not ( = ?auto_2368025 ?auto_2368028 ) ) ( not ( = ?auto_2368025 ?auto_2368029 ) ) ( not ( = ?auto_2368025 ?auto_2368030 ) ) ( not ( = ?auto_2368025 ?auto_2368031 ) ) ( not ( = ?auto_2368026 ?auto_2368027 ) ) ( not ( = ?auto_2368026 ?auto_2368028 ) ) ( not ( = ?auto_2368026 ?auto_2368029 ) ) ( not ( = ?auto_2368026 ?auto_2368030 ) ) ( not ( = ?auto_2368026 ?auto_2368031 ) ) ( not ( = ?auto_2368027 ?auto_2368028 ) ) ( not ( = ?auto_2368027 ?auto_2368029 ) ) ( not ( = ?auto_2368027 ?auto_2368030 ) ) ( not ( = ?auto_2368027 ?auto_2368031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2368028 ?auto_2368029 ?auto_2368030 )
      ( MAKE-16CRATE-VERIFY ?auto_2368014 ?auto_2368015 ?auto_2368016 ?auto_2368017 ?auto_2368018 ?auto_2368019 ?auto_2368020 ?auto_2368021 ?auto_2368022 ?auto_2368023 ?auto_2368024 ?auto_2368025 ?auto_2368026 ?auto_2368027 ?auto_2368028 ?auto_2368029 ?auto_2368030 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368263 - SURFACE
      ?auto_2368264 - SURFACE
      ?auto_2368265 - SURFACE
      ?auto_2368266 - SURFACE
      ?auto_2368267 - SURFACE
      ?auto_2368268 - SURFACE
      ?auto_2368269 - SURFACE
      ?auto_2368270 - SURFACE
      ?auto_2368271 - SURFACE
      ?auto_2368272 - SURFACE
      ?auto_2368273 - SURFACE
      ?auto_2368274 - SURFACE
      ?auto_2368275 - SURFACE
      ?auto_2368276 - SURFACE
      ?auto_2368277 - SURFACE
      ?auto_2368278 - SURFACE
      ?auto_2368279 - SURFACE
    )
    :vars
    (
      ?auto_2368284 - HOIST
      ?auto_2368283 - PLACE
      ?auto_2368285 - PLACE
      ?auto_2368280 - HOIST
      ?auto_2368282 - SURFACE
      ?auto_2368281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368284 ?auto_2368283 ) ( IS-CRATE ?auto_2368279 ) ( not ( = ?auto_2368278 ?auto_2368279 ) ) ( not ( = ?auto_2368277 ?auto_2368278 ) ) ( not ( = ?auto_2368277 ?auto_2368279 ) ) ( not ( = ?auto_2368285 ?auto_2368283 ) ) ( HOIST-AT ?auto_2368280 ?auto_2368285 ) ( not ( = ?auto_2368284 ?auto_2368280 ) ) ( AVAILABLE ?auto_2368280 ) ( SURFACE-AT ?auto_2368279 ?auto_2368285 ) ( ON ?auto_2368279 ?auto_2368282 ) ( CLEAR ?auto_2368279 ) ( not ( = ?auto_2368278 ?auto_2368282 ) ) ( not ( = ?auto_2368279 ?auto_2368282 ) ) ( not ( = ?auto_2368277 ?auto_2368282 ) ) ( TRUCK-AT ?auto_2368281 ?auto_2368283 ) ( SURFACE-AT ?auto_2368277 ?auto_2368283 ) ( CLEAR ?auto_2368277 ) ( IS-CRATE ?auto_2368278 ) ( AVAILABLE ?auto_2368284 ) ( IN ?auto_2368278 ?auto_2368281 ) ( ON ?auto_2368264 ?auto_2368263 ) ( ON ?auto_2368265 ?auto_2368264 ) ( ON ?auto_2368266 ?auto_2368265 ) ( ON ?auto_2368267 ?auto_2368266 ) ( ON ?auto_2368268 ?auto_2368267 ) ( ON ?auto_2368269 ?auto_2368268 ) ( ON ?auto_2368270 ?auto_2368269 ) ( ON ?auto_2368271 ?auto_2368270 ) ( ON ?auto_2368272 ?auto_2368271 ) ( ON ?auto_2368273 ?auto_2368272 ) ( ON ?auto_2368274 ?auto_2368273 ) ( ON ?auto_2368275 ?auto_2368274 ) ( ON ?auto_2368276 ?auto_2368275 ) ( ON ?auto_2368277 ?auto_2368276 ) ( not ( = ?auto_2368263 ?auto_2368264 ) ) ( not ( = ?auto_2368263 ?auto_2368265 ) ) ( not ( = ?auto_2368263 ?auto_2368266 ) ) ( not ( = ?auto_2368263 ?auto_2368267 ) ) ( not ( = ?auto_2368263 ?auto_2368268 ) ) ( not ( = ?auto_2368263 ?auto_2368269 ) ) ( not ( = ?auto_2368263 ?auto_2368270 ) ) ( not ( = ?auto_2368263 ?auto_2368271 ) ) ( not ( = ?auto_2368263 ?auto_2368272 ) ) ( not ( = ?auto_2368263 ?auto_2368273 ) ) ( not ( = ?auto_2368263 ?auto_2368274 ) ) ( not ( = ?auto_2368263 ?auto_2368275 ) ) ( not ( = ?auto_2368263 ?auto_2368276 ) ) ( not ( = ?auto_2368263 ?auto_2368277 ) ) ( not ( = ?auto_2368263 ?auto_2368278 ) ) ( not ( = ?auto_2368263 ?auto_2368279 ) ) ( not ( = ?auto_2368263 ?auto_2368282 ) ) ( not ( = ?auto_2368264 ?auto_2368265 ) ) ( not ( = ?auto_2368264 ?auto_2368266 ) ) ( not ( = ?auto_2368264 ?auto_2368267 ) ) ( not ( = ?auto_2368264 ?auto_2368268 ) ) ( not ( = ?auto_2368264 ?auto_2368269 ) ) ( not ( = ?auto_2368264 ?auto_2368270 ) ) ( not ( = ?auto_2368264 ?auto_2368271 ) ) ( not ( = ?auto_2368264 ?auto_2368272 ) ) ( not ( = ?auto_2368264 ?auto_2368273 ) ) ( not ( = ?auto_2368264 ?auto_2368274 ) ) ( not ( = ?auto_2368264 ?auto_2368275 ) ) ( not ( = ?auto_2368264 ?auto_2368276 ) ) ( not ( = ?auto_2368264 ?auto_2368277 ) ) ( not ( = ?auto_2368264 ?auto_2368278 ) ) ( not ( = ?auto_2368264 ?auto_2368279 ) ) ( not ( = ?auto_2368264 ?auto_2368282 ) ) ( not ( = ?auto_2368265 ?auto_2368266 ) ) ( not ( = ?auto_2368265 ?auto_2368267 ) ) ( not ( = ?auto_2368265 ?auto_2368268 ) ) ( not ( = ?auto_2368265 ?auto_2368269 ) ) ( not ( = ?auto_2368265 ?auto_2368270 ) ) ( not ( = ?auto_2368265 ?auto_2368271 ) ) ( not ( = ?auto_2368265 ?auto_2368272 ) ) ( not ( = ?auto_2368265 ?auto_2368273 ) ) ( not ( = ?auto_2368265 ?auto_2368274 ) ) ( not ( = ?auto_2368265 ?auto_2368275 ) ) ( not ( = ?auto_2368265 ?auto_2368276 ) ) ( not ( = ?auto_2368265 ?auto_2368277 ) ) ( not ( = ?auto_2368265 ?auto_2368278 ) ) ( not ( = ?auto_2368265 ?auto_2368279 ) ) ( not ( = ?auto_2368265 ?auto_2368282 ) ) ( not ( = ?auto_2368266 ?auto_2368267 ) ) ( not ( = ?auto_2368266 ?auto_2368268 ) ) ( not ( = ?auto_2368266 ?auto_2368269 ) ) ( not ( = ?auto_2368266 ?auto_2368270 ) ) ( not ( = ?auto_2368266 ?auto_2368271 ) ) ( not ( = ?auto_2368266 ?auto_2368272 ) ) ( not ( = ?auto_2368266 ?auto_2368273 ) ) ( not ( = ?auto_2368266 ?auto_2368274 ) ) ( not ( = ?auto_2368266 ?auto_2368275 ) ) ( not ( = ?auto_2368266 ?auto_2368276 ) ) ( not ( = ?auto_2368266 ?auto_2368277 ) ) ( not ( = ?auto_2368266 ?auto_2368278 ) ) ( not ( = ?auto_2368266 ?auto_2368279 ) ) ( not ( = ?auto_2368266 ?auto_2368282 ) ) ( not ( = ?auto_2368267 ?auto_2368268 ) ) ( not ( = ?auto_2368267 ?auto_2368269 ) ) ( not ( = ?auto_2368267 ?auto_2368270 ) ) ( not ( = ?auto_2368267 ?auto_2368271 ) ) ( not ( = ?auto_2368267 ?auto_2368272 ) ) ( not ( = ?auto_2368267 ?auto_2368273 ) ) ( not ( = ?auto_2368267 ?auto_2368274 ) ) ( not ( = ?auto_2368267 ?auto_2368275 ) ) ( not ( = ?auto_2368267 ?auto_2368276 ) ) ( not ( = ?auto_2368267 ?auto_2368277 ) ) ( not ( = ?auto_2368267 ?auto_2368278 ) ) ( not ( = ?auto_2368267 ?auto_2368279 ) ) ( not ( = ?auto_2368267 ?auto_2368282 ) ) ( not ( = ?auto_2368268 ?auto_2368269 ) ) ( not ( = ?auto_2368268 ?auto_2368270 ) ) ( not ( = ?auto_2368268 ?auto_2368271 ) ) ( not ( = ?auto_2368268 ?auto_2368272 ) ) ( not ( = ?auto_2368268 ?auto_2368273 ) ) ( not ( = ?auto_2368268 ?auto_2368274 ) ) ( not ( = ?auto_2368268 ?auto_2368275 ) ) ( not ( = ?auto_2368268 ?auto_2368276 ) ) ( not ( = ?auto_2368268 ?auto_2368277 ) ) ( not ( = ?auto_2368268 ?auto_2368278 ) ) ( not ( = ?auto_2368268 ?auto_2368279 ) ) ( not ( = ?auto_2368268 ?auto_2368282 ) ) ( not ( = ?auto_2368269 ?auto_2368270 ) ) ( not ( = ?auto_2368269 ?auto_2368271 ) ) ( not ( = ?auto_2368269 ?auto_2368272 ) ) ( not ( = ?auto_2368269 ?auto_2368273 ) ) ( not ( = ?auto_2368269 ?auto_2368274 ) ) ( not ( = ?auto_2368269 ?auto_2368275 ) ) ( not ( = ?auto_2368269 ?auto_2368276 ) ) ( not ( = ?auto_2368269 ?auto_2368277 ) ) ( not ( = ?auto_2368269 ?auto_2368278 ) ) ( not ( = ?auto_2368269 ?auto_2368279 ) ) ( not ( = ?auto_2368269 ?auto_2368282 ) ) ( not ( = ?auto_2368270 ?auto_2368271 ) ) ( not ( = ?auto_2368270 ?auto_2368272 ) ) ( not ( = ?auto_2368270 ?auto_2368273 ) ) ( not ( = ?auto_2368270 ?auto_2368274 ) ) ( not ( = ?auto_2368270 ?auto_2368275 ) ) ( not ( = ?auto_2368270 ?auto_2368276 ) ) ( not ( = ?auto_2368270 ?auto_2368277 ) ) ( not ( = ?auto_2368270 ?auto_2368278 ) ) ( not ( = ?auto_2368270 ?auto_2368279 ) ) ( not ( = ?auto_2368270 ?auto_2368282 ) ) ( not ( = ?auto_2368271 ?auto_2368272 ) ) ( not ( = ?auto_2368271 ?auto_2368273 ) ) ( not ( = ?auto_2368271 ?auto_2368274 ) ) ( not ( = ?auto_2368271 ?auto_2368275 ) ) ( not ( = ?auto_2368271 ?auto_2368276 ) ) ( not ( = ?auto_2368271 ?auto_2368277 ) ) ( not ( = ?auto_2368271 ?auto_2368278 ) ) ( not ( = ?auto_2368271 ?auto_2368279 ) ) ( not ( = ?auto_2368271 ?auto_2368282 ) ) ( not ( = ?auto_2368272 ?auto_2368273 ) ) ( not ( = ?auto_2368272 ?auto_2368274 ) ) ( not ( = ?auto_2368272 ?auto_2368275 ) ) ( not ( = ?auto_2368272 ?auto_2368276 ) ) ( not ( = ?auto_2368272 ?auto_2368277 ) ) ( not ( = ?auto_2368272 ?auto_2368278 ) ) ( not ( = ?auto_2368272 ?auto_2368279 ) ) ( not ( = ?auto_2368272 ?auto_2368282 ) ) ( not ( = ?auto_2368273 ?auto_2368274 ) ) ( not ( = ?auto_2368273 ?auto_2368275 ) ) ( not ( = ?auto_2368273 ?auto_2368276 ) ) ( not ( = ?auto_2368273 ?auto_2368277 ) ) ( not ( = ?auto_2368273 ?auto_2368278 ) ) ( not ( = ?auto_2368273 ?auto_2368279 ) ) ( not ( = ?auto_2368273 ?auto_2368282 ) ) ( not ( = ?auto_2368274 ?auto_2368275 ) ) ( not ( = ?auto_2368274 ?auto_2368276 ) ) ( not ( = ?auto_2368274 ?auto_2368277 ) ) ( not ( = ?auto_2368274 ?auto_2368278 ) ) ( not ( = ?auto_2368274 ?auto_2368279 ) ) ( not ( = ?auto_2368274 ?auto_2368282 ) ) ( not ( = ?auto_2368275 ?auto_2368276 ) ) ( not ( = ?auto_2368275 ?auto_2368277 ) ) ( not ( = ?auto_2368275 ?auto_2368278 ) ) ( not ( = ?auto_2368275 ?auto_2368279 ) ) ( not ( = ?auto_2368275 ?auto_2368282 ) ) ( not ( = ?auto_2368276 ?auto_2368277 ) ) ( not ( = ?auto_2368276 ?auto_2368278 ) ) ( not ( = ?auto_2368276 ?auto_2368279 ) ) ( not ( = ?auto_2368276 ?auto_2368282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2368277 ?auto_2368278 ?auto_2368279 )
      ( MAKE-16CRATE-VERIFY ?auto_2368263 ?auto_2368264 ?auto_2368265 ?auto_2368266 ?auto_2368267 ?auto_2368268 ?auto_2368269 ?auto_2368270 ?auto_2368271 ?auto_2368272 ?auto_2368273 ?auto_2368274 ?auto_2368275 ?auto_2368276 ?auto_2368277 ?auto_2368278 ?auto_2368279 ) )
  )

)

