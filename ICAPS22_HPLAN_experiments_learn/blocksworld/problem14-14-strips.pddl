( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b566 - block
    b16 - block
    b884 - block
    b781 - block
    b640 - block
    b421 - block
    b903 - block
    b177 - block
    b576 - block
    b419 - block
    b961 - block
    b245 - block
    b703 - block
    b443 - block
    b967 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b566 )
    ( on b16 b566 )
    ( on b884 b16 )
    ( on b781 b884 )
    ( on b640 b781 )
    ( on b421 b640 )
    ( on b903 b421 )
    ( on b177 b903 )
    ( on b576 b177 )
    ( on b419 b576 )
    ( on b961 b419 )
    ( on b245 b961 )
    ( on b703 b245 )
    ( on b443 b703 )
    ( on b967 b443 )
    ( clear b967 )
  )
  ( :goal
    ( and
      ( clear b566 )
    )
  )
)
