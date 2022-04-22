( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b19 - block
    b301 - block
    b35 - block
    b426 - block
    b700 - block
    b900 - block
    b381 - block
    b920 - block
    b391 - block
    b786 - block
    b441 - block
    b857 - block
    b236 - block
    b743 - block
    b541 - block
    b884 - block
    b991 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b19 )
    ( on b301 b19 )
    ( on b35 b301 )
    ( on b426 b35 )
    ( on b700 b426 )
    ( on b900 b700 )
    ( on b381 b900 )
    ( on b920 b381 )
    ( on b391 b920 )
    ( on b786 b391 )
    ( on b441 b786 )
    ( on b857 b441 )
    ( on b236 b857 )
    ( on b743 b236 )
    ( on b541 b743 )
    ( on b884 b541 )
    ( on b991 b884 )
    ( clear b991 )
  )
  ( :goal
    ( and
      ( clear b19 )
    )
  )
)
