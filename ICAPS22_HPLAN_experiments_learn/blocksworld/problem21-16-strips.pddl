( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b127 - block
    b52 - block
    b58 - block
    b410 - block
    b605 - block
    b4 - block
    b698 - block
    b227 - block
    b277 - block
    b278 - block
    b789 - block
    b994 - block
    b21 - block
    b661 - block
    b787 - block
    b641 - block
    b247 - block
    b252 - block
    b295 - block
    b7 - block
    b812 - block
    b554 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b127 )
    ( on b52 b127 )
    ( on b58 b52 )
    ( on b410 b58 )
    ( on b605 b410 )
    ( on b4 b605 )
    ( on b698 b4 )
    ( on b227 b698 )
    ( on b277 b227 )
    ( on b278 b277 )
    ( on b789 b278 )
    ( on b994 b789 )
    ( on b21 b994 )
    ( on b661 b21 )
    ( on b787 b661 )
    ( on b641 b787 )
    ( on b247 b641 )
    ( on b252 b247 )
    ( on b295 b252 )
    ( on b7 b295 )
    ( on b812 b7 )
    ( on b554 b812 )
    ( clear b554 )
  )
  ( :goal
    ( and
      ( clear b127 )
    )
  )
)
