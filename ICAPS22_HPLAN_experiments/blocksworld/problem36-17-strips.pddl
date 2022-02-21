( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b985 - block
    b200 - block
    b234 - block
    b94 - block
    b14 - block
    b681 - block
    b457 - block
    b683 - block
    b242 - block
    b995 - block
    b473 - block
    b409 - block
    b165 - block
    b599 - block
    b499 - block
    b126 - block
    b573 - block
    b435 - block
    b162 - block
    b17 - block
    b531 - block
    b96 - block
    b211 - block
    b927 - block
    b495 - block
    b323 - block
    b752 - block
    b433 - block
    b585 - block
    b908 - block
    b213 - block
    b576 - block
    b483 - block
    b436 - block
    b735 - block
    b374 - block
    b371 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b985 )
    ( on b200 b985 )
    ( on b234 b200 )
    ( on b94 b234 )
    ( on b14 b94 )
    ( on b681 b14 )
    ( on b457 b681 )
    ( on b683 b457 )
    ( on b242 b683 )
    ( on b995 b242 )
    ( on b473 b995 )
    ( on b409 b473 )
    ( on b165 b409 )
    ( on b599 b165 )
    ( on b499 b599 )
    ( on b126 b499 )
    ( on b573 b126 )
    ( on b435 b573 )
    ( on b162 b435 )
    ( on b17 b162 )
    ( on b531 b17 )
    ( on b96 b531 )
    ( on b211 b96 )
    ( on b927 b211 )
    ( on b495 b927 )
    ( on b323 b495 )
    ( on b752 b323 )
    ( on b433 b752 )
    ( on b585 b433 )
    ( on b908 b585 )
    ( on b213 b908 )
    ( on b576 b213 )
    ( on b483 b576 )
    ( on b436 b483 )
    ( on b735 b436 )
    ( on b374 b735 )
    ( on b371 b374 )
    ( clear b371 )
  )
  ( :goal
    ( and
      ( clear b985 )
    )
  )
)
