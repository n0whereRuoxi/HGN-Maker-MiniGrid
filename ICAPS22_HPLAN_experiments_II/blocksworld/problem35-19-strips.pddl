( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b492 - block
    b293 - block
    b440 - block
    b574 - block
    b16 - block
    b937 - block
    b953 - block
    b236 - block
    b193 - block
    b102 - block
    b649 - block
    b399 - block
    b402 - block
    b610 - block
    b768 - block
    b301 - block
    b126 - block
    b269 - block
    b979 - block
    b899 - block
    b789 - block
    b615 - block
    b560 - block
    b11 - block
    b586 - block
    b860 - block
    b480 - block
    b489 - block
    b851 - block
    b491 - block
    b146 - block
    b677 - block
    b633 - block
    b26 - block
    b710 - block
    b532 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b492 )
    ( on b293 b492 )
    ( on b440 b293 )
    ( on b574 b440 )
    ( on b16 b574 )
    ( on b937 b16 )
    ( on b953 b937 )
    ( on b236 b953 )
    ( on b193 b236 )
    ( on b102 b193 )
    ( on b649 b102 )
    ( on b399 b649 )
    ( on b402 b399 )
    ( on b610 b402 )
    ( on b768 b610 )
    ( on b301 b768 )
    ( on b126 b301 )
    ( on b269 b126 )
    ( on b979 b269 )
    ( on b899 b979 )
    ( on b789 b899 )
    ( on b615 b789 )
    ( on b560 b615 )
    ( on b11 b560 )
    ( on b586 b11 )
    ( on b860 b586 )
    ( on b480 b860 )
    ( on b489 b480 )
    ( on b851 b489 )
    ( on b491 b851 )
    ( on b146 b491 )
    ( on b677 b146 )
    ( on b633 b677 )
    ( on b26 b633 )
    ( on b710 b26 )
    ( on b532 b710 )
    ( clear b532 )
  )
  ( :goal
    ( and
      ( clear b492 )
    )
  )
)
