( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b803 - block
    b608 - block
    b624 - block
    b334 - block
    b460 - block
    b591 - block
    b106 - block
    b794 - block
    b421 - block
    b768 - block
    b496 - block
    b15 - block
    b559 - block
    b875 - block
    b712 - block
    b535 - block
    b292 - block
    b735 - block
    b561 - block
    b254 - block
    b181 - block
    b84 - block
    b466 - block
    b274 - block
    b652 - block
    b653 - block
    b972 - block
    b584 - block
    b824 - block
    b232 - block
    b111 - block
    b198 - block
    b345 - block
    b129 - block
    b302 - block
    b455 - block
    b370 - block
    b811 - block
    b675 - block
    b136 - block
    b604 - block
    b965 - block
    b499 - block
    b173 - block
    b583 - block
    b418 - block
    b529 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b803 )
    ( on b608 b803 )
    ( on b624 b608 )
    ( on b334 b624 )
    ( on b460 b334 )
    ( on b591 b460 )
    ( on b106 b591 )
    ( on b794 b106 )
    ( on b421 b794 )
    ( on b768 b421 )
    ( on b496 b768 )
    ( on b15 b496 )
    ( on b559 b15 )
    ( on b875 b559 )
    ( on b712 b875 )
    ( on b535 b712 )
    ( on b292 b535 )
    ( on b735 b292 )
    ( on b561 b735 )
    ( on b254 b561 )
    ( on b181 b254 )
    ( on b84 b181 )
    ( on b466 b84 )
    ( on b274 b466 )
    ( on b652 b274 )
    ( on b653 b652 )
    ( on b972 b653 )
    ( on b584 b972 )
    ( on b824 b584 )
    ( on b232 b824 )
    ( on b111 b232 )
    ( on b198 b111 )
    ( on b345 b198 )
    ( on b129 b345 )
    ( on b302 b129 )
    ( on b455 b302 )
    ( on b370 b455 )
    ( on b811 b370 )
    ( on b675 b811 )
    ( on b136 b675 )
    ( on b604 b136 )
    ( on b965 b604 )
    ( on b499 b965 )
    ( on b173 b499 )
    ( on b583 b173 )
    ( on b418 b583 )
    ( on b529 b418 )
    ( clear b529 )
  )
  ( :goal
    ( and
      ( clear b803 )
    )
  )
)
