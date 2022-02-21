( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b576 - block
    b887 - block
    b402 - block
    b824 - block
    b388 - block
    b32 - block
    b541 - block
    b833 - block
    b98 - block
    b489 - block
    b245 - block
    b935 - block
    b138 - block
    b454 - block
    b673 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b576 )
    ( on b887 b576 )
    ( on b402 b887 )
    ( on b824 b402 )
    ( on b388 b824 )
    ( on b32 b388 )
    ( on b541 b32 )
    ( on b833 b541 )
    ( on b98 b833 )
    ( on b489 b98 )
    ( on b245 b489 )
    ( on b935 b245 )
    ( on b138 b935 )
    ( on b454 b138 )
    ( on b673 b454 )
    ( clear b673 )
  )
  ( :goal
    ( and
      ( clear b576 )
    )
  )
)
